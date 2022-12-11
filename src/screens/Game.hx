package screens;

import entities.*;

class Game extends Screen {

    var dragon: Dragon;
    var obstacles: Obstacles;

    var gameSpeed: Float = 100;

    override public function new(app: Main) {
        super(app);
        obstacles = new Obstacles(this);
        dragon = new Dragon(this);
    }

    override public function update(dt: Float) {
        if (hxd.Key.isPressed(hxd.Key.SPACE)) {
            dragon.flap();
        }
        obstacles.update(dt, gameSpeed);
        dragon.update(dt);
    }
}