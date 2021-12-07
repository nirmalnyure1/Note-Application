import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Screen/HOMEPAGESCREEN/homepage_screen.dart';
import 'package:note_app/State/homepage_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomePageState())],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: const HomePageScreen(),
      ),
    );
  }
}
