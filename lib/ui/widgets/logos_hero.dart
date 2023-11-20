import 'package:flutter/widgets.dart';
import 'package:patrol_challenge/ui/images.dart';

class LogoHero extends StatelessWidget {
  const LogoHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logoHero',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PTImages.patrolLogo,
          PTImages.leancodeLogo,
        ],
      ),
    );
  }
}
