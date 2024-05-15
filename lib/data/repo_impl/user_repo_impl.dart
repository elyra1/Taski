import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/data/firebase_collections.dart';
import 'package:taski/domain/repositories/user_repository.dart';
import 'package:taski/domain/entities/user_model.dart';

@Singleton(as: UserRepository)
class UserRepoImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  UserRepoImpl(this._firebaseAuth, this._firebaseFirestore);

  // Методы авторизации
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
    await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .update({"fcmToken": null});
    await _firebaseAuth.signOut();
  }

  //методы работы с пользователями
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
    final stream = _firebaseFirestore
        .collection(FirebaseCollections.users)
        .orderBy('username')
        .snapshots();
    return stream
        .map((event) => event.docs.map((e) => UserModel.fromJson(e.data())));
  }

  @override
  Stream<UserModel> getCurrentUserStream() {
    return _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((snapshot) => UserModel.fromJson(snapshot.data()!));
  }

  //система друзей
  @override
  Future<void> acceptFriendRequest({required String userId}) async {
    final currentUser = await getUser();
    final updatedUser = currentUser.copyWith(
      requests: List.from(currentUser.requests)..remove(userId),
      friendsIds: List.from(currentUser.friendsIds)..add(userId),
    );
    final newFriend = await getUser(userId: userId);
    final updatedNewFriend = newFriend.copyWith(
      friendsIds: List.from(newFriend.friendsIds)..add(currentUser.id),
    );

    await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .set(updatedUser.toJson());

    await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(userId)
        .set(updatedNewFriend.toJson());
  }

  @override
  Future<void> declineFriendRequest({required String userId}) async {
    final currentUser = await getUser();
    final updatedUser = currentUser.copyWith(
      requests: List.from(currentUser.requests)..remove(userId),
    );
    await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .set(updatedUser.toJson());
  }

  @override
  Future<void> deleteFromFriends({required String userId}) async {
    final currentUser = await getUser();
    final friend = await getUser(userId: userId);
    final updatedUser = currentUser.copyWith(
      friendsIds: List.from(currentUser.friendsIds)..remove(userId),
    );
    final updatedFriend = friend.copyWith(
      friendsIds: List.from(friend.friendsIds)..remove(currentUser.id),
    );
    await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .set(updatedUser.toJson());

    await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(userId)
        .set(updatedFriend.toJson());
  }

  @override
  Future<void> sendFriendRequest({required String userId}) async {
    final requestUser = await getUser(userId: userId);
    final currentUser = await getUser();
    final updatedRequestUser = requestUser.copyWith(
      requests: List.from(requestUser.requests)..add(currentUser.id),
    );
    await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(userId)
        .set(updatedRequestUser.toJson());
  }

  @override
  Future<void> undoFriendRequest({required String userId}) async {
    final requestUser = await getUser(userId: userId);
    final currentUser = await getUser();
    final updatedRequestUser = requestUser.copyWith(
      requests: List.from(requestUser.requests)..remove(currentUser.id),
    );
    await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(userId)
        .set(updatedRequestUser.toJson());
  }

  @override
  Future<void> editProfile({required UserModel user}) async {
    await _firebaseFirestore
        .collection(FirebaseCollections.users)
        .doc(user.id)
        .set(user.toJson());
  }
}
