package items;

import com.haxepunk.graphics.Image;

import items.Item;

class Remote extends Item {

    public function new(x:Float, y:Float) {

        super(x, y);

        graphic = new Image("graphics/icons/remote_control.png");
        name = "remote";
        setHitbox(32, 40, -4, -6);

        icon = new Image("graphics/icons/remote_control.png");

        fail = "*click*";
        success = "I hate action shows.";
        usableWith = "larry";
    }
}
