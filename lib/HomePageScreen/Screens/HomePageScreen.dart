import 'package:carshop/Register.dart';
import 'package:flutter/material.dart';
import '../../CarByBrandScreen/CarByBrandScreen.dart';
import '../../FilterScreen/FilterCarsScreen.dart';
import '../../Models/brandModel.dart';
import '../../Models/carModel.dart';
import '../../SearchScreen/SearchScreen.dart';
import '../Widgets/BrandCard.dart';
import '../Widgets/CarCard.dart';
import '../Widgets/SearchContainer.dart';
import '../Widgets/UserInformation.dart';

class HomePageScreen extends StatefulWidget {
  static const String routename = "Homescreen";
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  // ignore: override_on_non_overriding_member
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6F8),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            UserInformation(),
            const SizedBox(height: 20),
            SearchFilterContainerCustomized(
              onTapsearch: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchCarsScreen(allCars: fakeCars),
                  ),
                );
              },

              onTapfilter: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterCarsScreen(allCars: fakeCars),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Top Brands',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Color(0xFF7586C2),
                    ),
                    child: Text('view all'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fakeBrands.length,
                itemBuilder: (context, index) {
                  final brand = fakeBrands[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: BrandCardWidget(
                      imagePath: brand.imagePath,
                      brandName: brand.name,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => CarByBrandScreen(
                                  brand: brand.name,
                                  allCars: fakeCars,
                                ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'All Cars',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Color(0xFF7586C2),
                        ),
                        child: Text('view all'),
                      ),
                    ],
                  ),
                ),

                ListView.builder(
                  shrinkWrap: true, // Important!
                  physics:
                      NeverScrollableScrollPhysics(), // Disable inner scroll
                  itemCount: fakeCars.length,
                  itemBuilder: (context, index) {
                    final car = fakeCars[index];
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
