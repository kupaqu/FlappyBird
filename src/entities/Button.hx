package entities;

import screens.*;

class Button {

    public var button: h2d.Bitmap;
    public var buttonInteractive: h2d.Interactive;

    public function new(parent: Screen, tile: h2d.Tile) {
        button = new h2d.Bitmap(tile, parent);
        button.scale(0.5);
        button.tile.dx = -button.tile.width/2;
        button.tile.dy = -button.tile.height/2;
        button.x = hxd.Window.getInstance().width/2;
        button.y = hxd.Window.getInstance().height/1.5;
    
        
        buttonInteractive = new h2d.Interactive(button.tile.width, button.tile.height, button);
        buttonInteractive.x = button.tile.x - button.tile.width/2;
        buttonInteractive.y = button.tile.y - button.tile.height/2;
    }
}