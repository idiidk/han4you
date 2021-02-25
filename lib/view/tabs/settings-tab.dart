import 'package:flutter/material.dart';
import 'package:han4you/api/xedule/xedule-config.dart';
import 'package:han4you/providers/settings-provider.dart';
import 'package:han4you/providers/xedule-provider.dart';
import 'package:han4you/view/header.dart';
import 'package:han4you/view/lists/following-group-list.dart';
import 'package:han4you/view/pages/group-page.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    XeduleProvider xeduleProvider = context.watch<XeduleProvider>();

    return Column(
      children: [
        Header(title: 'Instellingen', subtitle: 'instellingen van de app'),
        SwitchListTile(
          value: context.watch<SettingsProvider>().themeMode == ThemeMode.dark,
          title: const Text('Donker thema'),
          onChanged: (value) {
            final themeMode = value ? ThemeMode.dark : ThemeMode.light;
            context.read<SettingsProvider>().setThemeMode(themeMode);
          },
          secondary: const Icon(Icons.color_lens_outlined),
        ),
        ListTile(
          title: Text('Beheer groepen'),
          leading: Icon(Icons.group),
          enabled: xeduleProvider.authenticated,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroupPage(),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Log uit'),
          leading: Icon(Icons.logout),
          enabled: xeduleProvider.authenticated,
          onTap: () {
            xeduleProvider.setConfig(XeduleConfigEmpty());
          },
        ),
        Divider(),
        Expanded(
          child: FollowingGroupList(),
        ),
      ],
    );
  }
}
