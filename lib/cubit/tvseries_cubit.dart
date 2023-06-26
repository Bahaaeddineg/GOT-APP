import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/data/repository/repo.dart';

import '../data/models/models.dart';

part 'tvseries_state.dart';

class TvseriesCubit extends Cubit<TvseriesState> {
  final Repository repo;
  final QuoteRepo quoteRepo;
  TvseriesCubit(this.repo,this.quoteRepo) : super(TvseriesInitial());

  List getCharacters() {
    repo.getCharacters().then((characters) {
      emit(LoadedData(characters));
      return characters;
    });
    return [];
  }
  Quote getQuotes(String name) {
    quoteRepo.getQuotes(name).then((quote) {
      emit(LoadedQuotes(quote));
      return quote;
    });
    return Quote.fromJson({"quotes":[],"name":"name"});
  }

}
