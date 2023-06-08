import 'package:alwafeer/core/utils/constants/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GamingCardsStep1 extends StatelessWidget {
  const GamingCardsStep1({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = [
      _getCard(AssetsPath.PUBG_GAME, 'PUBG'),
      _getCard(AssetsPath.FREE_FIRE_GAME, 'Free Fire'),
      _getCard(AssetsPath.BALL_POOL_GAME, 'Ball Pool'),
      _getCard(AssetsPath.J_GAME, 'Jawaker Game'),
    ];
    return AnimationLimiter(
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 5 / 4,
        children: List.generate(
          _items.length,
          (index) => AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 2,
            duration: const Duration(milliseconds: 1500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              horizontalOffset: -50,
              child: FadeInAnimation(child: _items[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getCard(String image, String title) {
    return InkWell(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: GridTile(
            footer: GridTileBar(
              title: Text(title),
              backgroundColor: Colors.black54,
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
