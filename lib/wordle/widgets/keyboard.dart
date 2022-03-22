import 'package:flutter/material.dart';

const _qwerty = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
];

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
    required this.onKeyTapped,
    required this.onDeleteTapped,
    required this.onEnterTapped,
  }) : super(key: key);
  final void Function(String) onKeyTapped;
  final VoidCallback onDeleteTapped;
  final VoidCallback onEnterTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _qwerty
          .map(
            (keyRow) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: keyRow.map(
                (letter) {
                  if (letter == 'DEL') {
                    return _KeyBoardButton.delete(onTap: onDeleteTapped);
                  } else if (letter == 'ENTER') {
                    return _KeyBoardButton.enter(onTap: onEnterTapped);
                  }
                  return _KeyBoardButton(
                    onTap: () => onKeyTapped(letter),
                    letter: letter,
                    backgroundColor: Colors.grey,
                  );
                },
              ).toList(),
            ),
          )
          .toList(),
    );
  }
}

class _KeyBoardButton extends StatelessWidget {
  const _KeyBoardButton({
    Key? key,
    this.height = 48,
    this.width = 30,
    required this.onTap,
    required this.letter,
    required this.backgroundColor,
  }) : super(key: key);
  final double height;
  final double width;
  final VoidCallback onTap;
  final String letter;
  final Color backgroundColor;

  factory _KeyBoardButton.delete({
    required VoidCallback onTap,
  }) =>
      _KeyBoardButton(
        width: 56,
        onTap: onTap,
        letter: 'DEL',
        backgroundColor: Colors.grey,
      );

  factory _KeyBoardButton.enter({
    required VoidCallback onTap,
  }) =>
      _KeyBoardButton(
        width: 56,
        onTap: onTap,
        letter: 'ENTER',
        backgroundColor: Colors.grey,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 2,
      ),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            child: Text(
              letter,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
