void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        splash.routename: (_) => splash(),
        Onboardingscreen.routName: (_) => Onboardingscreen(),
        LoginScreen.routename: (context) => LoginScreen(),
        ForgotPassword.routename: (context) => ForgotPassword(),
        Register.routename: (_) => Register(),
        HomePageScreen.routename: (_) => HomePageScreen(),
        CarDetails.routename: (_) => CarDetails(),
        AddCard.routename: (_) => AddCard(),
        Profile.routeName: (_) => Profile(),
        ScanCard.routeName: (_) => ScanCard(),
      },
      initialRoute: splash.routename,
    );
  }
}
