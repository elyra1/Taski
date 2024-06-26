import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/categories_page/cubit/categories_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/cards/category_card.dart';

@RoutePage()
class CategoriesPage extends StatefulWidget implements AutoRouteWrapper {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CategoriesPageCubit>(
      create: (context) => getIt<CategoriesPageCubit>()..init(),
      child: this,
    );
  }
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CategoriesPageCubit>();
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
        actions: [
          IconButton(
            onPressed: () => context.router
                .push(CreateCategoryPage())
                .then((value) async => await cubit.init()),
            icon: const Icon(
              Icons.add,
              color: AppColors.headblue,
            ),
          ),
        ],
        title: Text('Категории', style: AppTextStyles.bold20),
      ),
      body: BlocBuilder<CategoriesPageCubit, CategoriesPageState>(
        builder: (context, state) {
          return state.map(
            loading: (_) => const CircularProgressIndicator(
              color: AppColors.headblue,
            ).toCenter(),
            loaded: (loaded) {
              return loaded.categories.isEmpty
                  ? Text(
                      'Вы ещё не добавили ни одной категории',
                      style: AppTextStyles.regular12.copyWith(fontSize: 14.sp),
                    ).toCenter()
                  : GridView.builder(
                      physics: const BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: loaded.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          onTap: () {
                            context.router
                                .push(
                                  CategoryPage(
                                      category: loaded.categories[index]),
                                )
                                .then((value) async => await cubit.init());
                          },
                          category: loaded.categories[index],
                        ).paddingAll(5.r);
                      },
                    ).paddingSymmetric(horizontal: 10.w, vertical: 10.h);
            },
          );
        },
      ),
    );
  }
}
