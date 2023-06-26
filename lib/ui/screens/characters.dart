import 'package:flutter/material.dart';
import 'package:tvseries/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/cubit/tvseries_cubit.dart';

import '../widgets/charactersWidget.dart';

class CharactersScreen extends StatefulWidget {
  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List characters;
  final controller = TextEditingController();
  bool isSearching = false;
  late List seachingList;
  FocusNode _textFieldFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TvseriesCubit>(context).getCharacters();
  }

  Widget appBar() {
    return const Text(
      "Game of Thrones",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget searchTextField() {
    return TextField(
      focusNode: _textFieldFocusNode,
      controller: controller,
      onChanged: (typedText) => filteringResult(typedText),
      style: TextStyle(color: MyColors.white),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Find a character",
          hintStyle: TextStyle(color: MyColors.white)),
    );
  }

  List<Widget> appBarIcon() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () => stopSearching(), icon: const Icon(Icons.close))
      ];
    } else {
      return [
        IconButton(
            onPressed: () => startSearching(), icon: const Icon(Icons.search))
      ];
    }
  }

  void stopSearching() {
    clearInput();
    setState(() {
      isSearching = false;
    });
  }

  void startSearching() {
    setState(() {
      isSearching = true;
    });
    _textFieldFocusNode.requestFocus();
  }

  filteringResult(String searchedCharacter) {
    seachingList = characters
        .where((character) =>
            character.fullName.toLowerCase().startsWith(searchedCharacter))
        .toList();

    setState(() {});
  }

  void clearInput() {
    setState(() {
      controller.clear();
    });
  }

  Widget backArrow() {
    return GestureDetector(
        onTap: () => stopSearching(), child: const Icon(Icons.arrow_back));
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: FocusScopeNode(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: isSearching ? searchTextField() : appBar(),
          leading: isSearching ? backArrow() : null,
          actions: appBarIcon(),
        ),
        body: BlocBuilder<TvseriesCubit, TvseriesState>(
          builder: (context, state) {
            if (state is LoadedData) {
              characters = state.characters;
              return CharactersWidget(
                  controller.text.isEmpty ? characters : seachingList, context);
            } else {
              return const Text("loading");
            }
          },
        ),
      ),
    );
  }
}
