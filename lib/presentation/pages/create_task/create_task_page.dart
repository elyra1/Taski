// ignore_for_file: use_build_context_synchronously
import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/create_task/cubit/create_task_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_date_utils.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/utils/validation.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/items/color_pick_item.dart';

@RoutePage()
class CreateTaskPage extends StatefulWidget implements AutoRouteWrapper {
  final Task? task;
  const CreateTaskPage({Key? key, this.task}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CreateTaskCubit>(
      create: (context) => getIt<CreateTaskCubit>(),
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
  int selectedRemindTime = 900;
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
    selectedRemindTime = widget.task?.remindTimeInSeconds ?? selectedRemindTime;
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
              ))
        ],
        title: Text(
          widget.task != null ? "Редактирование задачи" : 'Создание задачи',
          style: AppTextStyles.bold20,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 5.h),
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
                                  editedvalue.isSameDate(endTime)) {
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
                                initialTime: TimeOfDay.fromDateTime(endTime))
                            .then(
                          (value) => setState(
                            () {
                              final editedValue = endTime.copyWith(
                                hour: value?.hour ?? endTime.hour,
                                minute: value?.minute ?? endTime.minute,
                              );
                              if (startTime.isAfter(editedValue) ||
                                  startTime.isSameDate(editedValue)) {
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
            20.h.heightBox,
            Text(
              'Выберите категорию',
              style: AppTextStyles.semibold20.copyWith(fontSize: 18),
            ).paddingOnly(left: 15.w).alignAtCenterLeft(),
            FutureBuilder(
              future: context.read<CreateTaskCubit>().getCategories(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const LinearProgressIndicator(
                    color: AppColors.headblue,
                  )
                      .alignAtCenter()
                      .paddingSymmetric(horizontal: 15.w)
                      .paddingOnly(top: 45.h);
                }
                return DropdownButtonFormField<String?>(
                  value: selectedCategory,
                  items: ([Category.getEmpty(), ...(snapshot.data!)])
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(
                            e.id == "" ? "Без категории" : e.title,
                            style: AppTextStyles.semibold12.copyWith(
                                color: e.id == "" ? AppColors.grey : null),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(
                    () => selectedCategory = value != "" ? value : null,
                  ),
                ).paddingSymmetric(horizontal: 15.w);
              },
            ).alignAtCenterLeft(),
            20.h.heightBox,
            Row(
              children: [
                Text(
                  'Напомнить за:',
                  style: AppTextStyles.semibold20.copyWith(fontSize: 18),
                ).paddingOnly(left: 15.w).alignAtCenterLeft(),
                SizedBox(
                  width: 150.w,
                  child: DropdownButtonFormField<int>(
                    value: selectedRemindTime,
                    items: [
                      ("5 мин", 300),
                      ("10 мин", 600),
                      ("15 мин", 900),
                      ("30 мин", 1800),
                      ("1 час", 3600)
                    ].map(
                      (e) {
                        return DropdownMenuItem(
                          value: e.$2,
                          child: Text(
                            e.$1,
                            style: AppTextStyles.semibold12,
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (value) => setState(
                      () => selectedRemindTime = value ?? selectedRemindTime,
                    ),
                  ),
                ).paddingSymmetric(horizontal: 15.w),
              ],
            ),
            if (widget.task != null) ...[
              TextButton(
                onPressed: () async {
                  await context
                      .read<CreateTaskCubit>()
                      .deleteTask(widget.task!);
                  context.router.pop().then((value) => context.router.pop());
                },
                child: Text(
                  "Удалить задачу",
                  style: AppTextStyles.semibold12.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ).alignAtBottomCenter().paddingOnly(top: 40.h),
            ]
          ],
        ).toCenter(),
      ),
    );
  }

  Future<void> save() async {
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
      remindTimeInSeconds: selectedRemindTime,
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
                  remindTimeInSeconds: selectedRemindTime,
                ),
              )
          : await context.read<CreateTaskCubit>().addTask(task);
      if (textError != null && context.mounted) {
        Validation.showAppSnackBar(
          text: textError,
          context: context,
        );
      } else {
        if (context.mounted) {
          if (widget.task != null) {
            context.router.pop().then((value) {
              context.router.replace(
                TaskPage(
                  task: widget.task!.copyWith(
                    startTime: Timestamp.fromDate(startTime),
                    endTime: Timestamp.fromDate(endTime),
                    title: titleController.text,
                    description: descriptionController.text,
                    color: selectedColor.value,
                    category: selectedCategory,
                    remindTimeInSeconds: selectedRemindTime,
                  ),
                ),
              );
            });
          } else {
            context.router.pop();
          }
        }
      }
    }
  }
}
