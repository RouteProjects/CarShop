import 'package:flutter/material.dart';
import '../Models/carModel.dart';
import 'FilteredResultScreen.dart';

class FilterCarsScreen extends StatefulWidget {
  final List<Car> allCars;

  const FilterCarsScreen({super.key, required this.allCars});

  @override
  State<FilterCarsScreen> createState() => _FilterCarsScreenState();
}

class _FilterCarsScreenState extends State<FilterCarsScreen> {
  RangeValues selectedRange = const RangeValues(50, 300);

  // MULTI SELECTION sets
  Set<String> selectedTypes = {};
  Set<String> selectedFeatures = {};

  List<String> types = ["Economy", "Compact", "SUV", "Luxury", "Sedan"];
  List<String> features = [
    "Air-conditioning",
    "Automatic",
    "Manual",
    "Electric",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Center(child: const Text("Filter Cars")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Price Range",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RangeSlider(
              activeColor: const Color(0xFF7586C2),
              values: selectedRange,
              min: 0,
              max: 500,
              divisions: 20,
              labels: RangeLabels(
                '${selectedRange.start.toInt()}',
                '${selectedRange.end.toInt()}',
              ),
              onChanged: (values) {
                setState(() {
                  selectedRange = values;
                });
              },
            ),
            const SizedBox(height: 20),

            const Text(
              "Types",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 10,
              children:
                  types.map((type) {
                    return FilterChip(
                      backgroundColor: Color(0xFFF4F6F8),
                      side: BorderSide.none,
                      showCheckmark: false,
                      label: Text(type),
                      selected: selectedTypes.contains(type),
                      selectedColor: Color(0xFF7586C2),
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedTypes.add(type);
                          } else {
                            selectedTypes.remove(type);
                          }
                        });
                      },
                    );
                  }).toList(),
            ),

            const SizedBox(height: 20),
            const Text(
              "Vehicle Characteristics",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 10,
              children:
                  features.map((feature) {
                    return FilterChip(
                      backgroundColor: Color(0xFFF4F6F8),
                      side: BorderSide.none,
                      showCheckmark: false,
                      label: Text(feature),
                      selected: selectedFeatures.contains(feature),
                      selectedColor: Color(0xFF7586C2),

                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedFeatures.add(feature);
                          } else {
                            selectedFeatures.remove(feature);
                          }
                        });
                      },
                    );
                  }).toList(),
            ),

            const Spacer(),
            GestureDetector(
              onTap: () {
                List<Car> filteredCars =
                    widget.allCars.where((car) {
                      bool matchesPrice =
                          car.pricePerDay >= selectedRange.start &&
                          car.pricePerDay <= selectedRange.end;

                      bool matchesType =
                          selectedTypes.isEmpty ||
                          selectedTypes.contains(car.type);

                      bool matchesFeatures =
                          selectedFeatures.isEmpty ||
                          selectedFeatures.any(
                            (feature) => car.transmission.contains(feature),
                          );

                      return matchesPrice && matchesType && matchesFeatures;
                    }).toList();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            FilteredResultScreen(filteredCars: filteredCars),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6B73BB), Color(0xFF3E83C0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Apply Filter",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
