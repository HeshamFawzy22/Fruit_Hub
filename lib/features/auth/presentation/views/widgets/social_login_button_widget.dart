// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class SocialLoginButtonWidget extends StatelessWidget {
  const SocialLoginButtonWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.0,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFDCDEDE), width: 1.0),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: ListTile(
          visualDensity:
              const VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(icon),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16,
          ),
        ),
      ),
    );
  }
}
