package screens;

import entities.*;

class Game extends Screen {
    var mode: Int = 0;

    var background: Background;
    var obstacles: Obstacles;
    var dragon: Dragon;
    var score: Score;

    var tap: h2d.Bitmap;

    var gameSpeed: Float = 200;

    override public function new(app: Main) {
        super(app);
        hxd.Res.sounds.swoosh.play(false, 0.2);
        background = new Background(this);
        obstacles = new Obstacles(this);
        dragon = new Dragon(this);
        score = new Score(this);

        tap = new h2d.Bitmap(hxd.Res.loader.load('tap.png').toTile(), this);
        tap.alpha = 0.5;
        tap.scale(0.5);
        tap.tile.dx = -tap.tile.width/2;
        tap.tile.dy = -tap.tile.height/2;
        tap.x = hxd.Window.getInstance().width/2;
        tap.y = hxd.Window.getInstance().height/1.5;
    }

    override public function update(dt: Float) {
        if (mode == 0 && (hxd.Key.isPressed(hxd.Key.MOUSE_LEFT) || hxd.Key.isPressed(hxd.Key.SPACE))) {
            dragon.flap();
            tap.alpha = 0;
            mode = 1;
        }

        if (mode == 1) {
            if (hxd.Key.isPressed(hxd.Key.MOUSE_LEFT) || hxd.Key.isPressed(hxd.Key.SPACE)) dragon.flap();
            dragon.update(dt);
            obstacles.update(dt, gameSpeed, dragon, score);
        }
        
        if (mode == 0 || mode == 1) background.update(dt, gameSpeed);

        if (mode == 1 && (obstacles.intersects(dragon.getBounds())
            || dragon.y >= hxd.Window.getInstance().height)) {
            hxd.Res.sounds.hit.play(false, 0.2);
            hxd.Res.sounds.die.play(false, 0.2);
            mode = 2;
        }
        
        if (mode == 2) {
            dragon.pause = true;
            dragon.update(dt);
            if (dragon.y > hxd.Window.getInstance().height*2) mode = 3;
        }

        if (mode == 3) {
            var button = new Button(this, hxd.Res.loader.load('replay.png').toTile());
            button.buttonInteractive.onClick = function(event: hxd.Event) {
                setScreen(new Menu(app));
            }
            mode = 4;
        }
        
    }
}