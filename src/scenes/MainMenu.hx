package scenes;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Tween;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.tweens.misc.VarTween;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class MainMenu extends Scene {

    private var baseY:Float;
    private var colorMapping:Array<Int>;
    private var cursor:Entity;
    private var cursorRect:Image;
    private var lockedCursor:Bool;
    private var selection:Int;
    private var totalSelections:Int;
    private var updateColor:Bool;

    public function new() {
        super();

        Input.define("left", [Key.LEFT]);
        Input.define("right", [Key.RIGHT]);
        Input.define("up", [Key.UP]);
        Input.define("down", [Key.DOWN]);
        Input.define("confirm", [Key.Z]);
        Input.define("cancel", [Key.C]);

        selection = 0;
        totalSelections = 0;
        baseY = HXP.halfHeight + HXP.halfHeight / 4;
    }

    public override function begin() {
        HXP.screen.color = 0xefe8b6;
        colorMapping = new Array<Int>();
        colorMapping[0] = 0xde8728;
        colorMapping[1] = 0xde8728;
        colorMapping[2] = 0x206d8b;
        cursorRect = Image.createRect(1, 4, colorMapping[0], 0.7);
        cursor = new Entity();
        cursor.setHitbox(1, 4);
        cursor.addGraphic(cursorRect);
        add(cursor);

        var background:Entity = new Entity();
        background.graphic = new Image("graphics/open.png");
        add(background);

        var start:Text = new Text("", 0, 0, 0, 0, {color: 0xa01616, font: "font/snoopy.otf", size: 24});
        start.text = "Z TO START";
        start.x = 96;
        start.y = baseY + 32;
        addGraphic(start);

        cursor.x = 0;
        cursor.y = baseY + 24;

        lockedCursor = true;
        updateColor = false;
    }

    private function handleInput() {

        if (Input.pressed("up")) {
            selection--;
            updateColor = true;
        }
        else if (Input.pressed("down")) {
            selection++;
            updateColor = true;
        }


        if (selection < 0) {
            selection = totalSelections;
        }
        if (selection > totalSelections) {
            selection = 0;
        }

        if (updateColor) {
            updateColor = false;
            cursorRect.color = colorMapping[selection];
        }

        if (Input.pressed("confirm")) {
            lockedCursor = true;
            HXP.scene = new Test();
        }

        cursor.y = baseY + 24 + 32 * selection;
    }

    public override function update() {
        super.update();

        handleInput();
    }
}
