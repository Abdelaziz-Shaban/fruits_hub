
import 'package:flutter/cupertino.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/auth/presentation/views/signup_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/on_boarding_view.dart';

import '../../features/splash/presentation/views/splash_view.dart';

class AppRoutesName {
  AppRoutesName._();
  static const String splash="/";
  static const String onBoarding="/onBoard";
  static const String loginView="/Login";
  static const String signupView="/signup";
  // static const String forgotPasswordScreen="/forgotPassword";
  // static const String resetPassword="/resetPassword";
  // static const String createUserName="/createName";
  // static const String selectProfilePhoto="/selectPhoto";
  // static const String SelectInterestView="/interestView";
  // static const String homeScreen="/home";
  // static const String searchScreen="/search";
  // static const String mapViewScreen="/map";
  // static const String eventDetails="/details";
  // static const String mainScreen="/mainScreen";
  // static const String orderDetals="/orderDetals";
  // static const String viewTicket="/viewTicket";
  // static const String allTickets="/allTickets";
  // static const String cancelBooking="/cancelBooking";
  // static const String otpVerification="/cancelBooking";


}

class Routes{
  Routes._();
  static  Map<String,Widget Function(BuildContext)> routes= {
    AppRoutesName.splash:(_)=>const SplashView(),
    AppRoutesName.onBoarding:(_)=>const OnBoardingView(),
    AppRoutesName.loginView:(_)=>const LoginView(),
     AppRoutesName.signupView:(_)=>const SignupView(),
    // AppRoutesName.forgotPasswordScreen:(_)=>const ForgotPasswordScreen(),
    // AppRoutesName.resetPassword:(_)=>const ResetPasswordScreen(),
    // AppRoutesName.createUserName:(_)=>const CreateUsernameScreen(),
    // AppRoutesName.selectProfilePhoto:(_)=>const SelectProfilePhotoScreen(),
    // AppRoutesName.SelectInterestView:(_)=>const SelectInterestViewScreen(),
    // AppRoutesName.homeScreen:(_)=> HomeScreen(),
    // AppRoutesName.searchScreen:(_)=> SearchScreen(),
    // AppRoutesName.mapViewScreen:(_)=> MapViewScreen(),
    // AppRoutesName.eventDetails:(_)=> EventDetailsScreen(),
    // AppRoutesName.mainScreen:(_)=> MainScreen(),
    // AppRoutesName.orderDetals:(_)=> OrderDetailsScreen(),
    // AppRoutesName.viewTicket:(_)=> ViewTicketScreen(),
    // AppRoutesName.allTickets:(_)=> AllTicketsScreen(),
    // AppRoutesName.cancelBooking:(_)=> CancelBookingScreen(),
    // AppRoutesName.otpVerification:(_)=>const OtpVerificationScreen(),











  };

}