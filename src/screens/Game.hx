package screens;

import entities.*;

class Game extends Screen {

    var dragon: Dragon;

    override public function new(app: Main) {
        super(app);
        dragon = new Dragon(this);
    }

    override public function update(dt: Float) {
    }
}