package monsters;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

import monsters.Monster;

class Tim extends Monster {

    public function new(x:Float, y:Float) {

        super(x, y);

        setHitbox(90, 90);

        var sprite:Spritemap = new Spritemap("graphics/tim.png", 90, 90);
        sprite.add("idle", [0, 1], 2);
        sprite.play("idle");

        sprite.flipped = true;

        graphic = sprite;
        layer = 1;
        name = "tim";

        quotes.push("Enunciate when you speak, please.");
        quotes.push("I enjoy the Frenchest of pressed coffees.");
        quotes.push("Bach's second album was pretty good, but the first one is better.");
        quotes.push("Art died with the Renaissance.");
        quotes.push("This is a fine night for quiet reading.");
    }
}
