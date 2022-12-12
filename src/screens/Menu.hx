package screens;

import entities.*;

class Menu extends Screen {

    var background: Background;
    var logo: h2d.Bitmap;
    // var dragon: Dragon;
    var button: Button;

    var gameSpeed: Float = 200;

    override public function new(app: Main) {
        super(app);
        background = new Background(this);
        // dragon = new Dragon(this);

        logo = new h2d.Bitmap(hxd.Res.loader.load('logo.png').toTile(), this);
        logo.tile.dx = -logo.tile.width/2;
        logo.tile.dy = -logo.tile.height/2;
        logo.x = hxd.Window.getInstance().width/2;
        logo.y = hxd.Window.getInstance().height/2;

        button = new Button(this, hxd.Res.loader.load('play.png').toTile());
        button.buttonInteractive.onClick = function(event: hxd.Event) {
            setScreen(new Game(app));
        }
    }

    override public function update(dt: Float) {
        background.update(dt, gameSpeed);
    }
}