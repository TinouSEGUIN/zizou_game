import 'package:bonfire/bonfire.dart';


class MyEnemy extends GameComponent with ObjectCollision {
  MyEnemy(Vector2 position)
      : super(
          // animation: EnemySpriteSheet.simpleDirectionAnimation,
          // animation: ,
           checkCollision(component) 
          // life: 100,
        ) {
    /// here we configure collision of the enemy
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(size: Vector2.all(32)),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    seeAndMoveToPlayer(
      closePlayer: (player) {
        /// do anything when close to player
      },
      radiusVision: 64,
    );
    super.update(dt);
  }
}