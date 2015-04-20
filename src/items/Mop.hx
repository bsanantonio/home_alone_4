package items;

import com.haxepunk.graphics.Image;

import items.Item;

class Mop extends Item {

    public function new(x:Float, y:Float) {

        super(x, y);

        graphic = Image.createRect(16, 16, 0x206d8b);
        name = "mop";
        setHitbox(30, 100, -14, -10);


        graphic = new Image("graphics/mop.png");
        icon = new Image("graphics/icons/mop.png");

        fail = "I cleaned this yesterday.";
        success = "Noo! My record!";
        usableWith = "benny";
    }
}
