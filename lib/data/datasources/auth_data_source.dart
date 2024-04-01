import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/data/firebase_collections.dart';
import 'package:taski/domain/repositories/auth_repository.dart';
import 'package:taski/domain/entities/user_model.dart';

@Singleton(as: AuthRepository)
class AuthDataSource implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  AuthDataSource(this._firebaseAuth, this._firebaseFirestore);

  @override
  Future<UserModel> signIn(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = await getUser();
    return user;
  }

  @override
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final UserModel newUser = UserModel(
      email: email,
      username: username,
      id: userCredential.user!.uid,
    );
    await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(userCredential.user!.uid)
        .set(newUser.toJson());
  }

  @override
  Future<UserModel> getUser({String? userId}) async {
    final uid = userId ?? _firebaseAuth.currentUser!.uid;
    final json = await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(uid)
        .get();
    return UserModel.fromJson(json.data()!);
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  bool get isUserAuthorizedWithEmail {
    return _firebaseAuth.currentUser != null;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<List<UserModel>> getUserFriends() async {
    final user = await getUser();
    List<UserModel> friends = [];
    for (String userId in user.friendsIds) {
      final friend = await getUser(userId: userId);
      friends.add(friend);
    }
    return friends;
  }

  @override
  Stream<Iterable<UserModel>> getUsersStream() {
    final a = _firebaseFirestore
        .collection(FirebaseCollections.users)
        .orderBy('username')
        .snapshots();
    return a
        .map((event) => event.docs.map((e) => UserModel.fromJson(e.data())));
  }
}
