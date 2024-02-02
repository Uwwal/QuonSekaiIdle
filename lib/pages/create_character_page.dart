import 'package:flutter/material.dart';
import 'package:quon_sekai_idle/constants/app_constants.dart';

import '../constants/colors.dart';

class CreateCharacterPage extends StatefulWidget {
  const CreateCharacterPage({super.key});

  @override
  State<CreateCharacterPage> createState() => _CreateCharacterPageState();
}

class _CreateCharacterPageState extends State<CreateCharacterPage> {
  final int _playerImageNameListLength = playerImageNameList.length;

  var _playerImageIndex = 0;
  var _playerCurImagePath = "";

  var _reenter = false;

  final _nameController = TextEditingController();

  String getPlayerCurImagePath() =>
      playerImageDirPath + playerImageNameList[_playerImageIndex];

  void _playerImageChangeButtonOnPressed(int counter) {
    setState(() {
      _playerImageIndex += counter + _playerImageNameListLength;
      _playerImageIndex %= _playerImageNameListLength;

      _playerCurImagePath = getPlayerCurImagePath();
    });
  }

  void _confirmButtonOnPressed() {
    var name = _nameController.text;
    if (name.isEmpty) {
      setState(() {
        _reenter = true;
      });

      Future.delayed(const Duration(milliseconds: characterPageShakingDuration),
          () {
        setState(() {
          _reenter = false;
        });
      });
    } else {
      Navigator.pushNamed(context, '/game page', arguments: name);
    }
  }

  @override
  void initState() {
    super.initState();

    _playerCurImagePath = getPlayerCurImagePath();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          characterPageAppBarText,
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(60, 30, 60, 40),
          child: Column(children: [
            // image selector
            Flex(
              direction: Axis.horizontal,
              children: [
                // left button
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () => _playerImageChangeButtonOnPressed(-1),
                    icon: const Icon(Icons.arrow_left),
                    color: createCharacterIconButtonColor,
                  ),
                ),
                // image
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: FadeInImage(
                      placeholder: const AssetImage(playerImagePlathHolderPath),
                      image: AssetImage(_playerCurImagePath),
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 1),
                    ),
                  ),
                ),
                // right button
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () => _playerImageChangeButtonOnPressed(1),
                    icon: const Icon(Icons.arrow_right),
                    color: createCharacterIconButtonColor,
                  ),
                ),
              ],
            ),

            // character name

            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: characterPageInputNameLabelText,
                hintText: 'Type here',
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: _reenter ? Colors.red : Colors.grey,
                )),

              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // confirm button
            IconButton(
              onPressed: _confirmButtonOnPressed,
              icon: const Icon(
                Icons.check,
                size: 50,
              ),
              color: createCharacterIconButtonColor,
            ),
          ]),
        ),
      ),
    );
  }
}
