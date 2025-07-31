import 'package:flutter/material.dart';
import 'Models/carModel.dart';
import 'HomePageScreen/Widgets/CarCard.dart';

class CarByBrandScreen extends StatefulWidget {
  final String brand;
  final List<Car> allCars;

  const CarByBrandScreen({Key? key, required this.brand, required this.allCars})
    : super(key: key);

  @override
  State<CarByBrandScreen> createState() => _CarByBrandScreenState();
}

class _CarByBrandScreenState extends State<CarByBrandScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter by brand first
    List<Car> filteredCars =
        widget.allCars
            .where(
              (car) => car.brand.toLowerCase() == widget.brand.toLowerCase(),
            )
            .toList();

    // Then filter by search query
    List<Car> searchedCars =
        filteredCars.where((car) {
          return car.name.toLowerCase().contains(_searchQuery.toLowerCase());
        }).toList();

    return Scaffold(
      backgroundColor: Color(0xFFF4F6F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F6F8),
        title: Center(child: Text('${widget.brand} Cars')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search ${widget.brand} car by name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          Expanded(
            child:
                searchedCars.isEmpty
                    ? Center(
                      child: Text(
                        'No cars found',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                    : ListView.builder(
                      itemCount: searchedCars.length,
                      itemBuilder: (context, index) {
                        final car = searchedCars[index];
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
          ),
        ],
      ),
    );
  }
}
