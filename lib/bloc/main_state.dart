part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitialState extends MainState {}

class MainInitialLoadingState extends MainState {}

class MainViewState extends MainState {
  MainViewState(this.data);

  final PersonsData? data;
}