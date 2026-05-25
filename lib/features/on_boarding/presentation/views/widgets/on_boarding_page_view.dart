import 'package:flutter/material.dart'; // 💡 استبدل cupertino بـ material عشان الـ Row والألوان تظبط
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widgets/page_view_items.dart';

import '../../../../../core/utils/app_text_styles.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItems(
          isVisible:true,
          image: AppAssets.onBoardingPageViewImage1,
          backgroundImage: AppAssets.onBoardingBG2,
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "مرحبًا بك في ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0C0D0D),
                ),
              ),
              Text(
                "HUB",
                style: AppTextStyles.bold24.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Text(
                "Fruit",
                style: AppTextStyles.bold24.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),

        PageViewItems(
          isVisible:false,
          image: AppAssets.onBoardingPageViewImage2,
          backgroundImage: AppAssets.onBoardingBG,
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Text(
            "ابحث وتسوق",
            textAlign: TextAlign.center,
            style: AppTextStyles.bold24.copyWith(color: Color(0xFF0C0D0D)),
          ),
        ),
      ],
    );
  }
}
