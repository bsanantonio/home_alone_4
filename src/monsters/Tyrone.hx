package monsters;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

import monsters.Monster;

class Tyrone extends Monster {

    public function new(x:Float, y:Float) {

        super(x, y);

        setHitbox(180, 200);

        var sprite:Spritemap = new Spritemap("graphics/tyrone.png", 180, 200);
        sprite.add("idle", [0, 1], 2);
        sprite.play("idle");

        graphic = sprite;
        layer = 1;
        name = "tyrone";

        quotes.push("You makin' *gasp* gains?");
        quotes.push("How much you bench?");
        quotes.push("This is 20 *gasp* pounds. I'm trying to lose *inhale* weight.");
        quotes.push("No, this is not a shake weight. It's 20 pounds.");
        quotes.push("It's not a shake weight!");
    }
}
