import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character/character_bloc.dart';
import 'package:rick_and_morty/bloc/character/character_state.dart';
import 'package:rick_and_morty/ui/screens/character.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<CharacterBloc>(
          create: (context) => CharacterBloc(CharacterInitial()),
        )
      ], child: const CharacterScreen()),
    );
  }
}
