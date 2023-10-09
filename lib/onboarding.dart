import 'package:fishsnap/constants.dart';
import 'package:fishsnap/signin.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0, top: 30.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(), 
                  ),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 60),
              child: Center(
                child: PageView(
                  onPageChanged: (int page) {
                    setState(() {
                      currentIndex = page;
                    });
                  },
                  controller: _pageController,
                  children: const [
                    createPage(
                      images: 'assets/images/onboardingOne.png',
                      title: 'Discover Fish Species',
                      description: 'Explore a vast collection of fish species and their characteristics.',
                    ),
                    createPage(
                      images: 'assets/images/onboardingTwo.png',
                      title: "Identify Fishes",
                      description: "Use our AI-powered tool to identify unknown fish species from photos.",
                    ),
                    createPage(
                      images: 'assets/images/onboardingThree.png',
                      title: "Dive into the world of fish",
                      description: "Learn more about fish species and their characteristics.",
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 40,
              child: Row(
                children: _buildIndicator(),
              ),
            ),
            Positioned(
              bottom: 40,
              right: 40,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.primaryColor,
                ),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (currentIndex < 2) {
                          currentIndex++;
                          if (currentIndex < 3) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          }
                        } else {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => const SignInPage()));
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: Colors.white,
                    )),
                ),
            ),
          ],
        ),
      ),
    );
  }
  //extra widgets
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(right: 5.0),
        height: 8.0,
        width: isActive ? 24.0 : 16.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
    );
  }

//Create the indicator list
List<Widget> _buildIndicator() {
  List<Widget> indicators = [];

  for (int i = 0; i < 3; i++) {
    if (currentIndex == i) {
      indicators.add(_indicator(true));
    } else {
      indicators.add(_indicator(false));
    }
  }
  return indicators;
 }
}

// ignore: camel_case_types
class createPage extends StatelessWidget {
  final String images;
  final String title;
  final String description;

  const createPage({
    Key? key,
    required this.images,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        children: [
          Image.asset(
            images,
            height: 300,
            width: 300,
          ),
          const SizedBox(height: 30.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}