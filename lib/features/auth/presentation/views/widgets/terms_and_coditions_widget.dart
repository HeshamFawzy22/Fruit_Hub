import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/custom_check_box_widget.dart';

class TermsAndCoditionsWidget extends StatefulWidget {
  const TermsAndCoditionsWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndCoditionsWidget> createState() => _TermsAndCoditionsWidgetState();
}

class _TermsAndCoditionsWidgetState extends State<TermsAndCoditionsWidget> {
  

  @override
  /// The width of the text is calculated based on the width of the screen
  /// minus the padding of the parent widget, minus the width of the checkbox
  /// (which is 48), minus the padding of the row (which is [kHorizontalPadding]
  /// on each side).
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Checkbox(value: false, onChanged: (value) {}),
        CustomCheckBoxWidget(
          onChanged: widget.onChanged,
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    )),
                TextSpan(
                    text: 'الشروط والاحكام الخاصة بنا',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
