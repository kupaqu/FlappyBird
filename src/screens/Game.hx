package screens;

import entities.*;

class Game extends Screen {

    var dragon: Dragon;
    var obstacle: Obstacle;

    var gameSpeed: Float = 150;

    override public function new(app: Main) {
        super(app);
        obstacle = new Obstacle(this);
        dragon = new Dragon(this);
    }

    override public function update(dt: Float) {
        if (hxd.Key.isPressed(hxd.Key.SPACE)) {
            dragon.flap();
        }
        obstacle.update(dt, gameSpeed);
        dragon.update(dt);
    }
}