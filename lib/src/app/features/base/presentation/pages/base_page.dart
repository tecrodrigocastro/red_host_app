import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:red_host_app/src/app/features/home/presentation/pages/home_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  PageController pageController = PageController();

  final List<Widget> _pages = [
    const HomePage(),
    const Center(
      child: Text('Page 2'),
    ),
    const Center(
      child: Text('Page 3'),
    ),
    const Center(
      child: Text('Page 4'),
    ),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 20.0),
        margin: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image(
                image: AppIcons.kingLogoPequena,
                color: _currentIndex == 0 ? AppColors.secondary : Colors.white,
                height: 35,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
                pageController.jumpToPage(0);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.cloud,
                color: _currentIndex == 1 ? AppColors.secondary : Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
                pageController.jumpToPage(1);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.credit_card,
                color: _currentIndex == 2 ? AppColors.secondary : Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
                pageController.jumpToPage(2);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.apps,
                color: _currentIndex == 3 ? AppColors.secondary : Colors.white,
                size: 30,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
                pageController.jumpToPage(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
