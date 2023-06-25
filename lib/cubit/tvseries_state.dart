part of 'tvseries_cubit.dart';

@immutable
abstract class TvseriesState {}

class TvseriesInitial extends TvseriesState {}

class LoadedData extends TvseriesState{
  final List characters;
  LoadedData(this.characters);
}
