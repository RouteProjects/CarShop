import 'package:carshop/Loginscreen.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const String routename = "Register";
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
void navigateBack(BuildContext context) {
  Navigator.pushReplacementNamed(context, LoginScreen.routename);
}
class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    confirmEmailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // All fields are valid
      print("Form is valid. Proceed to backend call.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Back Button
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        navigateBack(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_sharp),
                    ),
                  ),
                ),
                // Header
                Text("Create New Account", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xff131A34))),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Text("Set up your username and password. You can always change it later.", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Color(0xff808493))),
                ),
                SizedBox(height: 30),

                // Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Email is required";
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return "Enter a valid email";
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Enter your New Email",
                      filled: true,
                      fillColor: Color.fromRGBO(128, 132, 147, 0.05),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Confirm Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: confirmEmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please confirm your email";
                      if (value != emailController.text) return "Emails do not match";
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Confirm Email",
                      filled: true,
                      fillColor: Color.fromRGBO(128, 132, 147, 0.05),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Password is required";
                      if (value.length < 6) return "Password must be at least 6 characters";
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                        onPressed: _togglePasswordVisibility,
                      ),
                      hintText: "Enter New Password",
                      filled: true,
                      fillColor: Color.fromRGBO(128, 132, 147, 0.05),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Confirm Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    obscureText: _obscurePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Please confirm your password";
                      if (value != passwordController.text) return "Passwords do not match";
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                        onPressed: _togglePasswordVisibility,
                      ),
                      hintText: "Confirm Password",
                      filled: true,
                      fillColor: Color.fromRGBO(128, 132, 147, 0.05),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                    ),
                  ),
                ),

                // Sign up Button
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF7474BF), Color(0xFF348AC7)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Sign up', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                ),

                // Already have an account?
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.routename);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(
                          text: " Log in",
                          style: TextStyle(
                            color: Color(0xff6679C0),
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff6679C0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Social Media login (as is)
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Color(0xffD8D8D8), thickness: 1, endIndent: 10)),
                      Text("Or sign in with", style: TextStyle(color: Color(0xff131A34), fontSize: 16)),
                      Expanded(child: Divider(color: Color(0xffD8D8D8), thickness: 1, indent: 10)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Google"),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(157, 48),
                          backgroundColor: Color.fromRGBO(216, 216, 216, 0.05),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Facebook"),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(157, 48),
                          backgroundColor: Color.fromRGBO(216, 216, 216, 0.05),
                        ),
                      ),
                    ],
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
