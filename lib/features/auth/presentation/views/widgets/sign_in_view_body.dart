
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/or_divider_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/social_login_button_widget.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

late String email, password;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _SignInViewBodyState extends State<SignInViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                inputType: TextInputType.emailAddress,
                hintText: 'البريد الالكتروني',
              ),
              const SizedBox(height: 16.0),
              PasswordField(
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33.0),
              CustomButton(
                text: 'تسجيل دخول',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context
                        .read<SignInCubit>()
                        .signInWithEmailAndPassword(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 33.0),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 33.0),
              const OrDividerWidget(),
              const SizedBox(height: 16.0),
              SocialLoginButtonWidget(
                title: 'تسجيل بواسطة جوجل',
                icon: Assets.imagesGoogleIcon,
                onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(height: 16.0),
              Platform.isAndroid ? const SizedBox.shrink() : Column(
                children: [
                  SocialLoginButtonWidget(
                    title: 'تسجيل بواسطة أبل',
                    icon: Assets.imagesAppleIcon,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
              SocialLoginButtonWidget(
                title: 'تسجيل بواسطة فيسبوك',
                icon: Assets.imagesFacebookIcon,
                onPressed: () {
                  context.read<SignInCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
