import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xFFDCDEDE),
          ),
        ),
        SizedBox(width: 18.0),
        Text(
          'أو',
          style: TextStyles.semiBold16,
        ),
        SizedBox(width: 18.0),
        Expanded(
          child: Divider(
            color: Color(0xFFDCDEDE),
          ),
        ),
      ],
    );
  }
}