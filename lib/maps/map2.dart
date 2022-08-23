import 'package:bonfire/bonfire.dart';
import 'package:bonfire/tiled/tiled_world_map.dart';
import 'package:bonfire/widgets/bonfire_tiled_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zizou_game/interface/tree_objects.dart';
import 'package:zizou_game/main.dart';
import 'package:flutter/material.dart';
import 'package:zizou_game/util/exit_map_sensor.dart';

import '../interface/maps_interface.dart';
import '../player/game_player.dart';
import '../player/sprite_sheet_hero.dart';
import '../util/extensions.dart';
import 'mapsZizou.dart';

class MapsZizou2 extends StatelessWidget {
  final ShowInEnum showInEnum;
  double tileSize;
  MapsZizou2(double this.tileSize, {Key? key, this.showInEnum = ShowInEnum.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      // showCollisionArea: true,
      // collisionAreaColor: Colors.pink,
      // constructionMode: true,
      // initialActiveOverlays: ['interface'],
      // overlayBuilderMap: {
      //   'interface': (context, game) => MapInterface(),
      // },
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(),
        directional: JoystickDirectional(),
        actions: [
          // JoystickAction(
          //   actionId: 'book',
          //   sprite: Sprite.load('notebook.png'),
          // )
        ],
      ),
      player: GamePlayer(
        _getInitPosition(),
        SpriteSheetHero.hero1,
        initDirection: _getDirection(),
      ),
      cameraConfig: CameraConfig(
        smoothCameraEnabled: true,
        smoothCameraSpeed: 2,
      ),
      map: TiledWorldMap(
        'maps/map_jungle.json',
        forceTileSize: Size(tileSize, tileSize),
        // objectsBuilder: {
        //   'tree1': (properties) {
        //     print(
        //         'tree1  pos : ${properties.position} size : ${properties.size}');
        //     return GameDecoration.withSprite(
        //         position: properties.position,
        //         size: properties.size,
        //         sprite: Sprite.load('maps/texture_tree1.png'));
        //   }
        // }
      )..registerObject('sensourOut', (properties) {
        print({properties.position.toString()});
          return ExitMapSensor(
            'sensorOut',
            properties.position,
            properties.size,
            (value) {
              context.goTo(MapsZizou(tileSize));
            },
          );
        }),
    );
  }

  Vector2 _getInitPosition() {
    switch (showInEnum) {
      case ShowInEnum.left:
        return Vector2(tileSize*10,tileSize*40);
        break;
      case ShowInEnum.right:
        return Vector2(tileSize * 27, tileSize * 12);
        break;
      case ShowInEnum.top:
        return Vector2.zero();
        break;
      case ShowInEnum.bottom:
        return Vector2.zero();
        break;
      default:
        return Vector2.zero();
    }
  }

  // void _exitMap(String value, BuildContext context) {
  //   if (value == 'sensorRight') {
  //     context.goTo(Map2(
  //       showInEnum: ShowInEnum.left,
  //     ));
  //   }
  // }

  Direction _getDirection() {
    switch (showInEnum) {
      case ShowInEnum.left:
        return Direction.right;
        break;
      case ShowInEnum.right:
        return Direction.left;
        break;
      case ShowInEnum.top:
        return Direction.right;
        break;
      case ShowInEnum.bottom:
        return Direction.right;
        break;
      default:
        return Direction.right;
    }
  }

  //   void _exitMap(String value, BuildContext context) {
  //   if (value == 'sensorLeft') {
  //     context.goTo(Map1(
  //       showInEnum: ShowInEnum.right,
  //     ));
  //   }
  // }
}
