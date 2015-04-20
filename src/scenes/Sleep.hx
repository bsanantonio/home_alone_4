package scenes;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;
import com.haxepunk.graphics.Image;

class Sleep extends Scene {

    public function new() {
        super();
    }

    public override function begin() {

        super.begin();

        var credits:Entity = new Entity();
        credits.graphic = new Image("graphics/sleep.png");
        add(credits);

        var music = new Sfx("audio/ld_2.mp3");
        music.loop();
    }
}
