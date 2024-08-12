import 'package:get/get.dart';
import 'package:serfast0_1/core/constant/route_names.dart';
import 'package:serfast0_1/core/middleware/mymiddleware.dart';
// import 'package:serfast0_1/test.dart';
import 'package:serfast0_1/view/screen/auth/LoginWithemail.dart';
import 'package:serfast0_1/view/screen/auth/LoginWithnumber.dart';
import 'package:serfast0_1/view/screen/auth/Signup.dart';
import 'package:serfast0_1/view/screen/auth/emailverfiycode.dart';
import 'package:serfast0_1/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:serfast0_1/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:serfast0_1/view/screen/auth/forgetpassword/successreserpassword.dart';
import 'package:serfast0_1/view/screen/auth/onbording.dart';
import 'package:serfast0_1/view/screen/auth/successsignup.dart';
import 'package:serfast0_1/view/screen/auth/forgetpassword/passwordverfiycode.dart';
import 'package:serfast0_1/view/screen/bottomnavbarscreens/home.dart';
import 'package:serfast0_1/view/screen/bottomnavbarscreens/requests.dart';
import 'package:serfast0_1/view/screen/bottomnavbarscreens/support_screen.dart';
import 'package:serfast0_1/view/screen/category_servic_screen.dart';
import 'package:serfast0_1/view/screen/drawerscreens/aboutus.dart';
import 'package:serfast0_1/view/screen/drawerscreens/balance.dart';
import 'package:serfast0_1/view/screen/drawerscreens/profile.dart';
import 'package:serfast0_1/view/screen/drawerscreens/questions.dart';
import 'package:serfast0_1/view/screen/drawerscreens/setting.dart';
import 'package:serfast0_1/view/screen/drawerscreens/signup_adproviderparttwo.dart';
import 'package:serfast0_1/view/screen/drawerscreens/signup_asprovider.dart';
import 'package:serfast0_1/view/screen/profile/contactinfo.dart';
import 'package:serfast0_1/view/screen/profile/editprofil/editemail.dart';
import 'package:serfast0_1/view/screen/profile/editprofil/editphonenumber.dart';
import 'package:serfast0_1/view/screen/profile/editprofil/editusername.dart';
import 'package:serfast0_1/view/screen/profile/location/addlocation.dart';
import 'package:serfast0_1/view/screen/profile/location/addlocationparttwo.dart';
import 'package:serfast0_1/view/screen/profile/location/viewlocation.dart';
import 'package:serfast0_1/view/screen/profile/pesrsonalinfo.dart';
import 'package:serfast0_1/view/screen/profile/location/mylocations.dart';
import 'package:serfast0_1/view/screen/profile/change_my_services.dart';
import 'package:serfast0_1/view/screen/profile/editprofil/changepassword.dart';
import 'package:serfast0_1/view/screen/profile/editprofile.dart';
import 'package:serfast0_1/view/screen/providerinfo/providerinfo.dart';
import 'package:serfast0_1/view/screen/temp/order_screen.dart';
import 'package:serfast0_1/view/screen/temp/showallproviders.dart';

List<GetPage<dynamic>>? routes = [
// ============================================Auth Screens=====================================

  GetPage(
      name: "/",
      page: () => const OnBoardingPage(),
      middlewares: [MyMiddleware()]),
  GetPage(name: AppRoute.loginWithNumber, page: () => const LoginWithnumber()),
  GetPage(name: AppRoute.loginWithEmail, page: () => const LoginWithemail()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.passwordverfiyCode,
      page: () => const PasswordVerfiyCode()),
  GetPage(name: AppRoute.successSignup, page: () => const SuccessSignup()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.emailVerfiyCode, page: () => const EmailVerfiyCode()),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoardingPage()),

//=============================================Bottom Nav Bar Screens============================

  GetPage(name: AppRoute.home, page: () => const Home()),
  GetPage(name: AppRoute.requests, page: () => const Requests()),
  GetPage(name: AppRoute.supportScreen, page: () => const SupportScreen()),

//=============================================Drawer Screens============================

  GetPage(name: AppRoute.balanceScreen, page: () => const BalanceScreen()),
  GetPage(name: AppRoute.settingScreen, page: () => const SettingScreen()),
  GetPage(
      name: AppRoute.signUpAsProvider, page: () => const SignUpAsProvider()),
  GetPage(
      name: AppRoute.signUpAsProviderParttwo,
      page: () => const SignUpAsProviderPartTwo()),
  GetPage(name: AppRoute.questionsScreen, page: () => const QuestionsScreen()),
  GetPage(name: AppRoute.aboutUsScreen, page: () => const AboutUsScreen()),
  GetPage(name: AppRoute.profileScreen, page: () => const ProfileScreen()),

//=============================================Profile Screens============================

  GetPage(name: AppRoute.myLocations, page: () => const MyLocations()),
  GetPage(
      name: AppRoute.editProfileScreen, page: () => const EditProfileScreen()),
  GetPage(
      name: AppRoute.changeMyServices, page: () => const ChangeMyServices()),
  GetPage(name: AppRoute.changePassword, page: () => const ChangePassword()),
  GetPage(name: AppRoute.personalInfo, page: () => const PersonalInfo()),
  GetPage(name: AppRoute.editUserName, page: () => const EditUserName()),
  GetPage(name: AppRoute.contactInfo, page: () => const ContactInfo()),
  GetPage(name: AppRoute.editUserEmail, page: () => const EditUserEmail()),
  GetPage(name: AppRoute.viewlocation, page: () => const ViewLocation()),
  GetPage(name: AppRoute.addlocation, page: () => const AddLocation()),
  GetPage(
      name: AppRoute.addlocationparttwo,
      page: () => const AddLocationPartTwo()),
  GetPage(
      name: AppRoute.editUserPhoneNumber,
      page: () => const EditUserPhoneNumber()),

//=============================================About Provider Screens======================================

  GetPage(name: AppRoute.providerInfo, page: () => const ProviderInfo()),

//=============================================Test Screens============================

  GetPage(
      name: AppRoute.showAllProviders, page: () => const ShowAllProviders()),
  GetPage(
      name: AppRoute.categoryServiceScreen,
      page: () => const CategoryServiceScreen()),
  GetPage(name: AppRoute.orderScreen, page: () => const OrderScreen()),
// GetPage(name: AppRoute.test,                  page: () => const TestView()),
];
