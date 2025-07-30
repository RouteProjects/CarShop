import 'package:flutter/material.dart';

class EditeProfile extends StatelessWidget {
  static const String routeName= "EditProfile";
  const EditeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Icon(Icons.arrow_back_ios),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ListTile(
                title: Text(
                  "Loction",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  "Update your location",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Switch(
                  activeColor: Colors.green,

                  value: true,
                  onChanged: (val) {},
                ),
              ),
            ),
            Divider(height: 2, endIndent: 20, indent: 20),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                title: Text(
                  "2 Step Verification",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text("No", style: TextStyle(color: Colors.grey)),
                onTap: (){},

              ),
            ),
            Divider(height: 2, endIndent: 20, indent: 20),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){},
              ),
            ),
            Divider(height: 2, endIndent: 20, indent: 20),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListTile(
                title: Text(
                  "Terms & Conditions",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){},
              ),
            ),
            Divider(height: 2, endIndent: 20, indent: 20),
          ],
        ),
      ),
    );
  }
}
