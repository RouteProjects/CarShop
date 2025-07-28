import 'package:flutter/material.dart';

class Onboardingscreen extends StatefulWidget {
  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  //******
  int currentPage = 0;

  // رقم الصفحة الحالي

  PageController controller = PageController();

  // عشان اتحكم ف التنقل بين صفحات

  //*********
  List<Map<String, String>> pages = [
    // كل صفحة عبارة عن خريطة (Map): فيها عنوان، وصف، وصورة.
    // بدل ما تكتب 3 صفحات يدوي، عملتهم كـ data وهتستخدمهم داخل PageView.builder.

    // عشان كل م اعمل scroll المحتوي يتغير dot indicator
    {
      "title": "Locate the Destination",
      "subtitle":
          "Your destination is at your fingertips. Open app\n & enter where you want to go",
      "image": "assets/images/car_bg.png",
    },
    {
      "title": "Select your Root",
      "subtitle":
          "Get quick access to frequent locations , and\n save them as a favorite",
      "image": "assets/images/blue.png",
    },
    {
      "title": "Get Your Car",
      "subtitle":
          "Fastest way to book car without the hassle of\n waiting & hanging for price",
      "image": "assets/images/blue3.png",
    },
  ];

  //****
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff131A34),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          // leh PageView.builder msh PageView bs .. ?
          // lw 3andy more pages lazm PageView.builder افضل ف التحكم..
          // Page controller => page view هو اللي بيتحكم ف
          // 1- نعرف منه مستخد واقف ف اني صفحة
          Expanded(
            child: PageView.builder(
              // PageView.builder  => بناء صفحات ع حسب index
              controller: controller,
              itemCount: pages.length,
              onPageChanged: // كل ما المستخدم يسحب scroll، نحدث قيمة currentpage
                  // عشان نغير شكل الـ indicators والزر).
                  (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        pages[index]["title"]!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        pages[index]["subtitle"]!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: List.generate(
                          // "أنا عايز أعمل قائمة (List) بعدد معيّن من العناصر، وكل عنصر هيتبني باستخدام دالة".
                          pages.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: currentPage == index ? 40 : 8,
                            // لو دي هي الصفحة الحالية، النقطة تكون عريضة (40). غير كده تكون صغيرة (8).
                            height: currentPage == index ? 10 : 8,
                            // لو الصفحة الحالية → الطول 10، وإلا 8.
                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              color: currentPage == index
                                  ? Color(0xff7474BF)
                                  // لون النقطة النشطة مختلف عن الباقي.
                                  : Color(0xffD8D8D8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            if (currentPage < pages.length - 1)
                            // لو رقم الصفحة الحالية (currentPage) أقل من آخر رقم في الصفحات
                            // (يعني لسه فيه صفحات جاية)
                            // يبقى روح للصفحة اللي بعدها
                            // List pages = [1, 2, 3];
                            // pages.length = 3 ← يعني فيها 3 عناصر.
                            // لكن:
                            // أول صفحة رقمها = 0
                            // الثانية = 1
                            // الثالثة = 2
                            // يعني آخر صفحة رقمها هو:pages.length - 1 = 2
                            // finally => // لسه فيه صفحات
                            {
                              controller.nextPage(
                                // روح للصفحة اللي بعدها
                                // يحرك المستخدم للصفحة التالية
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            } else {}
                          },

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            // ✅ يخلي العرض على قد المحتوى
                            children: [
                              Text(
                                currentPage == pages.length - 1
                                    ? "Get Start"
                                    : "Next",
                                // لو المستخدم واقف على آخر صفحة → اعرض "Get Start"
                                // غير كده → اعرض "Next"
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Expanded(child: Image.asset(pages[index]["image"]!)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
