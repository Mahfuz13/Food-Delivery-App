import 'package:flutter/material.dart';
import 'package:app/screens/auth/login_page.dart';
import 'package:app/common_widget/round_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectPage = 0;
  PageController controller = PageController();

  List pageArr = [
    {
      "title": "On demand & runtime\nlocation",
      "subtitle": "Pick from your location at\nyour preferred date\nand time.",
      "image": "onboarding_1.png",
    },
    {
      "title": "Anything, anytime,\nanywhere.",
      "subtitle":
          "Whether it's a parcel, a cheque or\nan important doc, we'll parcel.",
      "image": "onboarding_2.png",
    },
    {
      "title": "Live track\nyour shipments",
      "subtitle":
          "See a realtime view of your courier\non the map on the day of delivery.",
      "image": "onboarding_3.png",
    },
  ];

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: ((context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        pObj["image"].toString(),
                        width: media.width * 0.65,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    pObj["title"].toString(),
                    style: const TextStyle(
                      color: Color(0xffFC6011),
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: media.width * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      pObj["subtitle"].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff7C7D7E),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                ],
              );
            }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageArr.map((e) {
                  var index = pageArr.indexOf(e);

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: index == selectPage
                          ? const Color(0xffFC6011)
                          : const Color(0xffB6B7B7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: media.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundButton(
                  title: "Next",
                  onPressed: () {
                    if (selectPage >= 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    } else {
                      setState(() {
                        selectPage = selectPage + 1;
                        controller.animateToPage(selectPage,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: media.height * 0.05,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
