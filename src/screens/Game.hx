package screens;

import entities.*;

class Game extends Screen {

    var background: Background;
    var obstacles: Obstacles;
    var dragon: Dragon;
    var score: Score;

    var gameSpeed: Float = 200;

    override public function new(app: Main) {
        super(app);
        background = new Background(this);
        obstacles = new Obstacles(this);
        dragon = new Dragon(this);
        score = new Score(this);
    }

    override public function update(dt: Float) {
        background.update(dt, gameSpeed);
        if (hxd.Key.isPressed(hxd.Key.SPACE)) {
            dragon.flap();
        }
        dragon.update(dt);
        obstacles.update(dt, gameSpeed, dragon, score);
    }
}