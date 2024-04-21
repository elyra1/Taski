import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/create_category_page/cubit/create_category_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/utils/validation.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
import 'package:taski/presentation/widgets/dialogs/saving_dialog.dart';
import 'package:taski/presentation/widgets/items/color_pick_item.dart';

@RoutePage()
class CreateCategoryPage extends StatefulWidget implements AutoRouteWrapper {
  final Category? category;
  const CreateCategoryPage({Key? key, this.category}) : super(key: key);

  @override
  State<CreateCategoryPage> createState() => _CreateCategoryPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CreateCategoryPageCubit>(
      create: (context) => getIt<CreateCategoryPageCubit>(),
      child: this,
    );
  }
}

class _CreateCategoryPageState extends State<CreateCategoryPage> {
  late TextEditingController titleController;
  late Color selectedColor;
  List<Color> colors = [
    AppColors.green,
    AppColors.blue,
    AppColors.red,
    AppColors.orange,
  ];

  @override
  void initState() {
    titleController = TextEditingController(text: widget.category?.title);
    selectedColor = widget.category?.color == null
        ? AppColors.green
        : Color(widget.category!.color);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            height: 1.h,
            width: double.maxFinite,
            color: AppColors.headblue,
          ),
        ),
        backgroundColor: AppColors.basewhite,
        leading: const BackButton(
          color: AppColors.headblue,
        ),
        title: Text(
          widget.category != null ? "Редактирование" : 'Создание категории',
          style: AppTextStyles.bold20,
        ),
      ),
      body: BlocListener<CreateCategoryPageCubit, CreateCategoryPageState>(
        listener: (context, state) {
          if (state == const CreateCategoryPageState.saving()) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const SavingDialog();
              },
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.h.heightBox,
            AppTextField(
              title: 'Название',
              hintText: 'Введите название категории',
              width: 345.w,
              height: 70.h,
              controller: titleController,
              textInputAction: TextInputAction.next,
            ),
            15.h.heightBox,
            Text(
              'Выберите цвет',
              style: AppTextStyles.semibold20.copyWith(fontSize: 18),
            ).paddingOnly(left: 15.w).alignAtCenterLeft(),
            5.h.heightBox,
            Row(
              children: [
                for (Color color in colors) ...[
                  ColorPickItem(
                    color: color,
                    onTap: () => setState(() => selectedColor = color),
                    isSelected: color == selectedColor,
                  ),
                  10.w.widthBox,
                ]
              ],
            ).paddingOnly(left: 15.w).alignAtCenterLeft(),
            15.h.heightBox,
            CustomButton(
              width: 129.w,
              height: 40.h,
              text: "Сохранить",
              onPressed: () async {
                bool titleIsEmpty = titleController.text == '';
                final category = Category(
                  title: titleController.text,
                  id: '',
                  authorId: '',
                  color: selectedColor.value,
                );
                if (titleIsEmpty) {
                  Validation.showAppSnackBar(
                    text: 'Название не может быть пустым.',
                    context: context,
                  );
                } else {
                  final textError = widget.category != null
                      ? await context
                          .read<CreateCategoryPageCubit>()
                          .editCategory(
                            widget.category!.copyWith(
                              title: titleController.text,
                              color: selectedColor.value,
                            ),
                          )
                      : await context
                          .read<CreateCategoryPageCubit>()
                          .addCategory(category);
                  if (textError != null && context.mounted) {
                    Validation.showAppSnackBar(
                      text: textError,
                      context: context,
                    );
                  } else {
                    if (context.mounted) {
                      if (widget.category != null) {
                        context.router.popUntil(
                            (route) => route.settings.name == ProfilePage.name);
                        context.router.push(const CategoriesPage());
                      } else {
                        context.router.pop();
                      }
                    }
                  }
                }
              },
            ).alignAtCenterRight(),
            if (widget.category != null) ...[
              TextButton(
                onPressed: () async {
                  await context
                      .read<CreateCategoryPageCubit>()
                      .deleteCategory(widget.category!);
                  context.router.pop().then((value) => context.router.pop());
                },
                child: Text(
                  "Удалить категорию",
                  style: AppTextStyles.semibold12.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ).paddingOnly(top: 350.h).toCenter(),
            ]
          ],
        ),
      ).paddingAll(15.r),
    );
  }
}
