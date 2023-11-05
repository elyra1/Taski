import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart';

@RoutePage()
class ExamplePage extends StatefulWidget implements AutoRouteWrapper {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ExamplePageCubit>(
      create: (context) => getIt<ExamplePageCubit>(),
      child: this,
    );
  }
}

class _ExamplePageState extends State<ExamplePage> {
  final FirebaseFirestore fb = getIt<FirebaseFirestore>();
  final url =
      "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(url),
          ElevatedButton(
            onPressed: () async {
              final snapshot =
                  await fb.collection("asd").doc("tsQ3vGYHvtrZ8O7bDfWx").get();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(snapshot.data()?["name"] ?? "null"),
                ),
              );
            },
            child: const Text("EXAMPLE PAGE"),
          ).toCenter(),
        ],
      ),
    );
  }
}
