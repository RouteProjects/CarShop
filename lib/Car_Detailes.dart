import 'package:carshop/Add_Card.dart';
import 'package:carshop/HomePageScreen/Screens/HomePageScreen.dart';
import 'package:flutter/material.dart';
import 'Models/brandModel.dart';
import 'package:carshop/HomePageScreen/Widgets/CarCard.dart';

class CarDetails extends StatelessWidget {
  static const String routeName = "CarDetails";

  CarDetails({super.key});

  final List<Brand> fakeBrands = [
    Brand(name: 'Toyota', imagePath: 'Assets/images/w.png'),
    Brand(name: 'Honda', imagePath: 'Assets/images/hynda.png'),
    Brand(name: 'Tesla', imagePath: 'Assets/images/nissan.png'),
    Brand(name: 'Audi', imagePath: 'Assets/images/hynda.png'),
    Brand(name: 'BMW', imagePath: 'Assets/images/w.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf7f7fb),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, HomePageScreen.routename);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 25),
          ),
        ),
        title: const Text(
          "Toyota Corolla",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close, color: Colors.black, size: 25),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: SizedBox(
                  width: 400,
                  height: 300,
                  child: Image.asset(
                    "Assets/images/car2.webp",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "All Features",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  _FeatureCard(
                    icon: Icons.settings_input_component_outlined,
                    title: "Transmission",
                    subtitle: "Automatic",
                  ),
                  SizedBox(width: 20),
                  _FeatureCard(
                    icon: Icons.event_seat,
                    title: "Doors & Seats",
                    subtitle: "2 Doors & Seats",
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  _FeatureCard(
                    icon: Icons.ac_unit_outlined,
                    title: "Air Condition",
                    subtitle: "Climat Control",
                  ),
                  SizedBox(width: 20),
                  _FeatureCard(
                    icon: Icons.local_gas_station_outlined,
                    title: "Fuel Type",
                    subtitle: "Petrol",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text("Total Price", style: TextStyle(color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "1200/day",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7474BF), Color(0xFF348AC7)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 35,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(AddCard.routeName);
                      },
                      child: const Text(
                        "Book Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
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

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white54,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Icon(icon, color: Colors.blueAccent),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
