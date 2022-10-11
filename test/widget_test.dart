// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/data/model/character_response.dart';

import 'package:rick_and_morty/ui/screens/character.dart';

void main() {
  testWidgets('Character test', (WidgetTester tester) async {
    String imageUrl = 'https://rickandmortyapi.com/api/character/avatar/1.jpeg';

    //Build character widget
    await tester.pumpWidget(CharacterItem(
      character: Character(name: 'Rick', image: imageUrl),
    ));

    //Test name
    expect(find.text('Rick'), findsOneWidget);
    //Test Image
    expect(find.image(CachedNetworkImageProvider(imageUrl)), findsOneWidget);
  });

}
