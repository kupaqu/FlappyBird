package entities;

import screens.*;

class Background {
    var background: h2d.Bitmap;
    var layers: Array<Layer>;

    public function new(parent: Screen) {
        background = new h2d.Bitmap(hxd.Res.loader.load('background/layer-0.png').toTile(), parent);
        var scaleCoef = hxd.Window.getInstance().width / background.tile.width;
        background.tile.scaleToSize(background.tile.width*scaleCoef, background.tile.height*scaleCoef);
        
        background.tile.dx = -background.tile.width/2;
        background.tile.dy = -background.tile.height/2;
        background.x = hxd.Window.getInstance().width/2;
        background.y = hxd.Window.getInstance().height/2;
        
        layers = new Array<Layer>();
        for (i in 1...5) {
            layers.push(new Layer(scaleCoef, hxd.Res.loader.load('background/layer-$i.png').toTile(), parent));
        }
    }

    public function update(dt: Float, v: Float) {
        for (i in 0...layers.length) {
            layers[i].update(dt, v/(layers.length-i));
        }
    }
}