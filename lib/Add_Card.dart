
import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  static const String routename = "AddCart";

  const AddCard({super.key});

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
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
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
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  hintText: "2689 5624****2568",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  prefixIcon: Icon(Icons.credit_card, color: Colors.blueAccent),
                  filled: true,
                  fillColor: Color(0xFFf7f7fb),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 19, top: 25),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 180,

                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        hintText: "12/2024",
                        hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        filled: true,
                        fillColor: Color(0xFFf7f7fb),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 80,
                    width: 180,

                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        hintText: "***",
                        hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        filled: true,
                        fillColor: Color(0xFFf7f7fb),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),

              child: Row(
                children: [
                  Image.asset("Assets/images/check.png", width: 15),
                  SizedBox(width: 10),
                  Text("Save Card Details"),
                ],
              ),
            ),
            SizedBox(height: 450),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF7474BF), Color(0xFF348AC7)],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(routename);
                        },
                        child: Text(
                          "Add Card",
                          style: TextStyle(color: Colors.white, fontSize: 16),
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
