package monsters;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

import monsters.Monster;

class TyroneThrustin extends Monster {

    public function new(x:Float, y:Float) {

        super(x, y);

        setHitbox(180, 200);

        var sprite:Spritemap = new Spritemap("graphics/tyrone_thrustin.png", 180, 200);
        sprite.add("idle", [0, 1], 2);
        sprite.play("idle");

        graphic = sprite;
        layer = 1;
        name = "tyrone_thrustin";

        quotes.push("You found a secret room.");
        quotes.push("There's nothing here though.");
        quotes.push("Really there isn't.");
        quotes.push("It's not a shake weight!");
    }
}

