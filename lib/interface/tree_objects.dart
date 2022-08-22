import 'package:bonfire/bonfire.dart';


class MyEnemy extends GameDecoration  {
  MyEnemy(Vector2 position)
      : super(
size: Vector2(128, 256),
position: position,
        ) {
    /// here we configure collision of the enemy
    // setupCollision(
    //   CollisionConfig(
    //     collisions: [
    //       CollisionArea.rectangle(size: Vector2.all(32)),
    //     ],
    //   ),
    // );
  }

  @override
  void update(double dt) {
    // seeAndMoveToPlayer(
    //   closePlayer: (player) {
    //     /// do anything when close to player
    //   },
    //   radiusVision: 64,
    // );
    super.update(dt);
  }
}