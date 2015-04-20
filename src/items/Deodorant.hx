package items;

import com.haxepunk.graphics.Image;

import items.Item;

class Deodorant extends Item {

    public function new(x:Float, y:Float) {

        super(x, y);
        name = "deodorant";
        setHitbox(30, 40, -10, -5);

        graphic = new Image("graphics/deodorant.png");
        icon = new Image("graphics/icons/deodorant.png");

        name = "deodorant";
        fail = "New spice";
    }
}
