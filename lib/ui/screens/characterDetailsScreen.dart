import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/constants/colors.dart';
import 'package:tvseries/data/models/models.dart';

import 'package:tvseries/cubit/tvseries_cubit.dart';
import '../../cubit/tvseries_cubit.dart';

class CharacterDetails extends StatelessWidget {
  final MyCharacters character;
  CharacterDetails({required this.character});

  Widget sliverAppBar() {
    return SliverAppBar(
      stretch: true,
      floating: true,
      pinned: true,
      backgroundColor: MyColors.blue,
      elevation: 0,
      expandedHeight: 320,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.fullName,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget text(String title, String corrText) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          TextSpan(
            text: corrText,
            style:
                const TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis),
          )
        ],
      ),
    );
  }

  Widget divider(double endIndet) {
    return Divider(
      color: MyColors.yellow,
      thickness: 2,
      endIndent: endIndet,
    );
  }

  Widget quoteText(state, String quote, String name) {
    return Center(
      child: Text(
        '"$quote"\n                            -$name-',
        style: TextStyle(
            color: MyColors.yellow,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     BlocProvider.of<TvseriesCubit>(context).getQuotes(character.fullName);
    return Scaffold(
      backgroundColor: MyColors.blue,
      body: CustomScrollView(
        slivers: [
          sliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 40, 15, 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text("Full name: ", character.fullName),
                      divider(245),
                      text("Title: ", character.title),
                      divider(286),
                      text("Family: ", character.family),
                      divider(270),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<TvseriesCubit, TvseriesState>(
                          builder: (context, state) {
                        if (state is LoadedQuotes) {
                          int index =
                              Random().nextInt(state.quote.quote.length - 1);
                          return quoteText(state, state.quote.quote[index],
                              character.fullName);
                        } else {
                          return const Text("loadingggg");
                        }
                      })
                    ],
                  ),
                ),
                const SizedBox(
                  height: 510,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
