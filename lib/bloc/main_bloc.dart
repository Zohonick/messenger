import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/entity/default_persons_data.dart';
import 'package:messenger/entity/persons_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final _key = 'personsData';
  PersonsData? data;

  MainBloc() : super(MainInitialState()) {
    on<MainInitialEvent>((event, emit) async {
      await loadData();
      emit(MainViewState(data));
    });
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key) ?? jsonEncode(defaultData);

    data = PersonsData.fromJson(jsonDecode(json));
  }
}
