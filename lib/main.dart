import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/provider/navbar_provider.dart';
import 'package:office_booking_app/screen/login/login_page.dart';
import 'package:provider/provider.dart';

import 'screen/home/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavbarProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 831),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Office Zone',
          routes: {
            '/': (context) => const Homepage(),
            '/login': (context) => const LoginPage(),
          },
          initialRoute: '/login',
          theme: ThemeData(
            fontFamily: 'Inter',
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
