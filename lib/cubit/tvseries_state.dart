part of 'tvseries_cubit.dart';

@immutable
abstract class TvseriesState {}

class TvseriesInitial extends TvseriesState {}

class LoadedData extends TvseriesState{
  final List character;
  LoadedData(this.character);
}
class LoadedQuotes extends TvseriesState{
  final Quote quote;
  LoadedQuotes(this.quote);
}
