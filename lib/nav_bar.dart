import 'package:flutter/material.dart';
class NavBar extends StatelessWidget {
  NavBar({required this.onPress,required this});
  final Image iimage;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          MaterialButton(
              onPressed: onPress,
              child: Image(image: AssetImage(iimage),

              ),
          )
        ],
      ),
    );
  }
}
