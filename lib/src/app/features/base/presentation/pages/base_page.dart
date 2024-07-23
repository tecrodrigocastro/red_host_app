import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:red_host_app/src/app/features/home/presentation/pages/home_page.dart';
import 'package:red_host_app/src/app/features/hub/presentation/pages/hub_page.dart';
import 'package:red_host_app/src/app/features/invoices/presentation/pages/invoices_page.dart';
import 'package:red_host_app/src/app/features/plans/presentation/pages/plans_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late PageController pageController;

  final List<Widget> _pages = [
    const HomePage(),
    const PlansPage(),
    const InvoicesPage(),
    const HubPage(),
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.index);
    setState(() {
      _currentIndex = widget.index;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
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
