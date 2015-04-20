package items;

import com.haxepunk.graphics.Image;

import items.Item;

class Doughnut extends Item {

    public function new(x:Float, y:Float) {

        super(x, y);

        graphic = new Image("graphics/donut.png");
        name = "donut";
        setHitbox(32, 56, -18, -6);

        icon = new Image("graphics/icons/donut.png");

        fail = "Ew, this is too fatty.";
        success = "*CRUNCH CRUNCH* *shakes weight*";
        usableWith = "tyrone";
    }
}
