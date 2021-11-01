part of 'app_pages.dart';

abstract class Routes{
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const SEARCH = _Paths.SEARCH;
  static const DETAIL = _Paths.DETAIL;
  static const SEARCHRESULTS = _Paths.SEARCHRESULTS;
  static const PROFILE = _Paths.PROFILE;
}

abstract class _Paths {
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const SEARCH = '/search';
  static const DETAIL = '/details';
  static const SEARCHRESULTS = '/searchresults';
  static const PROFILE = '/profile';
}