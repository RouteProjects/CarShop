import 'package:flutter/material.dart';
import 'Models/carModel.dart';
import 'HomePageScreen/Widgets/CarCard.dart';

class FilteredResultScreen extends StatelessWidget {
  final List<Car> filteredCars;

  const FilteredResultScreen({super.key, required this.filteredCars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        title: Center(child: Text("Results (${filteredCars.length})")),
        backgroundColor: const Color(0xFFF4F6F8),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Navigate to filter options page
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body:
          filteredCars.isEmpty
              ? Center(
                child: Text('No cars found', style: TextStyle(fontSize: 18)),
              )
              : ListView.builder(
                itemCount: filteredCars.length,
                itemBuilder: (context, index) {
                  final car = filteredCars[index];
                  return CarCardWidget(
                    carName: car.name,
                    carType: car.transmission,
                    carImagePath: car.imageUrl,
                    carPrice: car.pricePerDay.toString(),
                    carRating: car.rating.toString(),
                    carReviews: car.reviews.toString(),
                  );
                },
              ),
    );
  }
}
