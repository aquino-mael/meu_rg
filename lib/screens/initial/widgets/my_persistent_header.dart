import 'package:flutter/material.dart';

class MyPersistentHeader extends SliverPersistentHeaderDelegate {
  final double eightyFivePercentOfScreen;

  const MyPersistentHeader({
    required this.eightyFivePercentOfScreen,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double opacity = shrinkOffset / maxExtent;
    double dxImage = -((shrinkOffset / maxExtent) * 100);
    double dxText = ((shrinkOffset / maxExtent) * 100);

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: Offset(dxText, 0.0),
            child: Text(
              'MEU PRIMEIRO RG',
              style: TextStyle(
                color: Colors.black.withOpacity(opacity),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(dxImage, 0.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 100,
                maxWidth: 100,
              ),
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => eightyFivePercentOfScreen;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}