package entities;

import screens.*;

class Score {
    var score: Int = 0;
    var text: h2d.Text;

    public function new(parent: Screen) {
        text = new h2d.Text(hxd.res.DefaultFont.get(), parent);
        text.textAlign = Center;
        text.setScale(4);
        text.x = hxd.Window.getInstance().width/2;
        text.text = '$score';
    }

    public function increment() {
        hxd.Res.sounds.point.play(false, 0.2);
        score += 1;
        text.text = '$score';
    }
}