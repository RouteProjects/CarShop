import 'package:flutter/material.dart';

class SearchFilterContainerCustomized extends StatelessWidget {
  const SearchFilterContainerCustomized({
    super.key,
    required this.onTapsearch,
    required this.onTapfilter,
  });
  final VoidCallback onTapsearch;
  final VoidCallback onTapfilter;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select or search your \n favourite vehicle',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onTapsearch,
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Icon(Icons.search, color: Colors.grey),

                        SizedBox(width: 10),
                        Text('Search'),
                      ],
                    ),
                  ),
                ),
              ),
              // Expanded(

              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: 'Search',
              //       prefixIcon: Icon(Icons.search),
              //       border: OutlineInputBorder(
              //         borderSide: BorderSide.none,
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       filled: true,
              //       fillColor: Colors.grey.shade100,
              //     ),
              //   ),
              // ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: onTapfilter,
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6B73BB), Color(0xFF3E83C0)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Icon(Icons.filter_alt_outlined, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
