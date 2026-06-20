import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.black,
      actions: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: primary,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          child: Text("Inicio", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
