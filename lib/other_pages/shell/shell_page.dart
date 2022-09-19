import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shell/shell.dart';
import 'package:file/local.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({Key? key}) : super(key: key);

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  String _result = '';
  final fs = const LocalFileSystem();
  final shell = Shell();
  @override
  Widget build(BuildContext context) {
    const basePath = r"D:\ProgramData\InVanPos\cache\";
    // _readFile();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    Directory dir =
                        Directory(r"D:");
                    Dio dio = Dio();
                    if (dir.path != null)
                      print(
                          "==================  dir is null  =================");

                    try {
                      await dio.download(
                          "https://cashback.tiinco.uz/api/static/invanPosSetup_1_1_5_1_epos.exe",
                          "${dir.path}/MMMMMMMYYYYYYYYYYYYYYYYYYYYinvanPos.exe",
                          onReceiveProgress: (rec, total) {
                        print("Rec: $rec , Total: $total");
                      });
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  child: const Text("DIO DOWNLOAD FILE")),
              Text(_result),
              _setButton(
                'LS',
                command: 'ls',
                arguments: [],
              ),
              const SizedBox(height: 10),
              _setButton(
                'NODE',
                command: 'node',
                arguments: ['../../../Node/examples/memory.js'],
              ),
              const SizedBox(height: 10),
              _setButton(
                'DOWNLOAD',
                command: 'curl',
                arguments: [
                  "https://cashback.tiinco.uz/api/static/invanPosSetup_1_1_5_1_epos.exe",
                  "-O",
                  basePath
                ],
              ),
              const SizedBox(height: 10),
              _setButton('DART RUN', command: 'dart', arguments: [
                'run',
                '.\\shelltestmy\\bin\\shelltestmy.dart',
              ]),
              const SizedBox(height: 10),
              _setButton('DART',
                  command: 'dart', arguments: ["create", 'shelltestmy']),
              const SizedBox(height: 10),
              _setButton("PURCHASE",
                  command: 'C:/Arcus2/CommandLineTool/bin/CommandLineTool.exe',
                  arguments: ['/o1', '/a48000', '/c860']),
              const SizedBox(height: 10),
              _setButton("RUN INVAN POS",
                  command:
                      "D:/FLUTTER/pos-desktop-flutter/installers/invanPosSetup_1_1_5_2_epos.exe",
                  arguments: [])
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _setButton(
    String label, {
    required String command,
    required List<String> arguments,
  }) =>
      ElevatedButton(
        child: Text(label),
        onPressed: () async {
          ProcessResult result = await shell.run(
            command,
            arguments: arguments,
          );

          print(
              "=========    THE RESULT  =========>    ${result.stdout} / ${result.exitCode} / ${result.pid} / ${result.stderr} ");

          setState(() => _result = result.toString());
        },
      );
}
