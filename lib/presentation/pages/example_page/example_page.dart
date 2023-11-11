import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/user_entity.dart';
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

@RoutePage()
class ExamplePage extends StatelessWidget implements AutoRouteWrapper {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore fb = getIt<FirebaseFirestore>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Вы нажали на", style: AppTextStyles.bold18),
          Text("Вы нажали на", style: AppTextStyles.bold20),
          Text("Вы нажали на", style: AppTextStyles.bold24),
          Text("Вы нажали на", style: AppTextStyles.regular18),
          Text("Вы нажали на", style: AppTextStyles.regular20),
          Text("Вы нажали на", style: AppTextStyles.regular24),
          ElevatedButton(
              onPressed: () => fb
                      .collection("Tasks")
                      .doc('t2eZB3eAOvxkAoS6Ruhg')
                      .get()
                      .then((value) {
                    log(value.data()?['name']);
                    log(UserEntity.getEmpty().friendsIds.toString());
                  }),
              child: Text('Нажми')),
        ],
      ).toCenter(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ExamplePageCubit>(
      create: (context) => getIt<ExamplePageCubit>(),
      child: this,
    );
  }
}
