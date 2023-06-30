import 'dart:async';

import 'package:dubox_app/utils/colors.dart';
import 'package:flutter/material.dart';

class DashboardBannerWidget extends StatefulWidget {
  @override
  _DashboardBannerWidgetState createState() => _DashboardBannerWidgetState();
}

class _DashboardBannerWidgetState extends State<DashboardBannerWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const _duration = Duration(milliseconds: 500);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Auto-scroll to the next page every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _animateToNextPage();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    _timer.cancel();
  }

  void _animateToNextPage() {
    if (_currentPage < _images.length - 1) {
      _pageController.nextPage(duration: _duration, curve: Curves.ease);
    } else {
      _pageController.animateToPage(0, duration: _duration, curve: Curves.ease);
    }
  }

  final List<String> _images = [
    "https://static.vecteezy.com/system/resources/previews/004/299/835/original/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-free-vector.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/004/707/493/small/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-vector.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/004/299/835/small/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-free-vector.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/002/006/774/small/paper-art-shopping-online-on-smartphone-and-new-buy-sale-promotion-backgroud-for-banner-market-ecommerce-free-vector.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                _images[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: _images.length,
          ),
          Positioned(
            bottom: 16.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _images.length,
                (int index) {
                  return AnimatedContainer(
                    duration: _duration,
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    width: _currentPage == index ? 16.0 : 8.0,
                    height: 8.0,
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: _currentPage == index
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
