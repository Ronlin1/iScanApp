import 'package:iscan/utils/constants.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  ReusableCard(
      {required this.image, required this.time, required this.nextChild});

  final String image;
  final double time;
  final Widget nextChild;

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard>
    with TickerProviderStateMixin {
  late final Tween<Offset> tween =
      Tween(begin: Offset(0.5, 0), end: Offset(0, 0));
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInQuad,
    );
    Future.delayed(
      Duration(milliseconds: (200 * widget.time).toInt()),
      () {
        animationController.forward();
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(tween),
      child: FadeTransition(
        opacity: animation,
        child: OpenContainer(
          openColor: kPrimaryColor,
          closedColor: kPrimaryColor,
          transitionDuration: Duration(milliseconds: 200),
          transitionType: ContainerTransitionType.fade,
          closedElevation: 0,
          openBuilder: (BuildContext c, _) {
            return widget.nextChild;
          },
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          closedBuilder: (BuildContext c, _) {
            return Container(
              height: 130,
              width: 140,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(widget.image),
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 15,
                    color: Colors.black38,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
