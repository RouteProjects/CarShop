import 'package:carshop/Scan_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCard extends StatefulWidget {
  static const String routeName = "AddCart";

  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _formKey = GlobalKey<FormState>();
  final cardController = TextEditingController();
  final dayController = TextEditingController();
  final yearController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  void dispose() {
    cardController.dispose();
    cvvController.dispose();
    dayController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset("Assets/images/scanner.png"),
              ),
            ),
          ],
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Add New Card",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                TextFormField(
                  maxLength: 16,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: cardController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "2689 5624****2568",
                    prefixIcon: const Icon(
                      Icons.credit_card,
                      color: Colors.blueAccent,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFf7f7fb),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Card number is required';
                    }
                    if (value.replaceAll(' ', '').length < 16) {
                      return 'Enter a valid 16-digit card number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: dayController,
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          hintText: "Month",
                          filled: true,
                          fillColor: const Color(0xFFf7f7fb),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Month is required';
                          }
                          int? month = int.tryParse(value);
                          if (month == null || month < 1 || month > 12) {
                            return 'Enter valid month (1-12)';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: yearController,
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          hintText: "Year",
                          filled: true,
                          fillColor: const Color(0xFFf7f7fb),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Year is required';
                          }
                          int? year = int.tryParse(value);
                          int currentYear = DateTime.now().year;
                          if (year == null || year < currentYear) {
                            return 'Enter valid year (>= $currentYear)';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: cvvController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "***",
                          filled: true,
                          fillColor: const Color(0xFFf7f7fb),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'CVV is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset("Assets/images/check.png", width: 15),
                    const SizedBox(width: 10),
                    const Text("Save Card Details"),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
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
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, ScanCard.routeName);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Card added successfully'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Add Card",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
