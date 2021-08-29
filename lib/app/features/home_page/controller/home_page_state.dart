part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageSucesso extends HomePageState {
  HomePageSucesso({required this.listName});
  final List<NameModel> listName;
}

class HomePageError extends HomePageState {}
