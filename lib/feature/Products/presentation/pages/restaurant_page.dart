import 'package:flutter/material.dart';
import 'package:poynt_hackathon/feature/Products/data/models/menu.dart';
import 'package:poynt_hackathon/feature/Products/presentation/widgets/menu_category_item.dart';
import 'package:poynt_hackathon/feature/Products/presentation/widgets/restaruant_categories.dart';
import 'package:poynt_hackathon/feature/Products/presentation/widgets/restaurant_page_app_bar.dart';

import 'restaurant_info.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  double restaurantInfoHeight = 200 // AppBar expandedHeight
      +
      170 // Restaruant info height
      -
      kToolbarHeight;
  int selectedCategoryInxed = 0;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(
      () {
        updateCategoryOnScroll(_scrollController.offset);
      },
    );

    createBreackPoints();

    super.initState();
  }

  void scrollToCategory(int index) {
    if (selectedCategoryInxed != index) {
      int totalItems = 0;
      for (var i = 0; i < index; i++) {
        totalItems += demoCategoryMenus[i].items.length;
      }
      _scrollController.animateTo(
        // 116 = 100 Menu Item Height + 16 bottom pading of each item
        // 50 = 18 title font size + 32 (16 vertical padding on title)
        restaurantInfoHeight + (116 * totalItems) + 50 * index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        selectedCategoryInxed = index;
      });
    }
  }

  List<double> breackPoints = [];
  void createBreackPoints() {
    double firstBreakPoint = restaurantInfoHeight + 50 + (116 * demoCategoryMenus[0].items.length);
    breackPoints.add(firstBreakPoint);

    for (var i = 1; i < demoCategoryMenus.length; i++) {
      double breakpoint = breackPoints.last + 50 + (116 * demoCategoryMenus[i].items.length);
      breackPoints.add(breakpoint);
    }
  }

  void updateCategoryOnScroll(double offset) {
    for (var i = 0; i < demoCategoryMenus.length; i++) {
      if (i == 0) {
        if ((offset < breackPoints.first) & (selectedCategoryInxed != 0)) {
          setState(() {
            selectedCategoryInxed = 0;
          });
        }
      } else {
        if ((breackPoints[i - 1] <= offset) & (offset < breackPoints[i])) {
          if (selectedCategoryInxed != i) {
            setState(() {
              selectedCategoryInxed = i;
            });
          }
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // _scrollController.removeListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const RestaruantPageAppBar(),
          const RestaurantInfo(),
          SliverPersistentHeader(
            delegate: RestaurantCategories(
              selectedCategoryInxed: selectedCategoryInxed,
              onChanged: scrollToCategory,
            ),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, categoryIndex) {
                  final List<Menu> items = demoCategoryMenus[categoryIndex].items;
                  return MenuCategoryItem(
                    title: demoCategoryMenus[categoryIndex].category,
                    items: List.generate(
                      demoCategoryMenus[categoryIndex].items.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: MenuCard(
                          title: items[index].title,
                          image: items[index].image,
                          price: items[index].price,
                        ),
                      ),
                    ),
                  );
                },
                childCount: demoCategoryMenus.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
