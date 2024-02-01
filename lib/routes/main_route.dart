import 'package:flutter/cupertino.dart';

import '../pages/create_character_page.dart';
import '../pages/startup_page.dart';

final Map<String, WidgetBuilder> mainRoute = {
  '/startup page': (context) => StartupPage(),
  '/create character page': (context) => const CreateCharacterPage(),
};
