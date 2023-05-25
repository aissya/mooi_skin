import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/ui/widgets/onboarding_body_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('screen', 1);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget customOnBoarding4() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //girl asset dan title
                Image.asset(
                  'assets/onboarding4_girl_6.png',
                  width: getProportionateScreenWidth(270),
                  height: getProportionateScreenHeight(355),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: getProportionateScreenHeight(28),
              left: getProportionateScreenWidth(47),
              right: getProportionateScreenWidth(63),
            ),
            // width: getProportionateScreenWidth(285),
            // child: Image.asset('assets/onboarding4_title.png'),
            child: Text(
              '"Lorem"',
              style: opensansTextStyle.copyWith(
                height: 0.89,
                fontWeight: weightBold,
                fontSize: 40,
                color: greenColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: getProportionateScreenHeight(29),
                left: getProportionateScreenWidth(47),
                right: getProportionateScreenWidth(63)),
            child: Text(
              'Mulailah perjalananmu menuju kulit wajah impian bebas jerawat dengan bantuan aplikasi Lie Skin.',
              style: opensansTextStyle.copyWith(
                height: 0.89,
                fontWeight: weightBold,
                fontSize: 20,
                color: greenColor,
              ),
            ),
          )
        ],
      );
    }

    //screen onboarding 1,2,3
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          decoration: const BoxDecoration(
            color: bgColor,
          ),
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            controller: _pageController,
            children: [
              OnBoardingBodyWidget(
                heroImage: 'assets/onboarding1_girl.png',
                pageController: _pageController,
              ),
              OnBoardingBodyWidget(
                heroImage: 'assets/onboarding2_girl.png',
                pageController: _pageController,
              ),
              OnBoardingBodyWidget(
                heroImage: 'assets/onboarding3_girl.png',
                pageController: _pageController,
              ),
              customOnBoarding4(),
            ],
          ),
        ),
        bottomSheet: _currentPage < 3
            //container pink
            ? Container(
                decoration: const BoxDecoration(
                  color: pinkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                height: getProportionateScreenHeight(267),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: getProportionateScreenHeight(72),
                        left: getProportionateScreenWidth(37),
                        right: getProportionateScreenWidth(37),
                        bottom: getProportionateScreenHeight(70),
                      ),
                      child: Text(
                        //text tiap page
                        _currentPage == 0
                            ? 'Temukan kandungan produk perawatan kulit yang sesuai dengan kondisi kulit wajahmu.'
                            : _currentPage == 1
                                ? 'Scan kulit kamu untuk mengetahui jenis perawatan yang tepat.'
                                : _currentPage == 2
                                    ? 'Gapunya banyak waktu? Hemat waktumu bersama Lie Skin.'
                                    : '',
                        style: aclonicaTextStyle.copyWith(
                          color: whiteColor,
                          fontSize: getProportionateScreenWidth(18),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(25),
                          horizontal: getProportionateScreenWidth(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                //dots perpindahan onboarding
                                AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  height: 4,
                                  width: _currentPage == 0 ? 18 : 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _currentPage == 0
                                        ? greenColor
                                        : bgColor,
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  height: 4,
                                  width: _currentPage == 1 ? 18 : 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _currentPage == 1
                                        ? greenColor
                                        : bgColor,
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  height: 4,
                                  width: _currentPage == 2 ? 18 : 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _currentPage == 2
                                        ? greenColor
                                        : bgColor,
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Text(
                                'Next',
                                style: aclonicaTextStyle.copyWith(
                                  fontWeight: weightBold,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16),
                  vertical: getProportionateScreenHeight(21),
                ),
                child: GestureDetector(
                  onTap: () {
                    _storeOnboardInfo();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main', (route) => false);
                  },
                  child: Container(
                    height: getProportionateScreenHeight(51),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: pinkColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'Mulai!',
                        style: opensansTextStyle.copyWith(
                          fontWeight: weightSemiBold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
