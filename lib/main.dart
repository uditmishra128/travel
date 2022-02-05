import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rideapp/provider/auth.dart';
import 'package:rideapp/provider/user.dart';
import 'package:rideapp/screens/onboard/splash.dart';
import 'package:rideapp/services/auth.dart';
import 'package:rideapp/services/user.dart';
import 'package:rideapp/utils/meta.dart';
import 'package:rideapp/utils/routes.dart';

GetIt locator = GetIt.I;

void setupSingleton() async {
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<UserService>(() => UserService());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark));
  setupSingleton();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
      ],
      child: MaterialApp(
          title: 'Ride-O',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
              headline1: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w600,
                  fontFamily: lato,
                  fontSize: 36),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: SplashScreen.routeName,
          routes: routes),
    );
  }
}
