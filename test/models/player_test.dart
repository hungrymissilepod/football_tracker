import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/models/player.dart';
import 'dart:convert' show json;

import '../mocks_and_stubs/stubs.dart';

void main() {

  group('Player: ', () {

    test('Parse correct Player json', () {
      final Player player = Player.fromMap(json.decode(playerStub));
      expect(player.name, 'Bob');
      expect(player.position, 'Goalkeeper');
    });

    test('Testing props of Player object', () {
      const Player player = Player(
        name: 'Bob',
        position: 'Defender'
      );
      expect(player.props, <Object?>[player.name, player.position]);
    });
  });
}