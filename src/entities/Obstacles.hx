package entities;

import screens.*;

class Obstacles {
    var n: Int;
    var dist: Float;
    var arr: Array<Obstacle>;
    public function new(parent: Screen, gap: Float = 200, n: Int = 3) {
        arr = new Array<Obstacle>();
        for (i in 0...n) arr[i] = new Obstacle(parent);
        dist = (hxd.Window.getInstance().width + arr[0].upperPipe.tile.width)/n;

        for (i in 0...arr.length) {
            arr[i].upperPipe.x = hxd.Window.getInstance().width + (dist*i);
            arr[i].bottomPipe.x = arr[i].upperPipe.x;
        }
    }
    public function update(dt, v) {
        for (obstacle in arr) {
            obstacle.update(dt, v);
        }
    }
}