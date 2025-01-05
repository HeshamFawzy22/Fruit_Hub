// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/core/widgets/custom_text_field.dart';
import 'package:fruits_hub/core/widgets/password_field.dart';
import 'package:fruits_hub/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/terms_and_coditions_widget.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, name, password;
  late bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24.0),
              CustomTextFormField(
                inputType: TextInputType.name,
                hintText: 'الاسم كامل',
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                inputType: TextInputType.emailAddress,
                hintText: 'البريد الالكتروني',
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 16.0),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TermsAndCoditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30.0),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignUpCubit>()
                          .createUserWithEmailAndPassword(
                              email, password, name);
                    } else {
                      buildErrorBar(
                          context, 'يجب الموافقة على الشروط والاحكام');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const SizedBox(height: 26.0),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
