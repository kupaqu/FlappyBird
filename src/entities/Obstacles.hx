package entities;

import screens.*;

class Obstacles {
    var n: Int;
    var dist: Float;
    var arr: Array<Obstacle>;
    public function new(parent: Screen, gap: Float = 300, n: Int = 3) {
        arr = new Array<Obstacle>();
        for (i in 0...n) arr[i] = new Obstacle(parent, gap);
        dist = (hxd.Window.getInstance().width + arr[0].upperPipe.tile.width)/n;

        for (i in 0...arr.length) {
            arr[i].upperPipe.x = hxd.Window.getInstance().width + (dist*i);
            arr[i].bottomPipe.x = arr[i].upperPipe.x;
        }
    }

    public function update(dt: Float, v: Float, dragon: Dragon, score: Score) {
        for (obstacle in arr) obstacle.update(dt, v, dragon, score);
    }
    
    public function intersects(bounds: h2d.col.Bounds) {
        var intersection = false;
        for (obstacle in arr) intersection = intersection || obstacle.intersects(bounds);
        return intersection;
    }
}