package entities;

import screens.*;

class Layer {
    
    var bitmaps: Array<h2d.Bitmap>;

    public function new(scaleCoef: Float, tile: h2d.Tile, parent: Screen) {
        var layerTile = tile.clone();
        layerTile.scaleToSize(layerTile.width*scaleCoef, layerTile.height*scaleCoef);
        layerTile.dy = -layerTile.height;

        bitmaps = new Array<h2d.Bitmap>();
        var n = Math.ceil(hxd.Window.getInstance().width / layerTile.width) + 1;
        for (i in 0...n) {
            bitmaps.push(new h2d.Bitmap(layerTile, parent));
            bitmaps[i].setPosition(layerTile.width*i, hxd.Window.getInstance().height);
        }
    }

    public function update(dt: Float, v: Float) {
        for (i in 0...bitmaps.length) {
            bitmaps[i].x -= v*dt;
            if (bitmaps[i].x < -bitmaps[i].tile.width)
                bitmaps[i].x = bitmaps[i].tile.width*(bitmaps.length-1);
        }
    }
}