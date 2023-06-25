import 'package:flutter/material.dart';
import 'package:tvseries/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/cubit/tvseries_cubit.dart';

import '../widgets/charactersWidget.dart';

class CharactersScreen extends StatefulWidget {
  late List characters;
  final controller = TextEditingController();
  bool isSearching = false;
  late List seachingList = characters;
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TvseriesCubit>(context).getCharacters();
  }

  Widget appBar() {
    return const Text(
      "Rick and Morty",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget searchTextField() {
    return TextField(
      controller: widget.controller,
      onChanged: (typedText) => addSearchedFOrItemsToSearchedList(typedText),
      style: TextStyle(color: MyColors.white),
      decoration: InputDecoration(
          hintText: "type the name of any character",
          hintStyle: TextStyle(color: MyColors.white)),
    );
  }

  List<Widget> appBarIcon() {
    if (widget.isSearching) {
      return [
        IconButton(
            onPressed: () => startSearching(), icon: const Icon(Icons.delete))
      ];
    } else {
      return [
        IconButton(
            onPressed: () => stopSearching(), icon: const Icon(Icons.search))
      ];
    }
  }

  void stopSearching() {
    clearInput();
    setState(() {
      widget.isSearching = false;
    });
  }

  void startSearching() {
    setState(() {
      widget.isSearching = true;
    });
  }
  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    widget.seachingList = widget.characters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  void clearInput() {
    setState(() {
      widget.controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchTextField(),
        actions: appBarIcon(),
      ),
      body:
          BlocBuilder<TvseriesCubit, TvseriesState>(builder: (context, state) {
        if (state is LoadedData) {
          widget.characters = state.characters;
          return CharactersWidget(widget.seachingList, context);
        } else {
          return const Text("loading");
        }
      }),
    );
  }
}
