package items;

import com.haxepunk.graphics.Image;

import items.Item;

class Doughnut extends Item {

    public function new(x:Float, y:Float) {

        super(x, y);

        graphic = Image.createRect(16, 16, 0x206d8b);
        name = "mop";
        setHitbox(32, 56, -18, -6);

        icon = new Image("graphics/icons/doughnut.png");

        fail = "I'm not hungry right now.";
    }
}
