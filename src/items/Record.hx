package items;

import com.haxepunk.graphics.Image;

import items.Item;

class Record extends Item {

    public function new(x:Float, y:Float) {

        super(x, y);

        graphic = new Image("graphics/punkrawk.png");
        name = "punk rock";
        setHitbox(32, 56, -18, -6);

        icon = new Image("graphics/icons/punkrawk.png");

        fail = "Punx not dead.";
        success = "Punk died with the Renaissance!";
        usableWith = "tim";
    }
}
