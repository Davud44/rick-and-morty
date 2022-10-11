import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {}

class GetCharacterEvent extends CharacterEvent {
  GetCharacterEvent();

  @override
  List<Object?> get props => [];
}
