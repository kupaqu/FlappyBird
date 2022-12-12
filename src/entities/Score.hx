package entities;

import screens.*;

class Score {
    var score: Int = 0;
    var text: h2d.Text;

    public function new(parent: Screen) {
        text = new h2d.Text(hxd.Res.digits.toFont(), parent);
        text.textAlign = Center;
        text.setScale(1.5);
        text.x = hxd.Window.getInstance().width/2;
        text.y = hxd.Window.getInstance().height/8;
        text.text = '$score';
    }

    public function increment() {
        hxd.Res.sounds.point.play(false, 0.2);
        score += 1;
        text.text = '$score';
    }
}