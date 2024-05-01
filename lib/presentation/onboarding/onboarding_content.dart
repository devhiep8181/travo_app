// Project imports:
import '../../core/utils/text_constant.dart';
import '../../gen/assets.gen.dart';

class OnboardingContent {
  OnboardingContent({
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;
}

List<OnboardingContent> content = [
  OnboardingContent(
      image: Assets.images.onboarding1.path,
      title: TextConstant.titleOnboard1,
      subtitle: TextConstant.subtitleOnboard1),
  OnboardingContent(
      image: Assets.images.onboarding2.path,
      title: TextConstant.titleOnboard2,
      subtitle: TextConstant.subtitleOnboard2),
  OnboardingContent(
      image: Assets.images.onboarding3.path,
      title: TextConstant.titleOnboard3,
      subtitle: TextConstant.subtitleOnboard3)
];
