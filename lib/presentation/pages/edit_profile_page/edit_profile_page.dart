import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/edit_profile_page/cubit/edit_profile_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/utils/validation.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
import 'package:taski/presentation/widgets/buttons/pick_photo_icon_button.dart';
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
      create: (context) => getIt<EditProfilePageCubit>()..init(user),
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
    final cubit = context.read<EditProfilePageCubit>();
    return BlocConsumer<EditProfilePageCubit, EditProfilePageState>(
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
      buildWhen: (previous, current) => current is! Saving,
      builder: (context, state) {
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
                onPressed: () {
                  final error =
                      Validation.validateUsername(_nameController.text);
                  if (error != null) {
                    Validation.showAppSnackBar(
                      text: error,
                      context: context,
                    );
                  } else {
                    cubit
                        .editProfile(
                          photo: state is Loaded ? state.newPhoto : null,
                          username: _nameController.text,
                          initialUser: widget.user,
                        )
                        .then(
                          (value) => context.router.popUntil(
                            (route) => route.settings.name == ProfilePage.name,
                          ),
                        );
                  }
                },
                icon: const Icon(
                  Icons.check,
                  color: AppColors.headblue,
                ),
              )
            ],
            title: Text(
              "Редактирование профиля",
              style: AppTextStyles.bold16,
            ),
          ),
          body: Column(
            children: [
              45.h.heightBox,
              if (state is Loaded &&
                  (state.user.photoUrl != null || state.newPhoto != null)) ...[
                CircleAvatar(
                  radius: 65.r,
                  backgroundColor: Colors.white,
                  backgroundImage: state.newPhoto != null
                      ? Image.file(state.newPhoto!).image
                      : NetworkImage(state.user.photoUrl!),
                ),
                15.h.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      width: 160.w,
                      height: 35.h,
                      color: AppColors.pastelgreen,
                      textStyle: AppTextStyles.bold12,
                      text: "Изменить фото",
                      onPressed: () => cubit.pickImage(),
                    ),
                    IconButton(
                      onPressed: () => cubit.deleteImage(),
                      icon: const Icon(
                        Icons.delete,
                        color: AppColors.red,
                      ),
                    )
                  ],
                ),
              ] else
                PickPhotoIconButton(
                  onTap: () async =>
                      await context.read<EditProfilePageCubit>().pickImage(),
                ),
              30.h.heightBox,
              AppTextField(
                title: "Имя пользователя",
                controller: _nameController,
                titleTextStyle: AppTextStyles.semibold14,
              ),
            ],
          ).paddingSymmetric(horizontal: 15.w),
        );
      },
    );
  }
}
