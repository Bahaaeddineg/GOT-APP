import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:tvseries/constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tvseries/cubit/tvseries_cubit.dart';

import '../widgets/charactersWidget.dart';

class CharactersScreen extends StatefulWidget {
  late bool connected;
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
      cursorColor: MyColors.white,
      focusNode: _textFieldFocusNode,
      controller: controller,
      onChanged: (typedText) => filteringResult(typedText),
      style: TextStyle(color: MyColors.white),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Find a character",
          hintStyle: TextStyle(color: MyColors.grey)),
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
            onPressed: () => widget.connected? startSearching():null, icon: const Icon(Icons.search))
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

  Widget buildBlocWidget() {
    return BlocBuilder<TvseriesCubit, TvseriesState>(
      builder: (context, state) {
        if (state is LoadedData) {
          characters = state.characters;
          return CharactersWidget(
              controller.text.isEmpty ? characters : seachingList, context);
        } else {
          return const Text("loading");
        }
      },
    );
  }

  Widget buildNoNetWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No intenet connection ! The data will be automatically loaded when you connect to internet ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: MyColors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Image.asset('assets/images/no_internet.webp'),
      ],
    );
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
        body: OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            widget.connected = connectivity != ConnectivityResult.none;
            if (widget.connected) {
              return buildBlocWidget();
            } else {
              return buildNoNetWidget();
            }
          },
          child: const CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
