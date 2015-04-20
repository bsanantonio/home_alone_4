package monsters;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

import monsters.Monster;

class Larry extends Monster {

    public function new(x:Float, y:Float) {

        super(x, y);

        setHitbox(85, 115, 10);

        var sprite:Spritemap = new Spritemap("graphics/larry.png", 65, 115);
        sprite.add("idle", [0, 1], 2);
        sprite.play("idle");

        sprite.flipped = true;

        graphic = sprite;
        layer = 1;
        name = "larry";

        quotes.push("The new season of Mad Men started.");
        quotes.push("My favorite part of Girls is the commercials.");
        quotes.push("Hey, wait.. Don't touch that remote.");
        quotes.push("These PRETZELS are making me THIRSTY.");
    }
}
