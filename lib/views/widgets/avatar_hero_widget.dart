import 'package:flutter/material.dart';

class AvatarHero extends StatelessWidget {
  final img;

  const AvatarHero({
    Key key,
    @required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.transparent,
          
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          radius: 70.0,
          backgroundImage: NetworkImage(
            "$img",
          ),
        ),
      ),
    );
  }
}
