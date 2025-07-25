import 'package:flutter/material.dart';
import '../Models/carModel.dart';
import '../HomePageScreen/Widgets/CarCard.dart';

class SearchCarsScreen extends StatefulWidget {
  final List<Car> allCars;

  const SearchCarsScreen({Key? key, required this.allCars}) : super(key: key);

  @override
  State<SearchCarsScreen> createState() => _SearchCarsScreenState();
}

class _SearchCarsScreenState extends State<SearchCarsScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    List<Car> filteredCars =
        _query.isEmpty
              ? []
              : widget.allCars
                  .where(
                    (car) =>
                        car.name.toLowerCase().contains(_query.toLowerCase()) ||
                        car.transmission.toLowerCase().contains(
                          _query.toLowerCase(),
                        ),
                  )
                  .toList()
          ..sort((a, b) => a.name.compareTo(b.name)); // Sort alphabetically

    return Scaffold(
      backgroundColor: Color(0xFFF4F6F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF4F6F8),

        title: Center(child: const Text('Search Cars')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search by name or type or brand...',
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
            ),
          ),
          Expanded(
            child:
                _query.isEmpty
                    ? const Center(
                      child: Text("Start typing to search for cars"),
                    )
                    : filteredCars.isEmpty
                    ? const Center(child: Text("No cars found."))
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
          ),
        ],
      ),
    );
  }
}
