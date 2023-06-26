import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/data/models/models.dart';
import 'package:tvseries/data/repository/repo.dart';
import 'package:tvseries/ui/screens/characters.dart';

import 'cubit/tvseries_cubit.dart';
import 'data/api/api.dart';
import 'ui/screens/characterDetailsScreen.dart';

class MyRoutes {
  late Repository repo;
  late QuoteRepo quoterepo;
  late TvseriesCubit cubit;
  MyRoutes() {
    repo = Repository(Api());
    quoterepo=QuoteRepo(Api2());
    cubit = TvseriesCubit(repo,quoterepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(create: (_) => cubit, child: CharactersScreen()));
      case '/details':
        var character = settings.arguments as MyCharacters;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => cubit,
                child: CharacterDetails(character: character)));
    }
  }
}
