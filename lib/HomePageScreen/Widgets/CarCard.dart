import 'package:carshop/Register.dart';
import 'package:flutter/material.dart';

class CarCardWidget extends StatelessWidget {
  const CarCardWidget({
    super.key,
    required this.carName,
    required this.carType,
    required this.carImagePath,
    required this.carPrice,
    required this.carRating,
    required this.carReviews,
  });

  final String carName;
  final String carType;
  final String carImagePath;
  final String carRating;
  final String carReviews;
  final String carPrice;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Register.routename);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(carImagePath, width: double.infinity),
                Positioned(
                  top: -5,
                  right: -5,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  carName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(carType, style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Handle tap
                  },
                  child: Icon(
                    Icons.star_border_rounded,
                    color: Colors.orangeAccent,
                    size: 30,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  carRating,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(width: 4),
                Text(
                  '($carReviews reviews)',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Spacer(),
                Text(
                  '\$$carPrice/day',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF7586C2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
