import 'package:flutter/material.dart';

class BrandCardWidget extends StatelessWidget {
  const BrandCardWidget({
    super.key,
    required this.imagePath,
    required this.brandName,
    required this.onTap,
  });

  final String imagePath;
  final String brandName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.contain),
            SizedBox(height: 5),
            Text(
              brandName,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
