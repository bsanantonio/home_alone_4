import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

class Star extends Entity {

    public function new(x:Float, y:Float) {

        super(x, y);

        var sprite:Spritemap = new Spritemap("graphics/star.png", 10, 10);
        sprite.add("idle", [0, 1], 2);
        sprite.play("idle");

        graphic = sprite;
        layer = 1;
    }
}
