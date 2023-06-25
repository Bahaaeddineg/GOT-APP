import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/data/repository/repo.dart';

part 'tvseries_state.dart';

class TvseriesCubit extends Cubit<TvseriesState> {
  final Repository repo;
  
  TvseriesCubit(this.repo) : super(TvseriesInitial());

  List getCharacters() {
    repo.getCharacters().then((characters) {
      emit(LoadedData(characters));
      return characters;
    });
    return [];
  }
}
