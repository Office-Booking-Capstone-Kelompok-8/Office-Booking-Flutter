import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_booking_app/screen/onboard/onboard_page.dart';
import 'provider/onboard_provider.dart';
import 'screen/navbar/navbar.dart';
import 'utils/constant/app_colors.dart';
import 'provider/navbar_provider.dart';
import 'screen/form_reservation_page/form_reservation_page.dart';
import 'screen/login/login_page.dart';
import 'screen/login/register_page.dart';
import 'package:provider/provider.dart';

import 'screen/navbar/homepage.dart';

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
        ChangeNotifierProvider(create: (context) => OnboardProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 831),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Office Zone',
          routes: {
            '/': (context) => const Homepage(),
            '/form-page': (context) => const FormReservationPage(),
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
            '/navbar': (context) => const Navbar(),
            '/onboard': (context) => const OnboardPage(),
          },
          initialRoute: '/onboard',
          theme: ThemeData(
            canvasColor: AppColors.white,
            fontFamily: 'Inter',
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
