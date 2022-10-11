import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/character/character_event.dart';
import 'package:rick_and_morty/bloc/character/character_state.dart';
import 'package:rick_and_morty/data/model/character_response.dart';
import 'package:rick_and_morty/data/repository/character_repository.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterRepository? characterRepository;

  CharacterBloc(CharacterState initialState) : super(initialState) {
    on<GetCharacterEvent>((event, emit) async {
      characterRepository = CharacterRepository();
      emit(CharacterLoading());
      try{
        CharacterResponse characterResponse =
        await characterRepository!.getCharacters();
        emit(CharacterLoaded(character: characterResponse));
      }catch (e){
        emit(CharacterError());
      }
    });
  }
}
