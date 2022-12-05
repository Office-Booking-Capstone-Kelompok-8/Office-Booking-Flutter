import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:office_booking_app/provider/building_provider.dart';
import 'package:office_booking_app/provider/set_state_provider.dart';
import 'package:office_booking_app/provider/login_provider.dart';
import 'package:office_booking_app/provider/user_provider.dart';
import 'package:office_booking_app/screen/building/building_detail_page.dart';
import 'package:office_booking_app/screen/profile_tile_page/change_password_page.dart';
import 'package:office_booking_app/screen/edit_profile/edit_profile_page.dart';
import 'package:office_booking_app/screen/login/forgot_password.dart';
import 'package:office_booking_app/screen/login/send_otp.dart';
import 'package:office_booking_app/screen/login/verify_otp.dart';
import 'package:office_booking_app/screen/navbar/order_page.dart';
import 'package:office_booking_app/screen/onboard/onboard_page.dart';
import 'package:office_booking_app/screen/order/order_detail_page.dart';
import 'package:office_booking_app/screen/profile_tile_page/help_center_page.dart';
import 'package:office_booking_app/screen/search/search_page.dart';
import 'package:office_booking_app/screen/search/search_result.dart';
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
        ChangeNotifierProvider(
          create: (context) => SetStateProvider(),
        ),
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => BuildingProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 831),
        builder: (context, child) => MaterialApp(
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(
              // loadingBuilder: (String msg) => ,
              ),
          debugShowCheckedModeBanner: false,
          title: 'Office Zone',
          routes: {
            '/': (context) => const Homepage(),
            '/form-page': (context) => const FormReservationPage(),
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
            '/navbar': (context) => const Navbar(),
            '/onboard': (context) => const OnboardPage(),
            '/edit-profile': (context) => const EditProfile(),
            '/order-detail': (context) => const OrderDetail(),
            '/order': (context) => const OrderPage(),
            '/building-detail': (context) => const BuildingDetail(),
            '/search': (context) => const SearchPage(),
            '/search-result': (context) => const SearchResult(),
            '/forgot-password': (context) => const ForgotPassword(),
            '/send-otp': (context) => const SendOtp(),
            '/verify-otp': (context) => const VerifyOtp(),
            '/change-password': (context) => const ChangePassword(),
            '/help-center': (center) => const HelpCenter(),
          },
          initialRoute: '/onboard',
          theme: ThemeData(
            disabledColor: AppColors.neutral7,
            canvasColor: AppColors.white,
            fontFamily: 'Inter',
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
