part of 'app_pages.dart';

abstract class Routes{
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const SEARCH = _Paths.SEARCH;
  static const DETAIL = _Paths.DETAIL;
  static const SEARCHRESULTS = _Paths.SEARCHRESULTS;
  static const PROFILE = _Paths.PROFILE;
  static const FAVORITES = _Paths.FAVORITES;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const TRAILIST = _Paths.TRAILIST;
  static const SETTRAILIST = _Paths.SETTRAILIST;
  static const CART = _Paths.CART;
  static const GOOGLEMAP = _Paths.GOOGLEMAP;
  static const CART2 = _Paths.CART2;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const SEARCH = '/search';
  static const DETAIL = '/details';
  static const SEARCHRESULTS = '/searchresults';
  static const PROFILE = '/profile';
  static const FAVORITES = '/favorites';
  static const DASHBOARD = '/dashboard';
  static const TRAILIST = '/trailist';
  static const SETTRAILIST = '/setTrailist';
  static const CART = '/cart';
  static const GOOGLEMAP = '/googlemap';
  static const CART2 = '/cart2';
}