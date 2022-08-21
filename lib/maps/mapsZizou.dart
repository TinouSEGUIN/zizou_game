import 'package:bonfire/tiled/tiled_world_map.dart';
import 'package:bonfire/widgets/bonfire_tiled_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MapsZizou extends StatelessWidget {
  const MapsZizou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(map: TiledWorldMap('maps/testMap2.json'));
  }
}