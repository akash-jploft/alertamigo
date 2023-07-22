import 'package:flutter/material.dart';

import '../../widget/app_button.dart';
import '../sign_up_page/mobile_input_page.dart';

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({Key? key}) : super(key: key);

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  PageController controller = PageController();

  int currentValue = 0;

  void goToNextPage() {
    controller.nextPage(
        duration: const Duration(microseconds: 1), curve: Curves.bounceIn);
  }

  void goToSignInPage() {
    Navigator.of(context).pushNamed(MobileInputPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      Pages(
        value: 1,
        image: 'assets/showcase/showcaseone.png',
        titleValue: 'Activate\nSOS mode',
        detailValue:
            'Alert your contacts in an emergency with the widget or in the app.',
        buttonTitle: 'Next',
        onNext: () => goToNextPage(),
      ),
      Pages(
        value: 2,
        image: 'assets/showcase/showcasetwo.png',
        titleValue: 'View incidents',
        detailValue:
            'View, vote and comment on posted incidents. Incident posts may contain sensitive images.',
        buttonTitle: 'Next',
        onNext: () => goToNextPage(),
      ),
      Pages(
        value: 3,
        image: 'assets/showcase/showcasethree.png',
        titleValue: 'Post incidents',
        detailValue: 'Post incidents with photos, video, audio or text only.',
        buttonTitle: 'Get Started',
        onNext: () => goToSignInPage(),
      )
    ];

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          onPageChanged: (num) {
            setState(() {
              currentValue = num;
            });
          },
          children: pages,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, (index) {
                    return Container(
                      width: (MediaQuery.of(context).size.width - 10) /
                              pages.length -
                          (2 * pages.length),
                      height: 2,
                      color: (index <= currentValue)
                          ? const Color(0xFF3B3C40)
                          : const Color(0xFFE5E5E5),
                      margin: const EdgeInsets.all(1),
                    );
                  }),
                ),
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    ));
  }
}

class Pages extends StatelessWidget {
  final int value;
  final String image;
  final String titleValue;
  final String detailValue;
  final String buttonTitle;
  final VoidCallback onNext;

  const Pages(
      {super.key,
      required this.value,
      required this.image,
      required this.titleValue,
      required this.detailValue,
      required this.buttonTitle,
      required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(titleValue,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: "${detailValue.split(".").first}.",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        if (detailValue.split(".").length > 2)
                          TextSpan(
                            text: "${detailValue.split(".")[1]}.",
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.red),),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  AppButton(
                      bgColor: Theme.of(context).primaryColor,
                      fgColor: Colors.white,
                      onTap: () {
                        onNext();
                      },
                      title: buttonTitle),
                  const SizedBox(
                    height: 15,
                  ),
                  AppButton(
                      bgColor: Theme.of(context).disabledColor,
                      fgColor: Theme.of(context).primaryColor,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(MobileInputPage.routeName);
                      },
                      title: "Skip"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
