import 'package:carshop/Book_Screen.dart';
import 'package:carshop/Home_Content.dart';
import 'package:carshop/My_Profile.dart';
import 'package:carshop/Notification_Screen.dart';
import 'package:flutter/material.dart';
import 'Models/brandModel.dart';
import 'Models/carModel.dart'; // Assuming you have a car model class

class HomePageScreen extends StatefulWidget {
  static const String routename = "Homescreen";

  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int changeIndex = 0;

  List<Widget> screen = [
    Home(),
    BookScreen(),
    NotificationScreen(),
    Profile(),
  ];

  List<Car> fakeCars = [
    Car(
      name: "Toyota Corolla",
      transmission: "Automatic",
      type: "Sedan",
      pricePerDay: 50.0,
      reviews: 4.2,
      imageUrl: "Assets/images/car2.webp",
      rating: 4.5,
      brand: "Toyota",
    ),
    Car(
      name: "Honda Civic",
      transmission: "Automatic",
      type: "SUV",
      pricePerDay: 55.0,
      reviews: 4.4,
      imageUrl: "Assets/images/car2.webp",
      rating: 4.6,
      brand: "Honda",
    ),
    Car(
      name: "Audi A4",
      transmission: "Manual",
      type: "SUV",
      pricePerDay: 100.0,
      reviews: 4.9,
      imageUrl: "Assets/images/car2.webp",
      rating: 5.0,
      brand: "Audi",
    ),
    Car(
      name: "Toyota A4",
      transmission: " Manual",
      type: "Sedan",
      pricePerDay: 100.0,
      reviews: 4.9,
      imageUrl: "Assets/images/car2.webp",
      rating: 5.0,
      brand: "Toyota",
    ),
    Car(
      name: "Tesla Model 3",
      transmission: "Electric",
      type: "Electric",
      pricePerDay: 150.0,
      reviews: 4.9,
      imageUrl: "Assets/images/car2.webp",
      rating: 5.0,
      brand: "Tesla",
    ),
    Car(
      name: "Tesla Model 3",
      transmission: "Electric",
      type: "Electric",
      pricePerDay: 150.0,
      reviews: 4.9,
      imageUrl: "Assets/images/car2.webp",
      rating: 5.0,
      brand: "Tesla",
    ),
  ];

  List<Brand> fakeBrands = [
    Brand(name: 'Toyota', imagePath: 'Assets/images/w.png'),
    Brand(name: 'Honda', imagePath: 'Assets/images/hynda.png'),
    Brand(name: 'Tesla', imagePath: 'Assets/images/nissan.png'),
    Brand(name: 'Audi', imagePath: 'Assets/images/hynda.png'),
    Brand(name: 'BMW', imagePath: 'Assets/images/w.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: IndexedStack(
        index: changeIndex,
        children: screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: changeIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            changeIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "",
          ),
        ],
      ),
    );
  }
}
