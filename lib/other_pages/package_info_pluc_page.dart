import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoPlusPage extends StatefulWidget {
  const PackageInfoPlusPage({Key? key}) : super(key: key);

  @override
  State<PackageInfoPlusPage> createState() => _PackageInfoPlusPageState();
}

class _PackageInfoPlusPageState extends State<PackageInfoPlusPage> {
  String? appName;
  String? packageName;
  String? version;
  String? buildNumber;
  String? buildSignature;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          icon:const  Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),),
      body: Column(
        children: [
          setTile(appName ?? '', "AppName"),
          setTile(packageName ?? '', "PackageName"),
          setTile(version ?? '', "Version"),
          setTile(buildNumber ?? '', "BuildNumber"),
          setTile(buildSignature ?? '', "BuildSignature"),
          ElevatedButton(
              onPressed: () async {
                PackageInfo.fromPlatform().then((packageInfo) {
                  appName = packageInfo.appName;
                  packageName = packageInfo.packageName;
                  version = packageInfo.version;
                  buildNumber = packageInfo.buildNumber;
                  buildSignature = packageInfo.buildSignature;
                  setState(() {});
                });
              },
              child: const Text("Init Package Info"))
        ],
      ),
    );
  }

  ListTile setTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
