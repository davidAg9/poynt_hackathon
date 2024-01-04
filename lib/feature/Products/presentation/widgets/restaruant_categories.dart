import 'package:flutter/material.dart';

import '../models/menu.dart';

class RestaurantCategories extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onChanged;
  final int selectedCategoryInxed;

  RestaurantCategories(
      {required this.onChanged, required this.selectedCategoryInxed});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.04),
          offset: const Offset(0, 2),
          blurRadius: 4,
        ),
      ]),
      height: 52,
      child: Categories(
        onChanged: onChanged,
        selectedIndex: selectedCategoryInxed,
      ),
    );
  }

  @override
  double get maxExtent => 52;

  @override
  double get minExtent => 52;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required this.onChanged,
    required this.selectedIndex,
  }) : super(key: key);

  final ValueChanged<int> onChanged;
  final int selectedIndex;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // int selectedIndex = 0;
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Categories oldWidget) {
    _controller.animateTo(
      80.0 * widget.selectedIndex,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          demoCategoryMenus.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 8),
            child: TextButton(
              onPressed: () {
                widget.onChanged(index);
                // _controller.animateTo(
                //   80.0 * index,
                //   curve: Curves.ease,
                //   duration: const Duration(milliseconds: 200),
                // );
              },
              style: TextButton.styleFrom(
                  primary: widget.selectedIndex == index
                      ? Colors.black
                      : Colors.black45),
              child: Text(
                demoCategoryMenus[index].category,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
