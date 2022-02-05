import 'package:get_it/get_it.dart';
import 'package:rideapp/services/auth.dart';
import 'package:rideapp/services/user.dart';

AuthService get authServ => GetIt.I<AuthService>();
UserService get userServ => GetIt.I<UserService>();
