import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zizou_game/maps/mapszizou.dart';
import 'package:zizou_game/providers/book_provider.dart';
import 'package:zizou_game/providers/items_provider.dart';
import 'package:zizou_game/screens/main_title_screen.dart';
import './maps/map1.dart';
import './player/sprite_sheet_hero.dart';

double tileSize = 32.0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpriteSheetHero.load();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
  runApp(MyApp());
}

enum ShowInEnum {
  left,
  right,
  top,
  bottom,
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookProvider>(
          create: (_) => BookProvider(),
        ),
        ChangeNotifierProvider<ItemProvider>(
          create: (_) => ItemProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ZizouGame',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LayoutBuilder(builder: (context, constraints) {
          tileSize = max(constraints.maxHeight, constraints.maxWidth) / 30;
          print(tileSize);
          // return MapsZizou();
          return TitleScreen();
        }),
      ),
    );
  }
}
