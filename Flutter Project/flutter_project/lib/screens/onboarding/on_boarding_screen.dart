import 'package:flutter/material.dart';
import 'package:flutter_project/screens/login/login_screen.dart';
import 'package:flutter_project/screens/onboarding/component/indicator.dart';
import 'package:flutter_project/screens/onboarding/component/slider_screen.dart';

import '../../model/item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Item> itemList = [];
  int currentIndex = 0;

  final PageController _controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    itemList.add(
      Item(
          1,
          "Choose your item",
          "This handy tool helps you create dummy text for all your layout needs.",
          "assets/images/onboarding1.png"),
    );

    itemList.add(
      Item(
          2,
          "Pick up or Delivery",
          "We are gradually adding new functionality and we welcome your suggestions and feedback.",
          "assets/images/onboarding2.png"),
    );

    itemList.add(
      Item(
          3,
          "Pay quick and easy",
          "Please feel free to send us any additional dummy texts.",
          "assets/images/onboarding3.png"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: itemList.length,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
          //print(currentIndex);
        },
        itemBuilder: (context, index) {
          return SliderScreen(itemList[index]);
        },
      ),
      bottomSheet: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  for (int i = 0; i < itemList.length; i++)
                    if (currentIndex == i)
                      getIndicator(true)
                    else
                      getIndicator(false)
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (currentIndex != itemList.length - 1) {
                  _controller.animateToPage(currentIndex + 1,
                      duration: Duration(microseconds: 300),
                      curve: Curves.linear);
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.red.shade300,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child:
                  Text(currentIndex == itemList.length - 1 ? 'FINISH' : 'NEXT'),
            ),
          ],
        ),
      ),
    );
  }
}
