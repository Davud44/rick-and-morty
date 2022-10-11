import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character/character_bloc.dart';
import 'package:rick_and_morty/bloc/character/character_event.dart';
import 'package:rick_and_morty/bloc/character/character_state.dart';
import 'package:rick_and_morty/data/model/character_response.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  CharacterBloc? characterBloc;

  @override
  void initState() {
    super.initState();
    characterBloc = BlocProvider.of(context);
    characterBloc!.add(GetCharacterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF38393E),
      body: SafeArea(
        child: BlocBuilder<CharacterBloc, CharacterState>(
            builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is CharacterLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Characters',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: state.character!.characters.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return CharacterItem(
                            character: state.character!.characters[index],
                          );
                        }),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Error occurred'));
          }
        }),
      ),
    );
  }
}

class CharacterItem extends StatelessWidget {
  const CharacterItem({Key? key, this.character}) : super(key: key);
  final Character? character;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('characterKey'),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(imageUrl: character!.image!)),
          const SizedBox(height: 5),
          Text(character!.name!, overflow: TextOverflow.ellipsis,textDirection: TextDirection.ltr,)
        ],
      ),
    );
  }
}
