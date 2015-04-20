import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

class Moon extends Entity {

    public function new(x:Float, y:Float) {

        super(x, y);

        var sprite:Spritemap = new Spritemap("graphics/moon.png", 100, 100);
        sprite.add("idle", [0, 1], 2);
        sprite.play("idle");

        graphic = sprite;
        layer = 1;
    }
}
