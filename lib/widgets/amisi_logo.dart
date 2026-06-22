import 'package:flutter/material.dart';
import 'package:jocar_web/constants.dart';

class AmisiLogo extends StatelessWidget {
  const AmisiLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: colorSecondaryContainer.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: colorSecondaryContainer.withValues(alpha: 0.15),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Image.network(
        'https://lh3.googleusercontent.com/aida-public/AB6AXuCps-QgzAOpVmvksm1YwH1QlVLddnMGCMYQ5ZiqKV7muRJf4dM_NP8_vsyThW3pasRwQ7_-WrHVv9i92mgVa8-sayhL5rk-g-cLAxePmEsECxwLdsE3Eip7gXhU3j6P5Ytv6yBBWdoq-zsMPyxzQcqEDBsaeHHA63RrANqQxFW0t3xmqdFyNaaA7bxOF3x9iacyBLb3SPWttHVecD_VrGd0lLLLq_AWXvfTu_PMOFZPrathxvb8EXz-gvU-J68phFjwvJwrj2g6yO8',
        height: 48,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => const SizedBox(
          height: 48,
          child: Icon(Icons.shield, color: Colors.grey),
        ),
      ),
    );
  }
}
