part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageSucesso extends HomePageState {
  HomePageSucesso({
    required this.listName,
    required this.selectedNames,
  });
  final List<NameModel> listName;
  final List<NameModel> selectedNames;
}

class HomePageError extends HomePageState {}
