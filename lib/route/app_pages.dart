import 'package:get/get.dart';
import 'package:trailer/bindings/cart_binding.dart';
import 'package:trailer/bindings/dashboard_binding.dart';
import 'package:trailer/bindings/detail_binding.dart';
import 'package:trailer/bindings/favorites_binding.dart';
import 'package:trailer/bindings/login_binding.dart';
import 'package:trailer/bindings/home_binding.dart';
import 'package:trailer/bindings/search_binding.dart';
import 'package:trailer/bindings/search_results_binding.dart';
import 'package:trailer/bindings/trailist_binding.dart';
import 'package:trailer/views/cart.dart';
import 'package:trailer/views/dashboard.dart';
import 'package:trailer/views/details.dart';
import 'package:trailer/views/favorites.dart';
import 'package:trailer/views/googleMap.dart';
import 'package:trailer/views/home.dart';
import 'package:trailer/views/login.dart';
import 'package:trailer/views/profile.dart';
import 'package:trailer/views/search.dart';
import 'package:trailer/views/searchResults.dart';
import 'package:trailer/views/setTrailist.dart';
import 'package:trailer/views/trailist.dart';
part 'app_routes.dart';



class AppPages{
  AppPages._();

  static const INITIAL = _Paths.DASHBOARD;

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
          ),

          GetPage(
            name: _Paths.DETAIL,
            page: () => DetailView(),
            binding: DetailBinding(),
          ),

          GetPage(
            name: _Paths.SEARCHRESULTS,
            page: () => SearchResults(),
            binding: SearchResultsBinding(), 
          ),

          GetPage(
            name: _Paths.PROFILE,
            page: ()=> ProfileView(),
            binding: HomeBinding(),
          ),

          GetPage(
            name: _Paths.FAVORITES,
            page: ()=>Favorites(),
            binding: FavoritesBinding(),
          ),
          GetPage(
            name: _Paths.DASHBOARD,
            page: () => DashboardPage(),
            binding: DashboardBinding(),
          ),
          GetPage(
            name: _Paths.TRAILIST,
            page: () => TrailistView(),
            binding: TrailistBinding(),
          ),
          GetPage(
            name: _Paths.SETTRAILIST,
            page: () => SetTrailist(),
            binding: TrailistBinding(), //trailist binding 같이사용!?
          ),
          GetPage(
            name: _Paths.CART,
            page: () => CartView(),
            binding: CartBinding(),
          ), 
          GetPage(
            name: _Paths.GOOGLEMAP,
            page: () => GoogleMap(),
            binding: TrailistBinding(),
          )

  ];

}