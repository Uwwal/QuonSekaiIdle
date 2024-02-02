import 'package:flutter/cupertino.dart';

import '../pages/create_character_page.dart';
import '../pages/game_page.dart';
import '../pages/startup_page.dart';

final Map<String, WidgetBuilder> mainRoute = {
  '/startup page': (context) => const StartupPage(),
  '/create character page': (context) => const CreateCharacterPage(),
  '/game page': (context) {
    return GamePage(playerName: ModalRoute.of(context)?.settings.arguments as String);
  },
};
