package screens;

import entities.*;

class Game extends Screen {

    var dragon: Dragon;
    public var console: h2d.Console;

    override public function new(app: Main) {
        super(app);
        dragon = new Dragon(this);
    }

    override public function update(dt: Float) {
        if (hxd.Key.isPressed(hxd.Key.SPACE)) {
            dragon.flap();
        }
        dragon.update(dt);
    }
}