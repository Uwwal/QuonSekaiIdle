import 'dart:io';

import 'package:flutter/cupertino.dart';

class StartupButtonConfig {
  final String label;
  final VoidCallback onPressed;
  final int flex;

  StartupButtonConfig(this.label, this.onPressed, {this.flex = 2});
}

List<StartupButtonConfig> startupButtonConfigList(params) {
  return[
    StartupButtonConfig("start", () => startButtonPressed(params)),
    StartupButtonConfig("load", () => loadButtonPressed()),
    StartupButtonConfig("options", () => optionsButtonPressed()),
    StartupButtonConfig("exit", () => exitButtonPressed()),
  ];
}

void startButtonPressed(context) {
  Navigator.pushNamed(context, '/create character page');
}

void loadButtonPressed() {}

void optionsButtonPressed() {}

void exitButtonPressed() {
  exit(0);
}