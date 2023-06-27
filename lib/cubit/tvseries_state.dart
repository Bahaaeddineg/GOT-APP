part of 'tvseries_cubit.dart';

@immutable
abstract class TvseriesState {}

class TvseriesInitial extends TvseriesState {}

class LoadedData extends TvseriesState {
  late List characters;
  LoadedData(this.characters);
}

class LoadedQuotes extends TvseriesState {
  final Quote quote;
  LoadedQuotes(this.quote);
}
