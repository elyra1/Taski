import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/app_bars/main_app_bar.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
import 'package:taski/presentation/widgets/buttons/task_card.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          children: [
            30.h.heightBox,
            StreamBuilder(
              stream: context.read<ExamplePageCubit>().getTasks(),
              builder: (context, snapshot) {
                final tasks = snapshot.data ?? [];
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: () => context
                          .read<ExamplePageCubit>()
                          .deleteTask(tasks[index]),
                      child: TaskCard(
                        task: tasks[index],
                        onTap: () {},
                        width: 300.w,
                        height: 135.h,
                      ).paddingSymmetric(vertical: 5.h),
                    );
                  },
                );
              },
            ),
            CustomButton(
              width: 200.w,
              height: 50.h,
              onPressed: () {
                context
                    .read<ExamplePageCubit>()
                    .addTask(Task.getEmpty()
                        .copyWith(description: "123" * Random().nextInt(20)))
                    .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Добавлена задача'))));
              },
              text: 'Добавить задачу',
            ),
            Text(
              "Здесь вы пишете ваше содержимое, что вам нужно по верстке.",
              style: AppTextStyles.bold20,
            ),
            Divider(
              thickness: 2.h,
              color: AppColors.headblue,
            ),
            15.h.heightBox,
            Text(
              "Без библиотеки, мы делали отступы при помощи SizedBox(widgth: <ширина отступа>), SizedBox(height: <высота отступа>) - для горизонтали/вертикали соответственно",
              style: AppTextStyles.regular18.copyWith(fontSize: 14.sp),
            ),
            10.h.heightBox,
            Text(
              "Но при помощи библиотеки awesome_extensions мы делаем отступы между виджетами, не портя красоту кода(под капотом тот же код, что и выше, но использовать быстрее и красивее)",
              style: AppTextStyles.regular18.copyWith(fontSize: 14.sp),
            ),
            10.heightBox,
            Text(
              "<количество пикселей>.<h или w, по вертикали или по горизонтали>.<heightBox / widthBox, по вертикали или по горизонтали соответственно>",
              style: AppTextStyles.regular18.copyWith(fontSize: 14.sp),
            ),
            10.heightBox,
            Text(
              "Пример: 10.h.heightBox - создаем отступ по вертикали на 10.h",
              style: AppTextStyles.regular18.copyWith(fontSize: 14.sp),
            ),
            10.heightBox,
            Text(
              "Пример: 10.w.widthBox - создаем отступ по горизонтали на 10.w",
              style: AppTextStyles.regular18.copyWith(fontSize: 14.sp),
            ),
            Divider(
              thickness: 2.h,
              color: AppColors.headblue,
            ),
            10.heightBox,
            Text(
              "Если у вас не обычный AppBar, а например со стрелкой - в параметр appBar у Scaffold передаёте AppBar(...тут ваши параметры...)",
              style: AppTextStyles.bold18.copyWith(fontSize: 14.sp),
            ),
            10.heightBox,
            Text(
              "Для создания новой страницы, для начала, если не понимаете, можете скопировать папку ExamplePage, и создать такую же, но переименовав её(название файлов, классов в том числе) в создаваемую вами страницу.",
              style: AppTextStyles.bold18.copyWith(fontSize: 14.sp),
            ),
            10.heightBox,
            Text(
              "Чтобы протестить свою страницу, находите папку navigation,в файле auto_router.dart заменяете ExamplePage на Вашу страницу, после чего гененрируете файлы, вызвав команду: ",
              style: AppTextStyles.bold18.copyWith(fontSize: 14.sp),
            ),
            Text(
              "flutter pub run build_runner build --delete-conflicting-outputs",
              style: AppTextStyles.bold18.copyWith(fontSize: 14.sp),
            ),
            Text(
              "После чего ждете, пока сгенерируются новые файлы, и потом перезагружаете приложение. ",
              style: AppTextStyles.bold18.copyWith(fontSize: 14.sp),
            ),
            10.heightBox,
            Text(
              "Перед отправкой в ветку, не забываем сделать pull с мейна, исправить конфликты(если они есть), отформатировать код, проставить запятые после скобочек там, где можно, еще раз отформатировать код)",
              style: AppTextStyles.bold18.copyWith(fontStyle: FontStyle.italic),
            ),
            5.h.heightBox,
            Text(
              "Также, в navigation, в auto_router.dart обратно возвращаем ExamplePage, и снова генерируем файлы",
              style: AppTextStyles.bold18.copyWith(fontStyle: FontStyle.italic),
            ),
            10.heightBox,
            Text(
              "Ну и как обычно, будут вопросы, пишите в лс",
              style: AppTextStyles.bold18.copyWith(fontSize: 14.sp),
            ),
          ],
        ).toCenter(),
      ),
    );
  }
}
