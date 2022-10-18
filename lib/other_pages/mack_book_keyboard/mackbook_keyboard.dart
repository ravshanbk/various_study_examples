import 'package:flutter/material.dart';

class MacbookColorScheme {
  final String name;
  final Color primary;
  final Color trackpadBorderColor;

  MacbookColorScheme({
    required this.name,
    required this.primary,
    required this.trackpadBorderColor,
  });
}

class Macbook extends StatelessWidget {
  final MacbookColorScheme colorScheme;

  const Macbook({Key? key, required this.colorScheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      alignment: Alignment.topCenter,
      width: 854,
      height: 580,
      padding: const EdgeInsets.only(
        left: 30,
        top: 30,
        right: 30,
      ),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 1,
            color: Colors.black.withOpacity(.2),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          MacbookKeyboard(backgroundColor: colorScheme.primary),
          Center(child: TrackPad(color: colorScheme.trackpadBorderColor)),
        ],
      ),
    );
  }
}

class MacbookKeyboard extends StatelessWidget {
  final Color backgroundColor;

  const MacbookKeyboard({
    Key? key,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const height = 48.0;
    const separator = 5.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 778,
      height: 310,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.3)),
           BoxShadow(
            color:backgroundColor,
            blurRadius: 3,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        children: [
          KeysRow(
            height: 30,
            separatorWidth: separator,
            keys: [
              const Expanded(
                child: SingleCharKey(
                  char: 'ESC',
                  alignment: Alignment.centerLeft,
                  width: 54,
                ),
              ),
              for (int i = 1; i <= 12; i++)
                Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    width: 54,
                    char: 'F$i',
                  ),
                ),
              MacbookKey(
                width: 30,
              ),
            ],
          ),
          const SizedBox(height: 3),
          const Expanded(
            child: KeysRow(
              height: height,
              separatorWidth: separator,
              keys: [
                Expanded(
                  child: MultiCharKey(
                    upperChar: '~',
                    lowerChar: '`',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '!',
                    lowerChar: '1',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '@',
                    lowerChar: '2',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '#',
                    lowerChar: '3',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '\$',
                    lowerChar: '4',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '%',
                    lowerChar: '5',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '^',
                    lowerChar: '6',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '&',
                    lowerChar: '7',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '*',
                    lowerChar: '8',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '(',
                    lowerChar: '9',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: ')',
                    lowerChar: '0',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '_',
                    lowerChar: '-',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '+',
                    lowerChar: '=',
                  ),
                ),
                SingleCharKey(
                  alignment: Alignment.bottomRight,
                  width: 75,
                  char: 'delete',
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Expanded(
            child: KeysRow(
              height: height,
              separatorWidth: separator,
              keys: [
                const SingleCharKey(
                  alignment: Alignment.bottomLeft,
                  width: 75,
                  char: 'tab',
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'Q',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'W',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'E',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'R',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'T',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'Y',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'U',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'I',
                  ),
                ),
                Expanded(
                  child: SingleCharKey(
                    onPressed: () {},
                    alignment: Alignment.center,
                    char: 'O',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'P',
                  ),
                ),
               const  Expanded(
                  child: MultiCharKey(
                    upperChar: '{',
                    lowerChar: '[',
                  ),
                ),
                const Expanded(
                  child: MultiCharKey(
                    upperChar: '}',
                    lowerChar: ']',
                  ),
                ),
                const Expanded(
                  child: MultiCharKey(
                    upperChar: '|',
                    lowerChar: '\\',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Expanded(
            child: KeysRow(
              height: height,
              separatorWidth: separator,
              keys: [
                const SingleCharKey(
                  alignment: Alignment.bottomLeft,
                  width: 90,
                  char: 'caps lock',
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'A',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'S',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'D',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'F',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'G',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'H',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'J',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'K',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'L',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: ':',
                    lowerChar: ';',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '"',
                    lowerChar: '\'',
                  ),
                ),
                const SingleCharKey(
                  alignment: Alignment.bottomRight,
                  width: 90,
                  char: 'return',
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Expanded(
            child: KeysRow(
              height: height,
              separatorWidth: separator,
              keys: [
                const SingleCharKey(
                  alignment: Alignment.bottomLeft,
                  width: 115,
                  char: 'shift',
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'Z',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'X',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'C',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'V',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'B',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'N',
                  ),
                ),
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.center,
                    char: 'M',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '<',
                    lowerChar: ',',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '>',
                    lowerChar: '.',
                  ),
                ),
                Expanded(
                  child: MultiCharKey(
                    upperChar: '?',
                    lowerChar: '/',
                  ),
                ),
                const SingleCharKey(
                  alignment: Alignment.bottomRight,
                  width: 115,
                  char: 'shift',
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Expanded(
            child: KeysRow(
              height: height,
              separatorWidth: separator,
              keys: [
                const Expanded(
                  child: SingleCharKey(
                    alignment: Alignment.bottomLeft,
                    char: 'fn',
                  ),
                ),
                const Expanded(
                  child: SpecialKey(
                    symbol: '^',
                    label: 'control',
                  ),
                ),
                const Expanded(
                  child: SpecialKey(
                    symbol: '⎇',
                    label: 'option',
                  ),
                ),
                const SpecialKey(
                  symbol: '⌘',
                  label: 'command',
                  width: 65,
                ),
                const SingleCharKey(
                  width: 261,
                  alignment: Alignment.center,
                  char: '',
                ),
                const SpecialKey(
                  symbol: '⌘',
                  label: 'command',
                  width: 65,
                ),
                const Expanded(
                  child: SpecialKey(
                    symbol: '⎇',
                    label: 'option',
                  ),
                ),
                Expanded(
                  child: MacbookKey(
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: MacbookKey(
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Expanded(
                        child: MacbookKey(
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: MacbookKey(
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KeysRow extends StatelessWidget {
  final double height;
  final List<Widget> keys;
  final double separatorWidth;

  const KeysRow({
    Key? key,
    required this.height,
    required this.keys,
    required this.separatorWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          for (int i = 0; i < keys.length; i++) ...[
            if (i != 0) SizedBox(width: separatorWidth),
            keys[i],
          ]
        ],
      ),
    );
  }
}

class SingleCharKey extends StatelessWidget {
  final Alignment? alignment;
  final double? width;
  final double? height;
  final String? char;
  final VoidCallback? onPressed;

  const SingleCharKey({
    Key? key,
    this.alignment,
    this.width,
    this.height,
    this.char,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacbookKey(
      alignment: alignment,
      width: width,
      height: height,
      onPressed: onPressed,
      child: Text(
        char ?? "",
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MultiCharKey extends StatelessWidget {
  final String? upperChar;
  final String? lowerChar;
  final Alignment? alignment;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const MultiCharKey({
    Key? key,
    this.upperChar,
    this.lowerChar,
    this.alignment,
    this.width,
    this.height,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacbookKey(
      width: width,
      height: height,
      onPressed: onPressed,
      child: Center(
        child: Column(
          children: [
            Text(
              upperChar ?? "",
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 5),
            Text(
              lowerChar ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpecialKey extends StatelessWidget {
  final Alignment? alignment;
  final String? symbol;
  final String? label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;

  const SpecialKey({
    Key? key,
    this.alignment,
    this.label,
    this.symbol,
    this.height,
    this.width,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacbookKey(
      alignment: alignment,
      onPressed: onPressed,
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(symbol ?? "null"),
          const Spacer(),
          Text(
            label ?? "null",
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MacbookKey extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final Alignment? alignment;
  final VoidCallback? onPressed;

  MacbookKey({
    Key? key,
    this.width,
    this.height,
    this.child,
    this.alignment,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(color: Colors.white),
        child: Container(
          alignment: alignment,
          width: width,
          height: height,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF23272D),
                Color(0xFF1C1B1E),
              ],
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: child,
        ),
      ),
    );
  }
}

class TrackPad extends StatelessWidget {
  final Color color;

  const TrackPad({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 220,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
