import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CreateCharacterPage extends StatelessWidget {
  const CreateCharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("1"),
      ),
      body: const Align(
        alignment: Alignment.center,
        child: Column(
            children: [
              // character name
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: '输入角色名称',
                      hintText: 'Type here',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              )
          // ElevatedButton(
          //   onPressed: () => {Navigator.pushNamed(context, '/startup page')},
          //   child: const Text("start"),
          // ),
        ]),
      ),
    );
  }
}
