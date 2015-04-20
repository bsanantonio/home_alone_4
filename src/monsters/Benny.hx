package monsters;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

import monsters.Monster;

class Benny extends Monster {

    public function new(x:Float, y:Float) {

        super(x, y);

        setHitbox(200, 175);

        var sprite:Spritemap = new Spritemap("graphics/benny.png", 200, 175);
        sprite.add("idle", [0, 1], 2);
        sprite.play("idle");

        sprite.flipped = true;

        graphic = sprite;
        layer = 1;
        name = "benny";

        quotes.push("I like trash!");
        quotes.push("It's been 167 days since my last shower.");
        quotes.push("I like trash!");
        quotes.push("My life is one big vacation.");
        quotes.push("I like trash!");
        quotes.push("Please don't clean up.");
    }
}
