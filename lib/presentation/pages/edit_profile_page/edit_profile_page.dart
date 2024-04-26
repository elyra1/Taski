import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/pages/edit_profile_page/cubit/edit_profile_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_icons.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/dialogs/saving_dialog.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget implements AutoRouteWrapper {
  final UserModel user;
  const EditProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<EditProfilePageCubit>(
      create: (context) => getIt<EditProfilePageCubit>(),
      child: this,
    );
  }
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  @override
  void initState() {
    _nameController.text = widget.user.username;
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
            onPressed: () {},
            icon: const Icon(
              Icons.check,
              color: AppColors.headblue,
            ),
          )
        ],
        title: Text(
          "Редактирование профиля",
          style: AppTextStyles.bold20,
        ),
      ),
      body: BlocListener<EditProfilePageCubit, EditProfilePageState>(
        listener: (context, state) {
          if (state is Saving) {
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
          children: [
            45.h.heightBox,
            if (widget.user.photoUrl != null) ...[
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 65.r,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(widget.user.photoUrl!),
                    child: Container(
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Column(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 35.r,
                          color: AppColors.headblue,
                        ),
                        5.h.heightBox,
                        Text(
                          "Выбрать фото",
                          style: AppTextStyles.semibold12,
                        )
                      ],
                    ).paddingLTRB(10.r, 28.r, 10.r, 28.r),
                  )
                ],
              ),
            ] else
              SizedBox(
                width: 100.r,
                height: 100.r,
                child: SvgPicture.asset(AppIcons.userIcon),
              ),
            30.h.heightBox,
            AppTextField(
              title: "Имя пользователя",
              controller: _nameController,
              titleTextStyle: AppTextStyles.semibold14,
            ),
          ],
        ).paddingSymmetric(horizontal: 15.w),
      ),
    );
  }
}
