import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/task_page/cubit/task_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_date_utils.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/cards/category_animation_card.dart';
import 'package:taski/presentation/widgets/items/user_card.dart';

@RoutePage()
class TaskPage extends StatefulWidget implements AutoRouteWrapper {
  final Task task;
  const TaskPage({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TaskPageCubit>(
      create: (context) => getIt<TaskPageCubit>()..isAuthor(task.authorId),
      child: this,
    );
  }
}

class _TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shapeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _shapeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskPageCubit, TaskPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: AppColors.headblue,
              onPressed: context.router.pop,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1.h),
              child: Container(
                color: AppColors.headblue,
                width: double.maxFinite,
                height: 1.h,
              ),
            ),
            actions: state.isAuthor
                ? [
                    IconButton(
                      onPressed: () => context.router
                          .push(CreateTaskPage(task: widget.task)),
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.headblue,
                      ),
                    ),
                  ]
                : null,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 22.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) => Container(
                        width: 30.r,
                        height: 30.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              _shapeAnimation.value * 30.r),
                          color: Color(widget.task.color),
                        ),
                      ),
                    ),
                    15.w.widthBox,
                    Text(
                      widget.task.title,
                      style: AppTextStyles.semibold24,
                    ),
                  ],
                ),
                if (widget.task.description != null &&
                    widget.task.description != "") ...[
                  20.h.heightBox,
                  Row(
                    children: [
                      const Icon(
                        Icons.description,
                        color: AppColors.headblue,
                      ),
                      20.w.widthBox,
                      Text(
                        widget.task.description!,
                        style: AppTextStyles.semibold16,
                      ),
                    ],
                  ),
                ],
                if (widget.task.category != null) ...[
                  20.h.heightBox,
                  SizedBox(
                    height: 30.h,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.category,
                          color: AppColors.headblue,
                        ),
                        15.w.widthBox,
                        if (widget.task.category != null)
                          FutureBuilder(
                            future: context
                                .read<TaskPageCubit>()
                                .getCategory(widget.task.category!),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Expanded(
                                  child: const LinearProgressIndicator(
                                    color: AppColors.headblue,
                                  ).paddingOnly(top: 25.h),
                                );
                              }
                              return Expanded(
                                child:
                                    CategoryAnimation(category: snapshot.data),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
                20.h.heightBox,
                Divider(
                  color: AppColors.grey,
                  thickness: 1.h,
                ),
                20.h.heightBox,
                Row(
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: Text(
                        AppDateUtils.formatDate(widget.task.startTime.toDate()),
                        style: AppTextStyles.semibold14,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      AppDateUtils.toHHMM(widget.task.startTime.toDate()),
                      style: AppTextStyles.semibold14,
                    ),
                    5.w.widthBox,
                    Text(
                      "-",
                      style: AppTextStyles.semibold14,
                    ),
                    5.w.widthBox,
                    Text(
                      AppDateUtils.toHHMM(widget.task.endTime.toDate()),
                      style: AppTextStyles.semibold14,
                    ),
                    15.w.widthBox,
                  ],
                ),
                20.h.heightBox,
                Divider(
                  color: AppColors.grey,
                  thickness: 1.h,
                ),
                15.h.heightBox,
                Row(
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: AppColors.headblue,
                    ),
                    15.w.widthBox,
                    Text(
                      widget.task.remindTimeInSeconds != 3600
                          ? "За ${widget.task.remindTimeInSeconds ~/ 60} минут"
                          : "За 1 час",
                      style: AppTextStyles.semibold14,
                    ),
                  ],
                ),
                20.h.heightBox,
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.people,
                          color: AppColors.headblue,
                        ),
                        15.w.widthBox,
                        Text(
                          "Участники",
                          style: AppTextStyles.semibold14,
                        ),
                      ],
                    ),
                    FutureBuilder(
                      future: context
                          .read<TaskPageCubit>()
                          .getContributors(widget.task.contributors),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final contributors = snapshot.data!;
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: contributors.length,
                            itemBuilder: (context, index) {
                              return UserCard.contributorList(
                                user: contributors[index],
                                onTap: () {},
                                removeAvaliable: false,
                                onRemoveTap: () {},
                                isAuthor: contributors[index].id ==
                                    widget.task.authorId,
                              ).paddingLTRB(30.w, 5.h, 15.w, 5.h);
                            },
                          );
                        } else {
                          return const LinearProgressIndicator(
                            color: AppColors.headblue,
                          ).paddingOnly(top: 25.h, left: 30.w, right: 15.w);
                        }
                      },
                    ).paddingOnly(top: 10.h),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
