package entities;

import screens.*;

class Dragon extends h2d.Anim {
    
    public function new(parent: Screen) {
        var tiles = new Array<h2d.Tile>();
        for (i in 1...5) {
            tiles.push(hxd.Res.loader.load('dragon/frame-$i.png').toTile());
        }
        super(tiles, parent);
    }

}