// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/enums/remind_time.dart';
import 'package:taski/domain/enums/repeat_type.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/create_task/cubit/create_task_page_cubit.dart';
import 'package:taski/presentation/pages/create_task/widgets/dropdown_picker.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_date_utils.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/utils/date_time_extension.dart';
import 'package:taski/presentation/utils/validation.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
import 'package:taski/presentation/widgets/dialogs/saving_dialog.dart';
import 'package:taski/presentation/widgets/items/color_pick_item.dart';
import 'package:taski/presentation/widgets/items/user_card.dart';
import 'package:taski/presentation/widgets/lists/add_to_contributors_list.dart';

@RoutePage()
class CreateTaskPage extends StatefulWidget implements AutoRouteWrapper {
  final Task? task;
  const CreateTaskPage({Key? key, this.task}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CreateTaskCubit>(
      create: (context) => getIt<CreateTaskCubit>()
        ..init(
          authorId: task?.authorId,
          contributorsIds: task?.contributors ?? [],
        ),
      child: this,
    );
  }
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  late DateTime startTime;
  late DateTime endTime;
  List<Color> colors = [
    AppColors.green,
    AppColors.blue,
    AppColors.red,
    AppColors.orange,
  ];
  late Color selectedColor;
  String? selectedCategory = "";
  RemindTime selectedRemindTime = RemindTime.min15;
  RepeatType selectedRepeatType = RepeatType.never;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.task?.title);
    descriptionController =
        TextEditingController(text: widget.task?.description);
    startTime = widget.task?.startTime.toDate() ?? DateTime.now();
    endTime = widget.task?.endTime.toDate() ??
        DateTime.now().add(const Duration(minutes: 30));
    selectedColor = widget.task?.color == null
        ? AppColors.green
        : Color(widget.task!.color);
    selectedCategory = widget.task?.category;
    selectedRemindTime = RemindTimeHelper.fromValue(
      widget.task?.remindTimeInSeconds ?? selectedRemindTime.toValue(),
    );
    selectedRepeatType = RepeatTypeHelper.fromValue(
      widget.task?.repeatString ?? selectedRepeatType.toValue(),
    );
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
        actions: [
          IconButton(
            onPressed: save,
            icon: const Icon(
              Icons.check,
              color: AppColors.headblue,
            ),
          )
        ],
        title: Text(
          widget.task != null ? "Редактирование задачи" : 'Создание задачи',
          style: AppTextStyles.bold20,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<CreateTaskCubit, CreateTaskState>(
        listener: (context, state) {
          if (state == const CreateTaskState.saving()) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const SavingDialog();
              },
            );
          }
        },
        buildWhen: (previous, current) => current is! Saving,
        builder: (context, state) {
          if (state is Loading) {
            return const CircularProgressIndicator(color: AppColors.headblue)
                .toCenter();
          }
          if (state is Loaded) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(top: 5.h, bottom: 30.h),
              child: Column(
                children: [
                  15.h.heightBox,
                  AppTextField(
                    title: 'Название',
                    hintText: 'Введите название задачи',
                    width: 345.w,
                    height: 70.h,
                    controller: titleController,
                    textInputAction: TextInputAction.next,
                  ),
                  AppTextField(
                    title: 'Описание',
                    hintText: 'Введите описание задачи',
                    width: 345.w,
                    height: 70.h,
                    controller: descriptionController,
                  ),
                  Divider(
                    thickness: 1.h,
                    color: AppColors.grey,
                  ),
                  10.h.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: startTime,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now()
                                .copyWith(year: DateTime.now().year + 1),
                          ).then(
                            (value) => setState(() {
                              startTime = value?.copyWith(
                                    hour: startTime.hour,
                                    minute: startTime.minute,
                                  ) ??
                                  startTime;
                              endTime = value?.copyWith(
                                    hour: endTime.hour,
                                    minute: endTime.minute,
                                  ) ??
                                  endTime;
                            }),
                          );
                        },
                        child: Text(
                          AppDateUtils.formatDate(startTime),
                          style: AppTextStyles.semibold14,
                        ),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(startTime),
                              ).then(
                                (value) => setState(
                                  () {
                                    final editedvalue = startTime.copyWith(
                                      hour: value?.hour ?? startTime.hour,
                                      minute: value?.minute ?? startTime.minute,
                                    );
                                    if (editedvalue.isAfter(endTime) ||
                                        editedvalue.isSame(endTime)) {
                                      endTime = endTime.add(
                                          endTime.difference(startTime) +
                                              editedvalue.difference(endTime));
                                    }
                                    startTime = editedvalue;
                                  },
                                ),
                              );
                            },
                            child: Text(
                              AppDateUtils.toHHMM(startTime),
                              style: AppTextStyles.semibold14,
                            ),
                          ),
                          10.h.heightBox,
                          GestureDetector(
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime:
                                          TimeOfDay.fromDateTime(endTime))
                                  .then(
                                (value) => setState(
                                  () {
                                    final editedValue = endTime.copyWith(
                                      hour: value?.hour ?? endTime.hour,
                                      minute: value?.minute ?? endTime.minute,
                                    );
                                    if (startTime.isAfter(editedValue) ||
                                        startTime.isSame(editedValue)) {
                                      startTime = startTime.subtract(
                                          startTime.difference(editedValue) +
                                              endTime.difference(startTime));
                                    }
                                    endTime = editedValue;
                                  },
                                ),
                              );
                            },
                            child: Text(
                              AppDateUtils.toHHMM(endTime),
                              style: AppTextStyles.semibold14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 15.w),
                  10.h.heightBox,
                  Divider(
                    thickness: 1.h,
                    color: AppColors.grey,
                  ),
                  20.h.heightBox,
                  Row(
                    children: [
                      const Icon(
                        Icons.color_lens,
                        color: AppColors.headblue,
                      ),
                      10.w.widthBox,
                      Text(
                        'Выберите цвет',
                        style: AppTextStyles.semibold16,
                      ),
                    ],
                  ).paddingOnly(left: 15.w).alignAtCenterLeft(),
                  10.h.heightBox,
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
                  ).paddingOnly(left: 45.w).alignAtCenterLeft(),
                  20.h.heightBox,
                  Row(
                    children: [
                      const Icon(
                        Icons.category,
                        color: AppColors.headblue,
                      ),
                      10.w.widthBox,
                      Text(
                        'Выберите категорию',
                        style: AppTextStyles.semibold16,
                      ),
                    ],
                  ).paddingOnly(left: 15.w).alignAtCenterLeft(),
                  DropdownButtonFormField<String?>(
                    value: selectedCategory,
                    isExpanded: true,
                    items: state.categories
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(
                              e.id == "" ? "Без категории" : e.title,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.semibold12.copyWith(
                                  color: e.id == "" ? AppColors.grey : null),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => setState(
                      () => selectedCategory = value != "" ? value : null,
                    ),
                  )
                      .paddingSymmetric(horizontal: 15.w)
                      .paddingOnly(left: 35.w, right: 15.w),
                  20.h.heightBox,
                  Divider(
                    thickness: 1.h,
                    color: AppColors.grey,
                  ),
                  10.h.heightBox,
                  DropdownPicker<RemindTime>(
                    icon: const Icon(
                      Icons.notifications,
                      color: AppColors.headblue,
                    ),
                    title: 'Напомнить за',
                    items: RemindTimeHelper.remindValuesList,
                    onChanged: (value) => setState(
                      () => selectedRemindTime = value ?? selectedRemindTime,
                    ),
                    selectedItem: selectedRemindTime,
                  ).paddingOnly(left: 15.w).alignAtCenterLeft(),
                  20.h.heightBox,
                  DropdownPicker<RepeatType>(
                    icon: const Icon(
                      Icons.repeat,
                      color: AppColors.headblue,
                    ),
                    title: 'Повторять',
                    items: RepeatTypeHelper.repeatValuesList,
                    onChanged: (value) => setState(
                      () => selectedRepeatType = value ?? selectedRepeatType,
                    ),
                    selectedItem: selectedRepeatType,
                  ).paddingOnly(left: 15.w).alignAtCenterLeft(),
                  10.h.heightBox,
                  Divider(
                    thickness: 1.h,
                    color: AppColors.grey,
                  ),
                  20.h.heightBox,
                  Row(
                    children: [
                      const Icon(
                        Icons.people,
                        color: AppColors.headblue,
                      ),
                      10.w.widthBox,
                      Text(
                        'Участники',
                        style: AppTextStyles.semibold16,
                      ),
                    ],
                  ).paddingOnly(left: 15.w).alignAtCenterLeft(),
                  10.h.heightBox,
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.contributors.length,
                    itemBuilder: (context, index) {
                      return UserCard.contributorList(
                        key: GlobalKey(),
                        user: state.contributors[index],
                        onTap: () {},
                        isAuthor: state.contributors[index] == state.author,
                        onRemoveTap: () => context
                            .read<CreateTaskCubit>()
                            .removeFromContributors(state.contributors[index]),
                        removeAvaliable: true,
                      ).paddingLTRB(45.w, 7.h, 15.w, 7.h);
                    },
                  ),
                  10.h.heightBox,
                  CustomButton(
                    width: 220.w,
                    height: 35.h,
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (dialogContext) {
                        return AddToContributorsList(
                          friends: context.read<CreateTaskCubit>().getFriends(),
                          onConfirm: (users) =>
                              dialogContext.pop(result: users),
                          initialContributors: state.contributors,
                        );
                      },
                    ).then(
                      (value) {
                        if (value is List<UserModel>) {
                          context
                              .read<CreateTaskCubit>()
                              .setContributors(value);
                        }
                      },
                    ),
                    text: "Добавить пользователей",
                  ).paddingOnly(left: 45.w).alignAtCenterLeft(),
                  if (widget.task != null) ...[
                    TextButton(
                      onPressed: () async {
                        await context
                            .read<CreateTaskCubit>()
                            .deleteTask(widget.task!);
                        context.router.popUntil(
                            (route) => route.settings.name == TaskPage.name);
                        context.router.pop();
                      },
                      child: Text(
                        "Удалить задачу",
                        style: AppTextStyles.semibold12.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    ).alignAtCenter().paddingOnly(top: 30.h),
                  ]
                ],
              ).toCenter(),
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<void> save() async {
    final contributors =
        (context.read<CreateTaskCubit>().state as Loaded).contributors;
    bool titleIsEmpty = titleController.text == '';
    final task = Task(
      title: titleController.text,
      id: '',
      authorId: '',
      startTime: Timestamp.fromDate(startTime),
      endTime: Timestamp.fromDate(endTime),
      color: selectedColor.value,
      description: descriptionController.text,
      category: selectedCategory,
      remindTimeInSeconds: selectedRemindTime.toValue(),
      repeatString: selectedRepeatType.toValue(),
      contributors: contributors.map((e) => e.id).toList(),
    );
    if (titleIsEmpty) {
      Validation.showAppSnackBar(
        text: 'Название не может быть пустым.',
        context: context,
      );
    } else {
      final textError = widget.task != null
          ? await context.read<CreateTaskCubit>().editTask(
                widget.task!.copyWith(
                  startTime: Timestamp.fromDate(startTime),
                  endTime: Timestamp.fromDate(endTime),
                  title: titleController.text,
                  description: descriptionController.text,
                  color: selectedColor.value,
                  category: selectedCategory,
                  remindTimeInSeconds: selectedRemindTime.toValue(),
                  repeatString: selectedRepeatType.toValue(),
                  contributors: contributors.map((e) => e.id).toList(),
                ),
              )
          : await context.read<CreateTaskCubit>().addTask(task);
      if (textError != null && context.mounted) {
        Validation.showAppSnackBar(
          text: textError,
          context: context,
        );
      } else {
        if (widget.task != null) {
          context.router
              .popUntil((route) => route.settings.name == TaskPage.name);
          context.router.replace(
            TaskPage(
              task: widget.task!.copyWith(
                startTime: Timestamp.fromDate(startTime),
                endTime: Timestamp.fromDate(endTime),
                title: titleController.text,
                description: descriptionController.text,
                color: selectedColor.value,
                category: selectedCategory,
                remindTimeInSeconds: selectedRemindTime.toValue(),
                repeatString: selectedRepeatType.toValue(),
                contributors: contributors.map((e) => e.id).toList(),
              ),
            ),
          );
        } else {
          context.router
              .popUntil((route) => route.settings.name == HomePage.name);
        }
      }
    }
  }
}
