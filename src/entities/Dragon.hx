package entities;

import screens.*;

class Dragon extends h2d.Anim {
    var tiles: Array<h2d.Tile>;
    var v0: Float;
    var v: Float;
    var a: Float;

    var upperAngle = -Math.PI/6;
    var bottomAngle = Math.PI/4;

    var g: h2d.Graphics;

    public function new(parent: Screen, v0: Float = -400, a: Float = 1000) {
        this.tiles = new Array<h2d.Tile>();
        for (i in 1...5) {
            tiles.push(hxd.Res.loader.load('dragon/frame-$i.png').toTile());
        }
        super(tiles, 20, parent);

        this.setDxToCenter();
        this.setToStart();
        this.scale(0.1);

        this.v0 = v0;
        this.v = v0;
        this.a = a;
    }

    public function flap() {
        hxd.Res.sounds.wing.play(false, 0.2);
        if (y > 0) v = v0;
    }

    private function setDxToCenter() {
        for (tile in this.tiles) {
            tile.dx = -tile.width / 2;
            tile.dy = -tile.width / 2;
        }
    }

    public function setToStart() {
        this.x = hxd.Window.getInstance().width / 4;
        this.y = hxd.Window.getInstance().height / 2;
    }

    public function update(dt: Float) {
        y += v*dt;
        v += a*dt;
        var ratio = v/v0;
        if (ratio > 1) ratio = 1;
        else if (ratio < -1) ratio = -1;
        rotation = ((-ratio+1)/2)*(bottomAngle-upperAngle)+upperAngle;
    }

    override function getBounds(?relativeTo: Null<h2d.Object>, ?out: Null<h2d.col.Bounds>): h2d.col.Bounds {
        var min = new h2d.col.Point(x - 20, y - 40);
        var max = new h2d.col.Point(x + 40, y + 20);
        return h2d.col.Bounds.fromPoints(min, max);
    }
}