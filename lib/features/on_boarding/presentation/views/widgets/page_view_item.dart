// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_in_view.dart';
import 'package:svg_flutter/svg.dart';


class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subTitle,
    required this.title,
    required this.isVisible,
  });

  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              GestureDetector(
                onTap: () {
                  SharedPrefs.setBoolean(kIsOnBoardingViewSeen, true);
                  Navigator.of(context).pushReplacementNamed(SignInView.routeName);
                },
                child: Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'تخطى',
                      style: TextStyles.regular13
                          .copyWith(color: const Color(0xFF949D9E)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(
              color: const Color(0xFF4E5456),
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
