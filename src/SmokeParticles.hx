import com.haxepunk.Entity;
import com.haxepunk.utils.Ease;
import com.haxepunk.graphics.Emitter;

class SmokeParticles extends Entity {

    private var emitter:Emitter;

    public function new(x:Float, y:Float) {

        super(x, y);

        emitter = new Emitter("graphics/cloudparts.png", 12, 11);
        emitter.newType("smoke", [0]);
        emitter.setAlpha("smoke", 1, 0.2);
        emitter.setColor("smoke", 0xb9b9b9, 0xb9b9b9);
        emitter.setMotion("smoke", 0, 100, 10, 360, -100, 3, Ease.quadOut);
        graphic = emitter;

        layer = 0;
    }

    public function smoke() {
        
        for (i in 0...500) {
            emitter.emit("smoke", x, y);
        }
    }
}
