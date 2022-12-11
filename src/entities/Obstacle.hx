package entities;

import screens.*;

class Obstacle {
    var gap: Float;
    var upperPipe: h2d.Bitmap;
    var bottomPipe: h2d.Bitmap;

    public function new(parent: Screen, gap: Float = 200) {
        this.gap = gap;

        upperPipe = new h2d.Bitmap(hxd.Res.loader.load('pipe-green.png').toTile(), parent);

        var scaleCoef = hxd.Window.getInstance().height / upperPipe.tile.height;
        upperPipe.tile.scaleToSize(upperPipe.tile.width*scaleCoef, upperPipe.tile.height*scaleCoef);

        bottomPipe = new h2d.Bitmap(upperPipe.tile.clone(), parent);
        upperPipe.tile.flipY();

        reset();
    }

    public function reset() {
        var newY = Random.float(0, hxd.Window.getInstance().height-gap);
        var newX = hxd.Window.getInstance().width;
        upperPipe.x = newX;
        upperPipe.y = newY;
        bottomPipe.x = newX;
        bottomPipe.y = newY+gap;
    }

    public function update(dt: Float, v: Float) {
        upperPipe.x -= v*dt;
        bottomPipe.x = upperPipe.x;
        if (upperPipe.x < -upperPipe.tile.width) reset();
    }
}