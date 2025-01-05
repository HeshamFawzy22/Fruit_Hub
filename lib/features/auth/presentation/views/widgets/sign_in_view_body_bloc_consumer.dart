// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_progress_hud.dart';

import 'package:fruits_hub/features/auth/presentation/cubits/cubit/sign_in_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          buildErrorBar(context, state.message);
        } else if (state is SignInSuccess){
          buildErrorBar(context, "تم تسجيل الدخول بنجاح ");
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isloading: state is SignInLoading ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
