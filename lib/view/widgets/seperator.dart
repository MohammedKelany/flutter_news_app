import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(5.0),
      child: ColoredBox(
        color: Colors.black12,
        child: SizedBox(
          width: double.infinity,
          height: 3,
        ),
      ),
    );
  }
}
