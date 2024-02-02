import 'package:flutter/material.dart';
import 'package:quon_sekai_idle/constants/colors.dart';
import 'package:quon_sekai_idle/utils/startup_button_util.dart';
import 'package:quon_sekai_idle/widgets/startup_page_widget.dart';
import '../constants/app_constants.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Title
                const Text(
                  appTitle,
                  style: TextStyle(
                    fontSize: 40,
                    color: startupPageTextLightPinkColor,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Icon
                const Image(
                  image: AssetImage('lib/asserts/images/magic_box.png'),
                  height: startupPageIconHeight,
                ),

                const SizedBox(
                  height: 30,
                ),

                // ...

                // Button
                Flex(
                  direction: Axis.horizontal,
                  children: _buttonList(context),
                ),
              ],
            )),
      ),
    );
  }

  List<Widget> _buttonList(BuildContext context) {
    List<Widget> list = [];
    var configs = startupButtonConfigList(context);
    var sizedBoxNum = configs.length - 1;

    for (var config in configs) {
      list.add(
        Expanded(
          flex: config.flex,
          child: StartupStartElevatedButton(
            onPressed: config.onPressed,
            child: Text(config.label),
          ),
        ),
      );

      if (sizedBoxNum > 0) {
        sizedBoxNum--;
        list.add(const Expanded(flex: 1, child: SizedBox()));
      }
    }
    return list;
  }
}
