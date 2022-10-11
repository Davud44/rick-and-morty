import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/data/model/character_response.dart';

abstract class CharacterState extends Equatable{

}

class CharacterInitial extends CharacterState{
  @override
  List<Object?> get props =>[];
}

class CharacterLoading extends CharacterState{
  @override
  List<Object?> get props =>[];
}

class CharacterLoaded extends CharacterState{
  final CharacterResponse? character;
  CharacterLoaded({this.character});
  @override
  List<Object?> get props =>[];
}

class CharacterError extends CharacterState{
  @override
  List<Object?> get props =>[];
}