import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟ ',
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xFF949D9E),
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = (){
              Navigator.pop(context);
            },
              text: 'تسجيل الدخول',
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightPrimaryColor,
              )),
        ],
      ),
    );
  }
}