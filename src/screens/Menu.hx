package screens;

import entities.*;

class Menu extends Screen {

    var background: Background;
    var logo: h2d.Bitmap;
    // var dragon: Dragon;
    var button: h2d.Bitmap;
    var buttonInteractive: h2d.Interactive;

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

        button = new h2d.Bitmap(hxd.Res.loader.load('play.png').toTile(), this);
        button.scale(0.5);
        button.tile.dx = -button.tile.width/2;
        button.tile.dy = -button.tile.height/2;
        button.x = hxd.Window.getInstance().width/2;
        button.y = hxd.Window.getInstance().height/1.5;

        
        buttonInteractive = new h2d.Interactive(button.tile.width, button.tile.height, button);
        buttonInteractive.x = button.tile.x - button.tile.width/2;
        buttonInteractive.y = button.tile.y - button.tile.height/2;
        buttonInteractive.onClick = function(event: hxd.Event) {
            setScreen(new Game(app));
        }

    }

    override public function update(dt: Float) {
        background.update(dt, gameSpeed);
    }
}