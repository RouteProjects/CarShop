import 'package:carshop/Loginscreen.dart';
import 'package:flutter/material.dart';

class Onboardingscreen extends StatefulWidget {
  static const String routName = "OnBoard";

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  //******
  int currentPage = 0;

  PageController controller = PageController();

  //*********
  List<Map<String, String>> pages = [
    {
      "title": "Locate the Destination",
      "subtitle":
          "Your destination is at your fingertips. Open app\n & enter where you want to go",
      "image": "Assets/images/car_bg.png",
    },
    {
      "title": "Select your Root",
      "subtitle":
          "Get quick access to frequent locations , and\n save them as a favorite",
      "image": "Assets/images/blue.png",
    },
    {
      "title": "Get Your Car",
      "subtitle":
          "Fastest way to book car without the hassle of\n waiting & hanging for price",
      "image": "Assets/images/blue3.png",
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
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    LoginScreen.routename,
                  );
                },
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

          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              onPageChanged: (index) {
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
                        style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFF348AC7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        pages[index]["subtitle"]!,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: List.generate(
                          pages.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: currentPage == index ? 40 : 8,

                            height: currentPage == index ? 10 : 8,

                            decoration: BoxDecoration(
                              //shape: BoxShape.circle,
                              color: currentPage == index
                                  ? Color(0xff7474BF)
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
                        child: InkWell(
                          onTap: () {
                            if (currentPage < pages.length - 1) {
                              controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            } else {

                              Navigator.pushReplacementNamed(context, LoginScreen.routename);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF7474BF), Color(0xFF348AC7)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  currentPage == pages.length - 1 ? "Get Start" : "Next",
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
