import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/data/repository/repo.dart';

import '../data/models/models.dart';

part 'tvseries_state.dart';

class TvseriesCubit extends Cubit<TvseriesState> {
  final Repository repo;
  TvseriesCubit(this.repo) : super(TvseriesInitial());
  
  List<MyCharacters> getCharacters() {
    repo.getCharacters().then((characters) {
      emit(LoadedData(characters));
      return characters;
    });
   return [];
  }
  void getQuotes(String name) {
    repo.getQuotes(name).then((quote) {
      emit(LoadedQuotes(quote));
    });

  }

}
