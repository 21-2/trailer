import 'package:get/get.dart';
import 'package:trailer/bindings/login_binding.dart';
import 'package:trailer/bindings/home_binding.dart';
import 'package:trailer/bindings/search_binding.dart';
import 'package:trailer/views/home.dart';
import 'package:trailer/views/login.dart';
import 'package:trailer/views/search.dart';
part 'app_routes.dart';



class AppPages{
  AppPages._();

  static const INITIAL = _Paths.HOME;

  static final routes = [
          GetPage(
            name: _Paths.LOGIN,
            page: () => LogIn(),
            binding: LoginBinding(),
          ),

          GetPage(
            name: _Paths.HOME,
            page: () => HomeView(),
            binding: HomeBinding()
            ),
          
          GetPage(
            name: _Paths.SEARCH, 
            page: () => SearchView(),
            binding: SearchBinding(),
          )

  ];

}