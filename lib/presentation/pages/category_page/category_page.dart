import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/presentation/pages/category_page/cubit/category_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/cards/abbreviated_task_card.dart';

@RoutePage()
class CategoryPage extends StatelessWidget implements AutoRouteWrapper {
  final Category category;
  const CategoryPage({Key? key, required this.category}) : super(key: key);

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
        title: Text(category.title, style: AppTextStyles.bold20),
      ),
      body: BlocBuilder<CategoryPageCubit, CategoryPageState>(
        builder: (context, state) {
          return state.map(
            loading: (_) => const CircularProgressIndicator(
              color: AppColors.headblue,
            ).toCenter(),
            loaded: (loaded) {
              return loaded.tasks.isEmpty
                  ? Text(
                      "В этой категории нет ни одной задачи",
                      style: AppTextStyles.regular12.copyWith(fontSize: 14.sp),
                    ).toCenter()
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast,
                      ),
                      itemCount: loaded.tasks.length,
                      itemBuilder: (context, index) {
                        return AbbreviatedTaskCard(task: loaded.tasks[index])
                            .paddingSymmetric(vertical: 7.h);
                      },
                    );
            },
          );
        },
      ).paddingAll(10.r),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CategoryPageCubit>(
      create: (context) =>
          getIt<CategoryPageCubit>()..init(ids: category.tasks),
      child: this,
    );
  }
}
