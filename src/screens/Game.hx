package screens;

import entities.*;

class Game extends Screen {

    var background: Background;
    var obstacles: Obstacles;
    var dragon: Dragon;

    var gameSpeed: Float = 100;

    override public function new(app: Main) {
        super(app);
        background = new Background(this);
        obstacles = new Obstacles(this);
        dragon = new Dragon(this);
    }

    override public function update(dt: Float) {
        background.update(dt, gameSpeed);
        if (hxd.Key.isPressed(hxd.Key.SPACE)) {
            dragon.flap();
        }
        obstacles.update(dt, gameSpeed);
        dragon.update(dt);
    }
}