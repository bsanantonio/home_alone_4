import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Text;

import flash.text.TextFormatAlign;

class TextBox extends Entity {

    private var s:String;

    public function new(x:Float, y:Float, s:String) {

        super(x, y);

        var sprite:Spritemap = new Spritemap("graphics/textbox.png", 192, 128);
        sprite.add("idle", [0, 1], 5);
        sprite.play("idle");

        graphic = sprite;
        layer = 0;

        this.s = s;
    }

    public override function added() {

        super.added();

        handleText();
    }

    public function handleText() {

        var text:Text = new Text("", 0, 0, 160, 128, {align: TextFormatAlign.CENTER, color: 0xde8728, font: "font/snoopy.otf", resizable: true, size: 20, wordWrap: true});
        text.text = s;
        text.x += 16;
        text.y += (128 - text.textHeight) / 2;
        addGraphic(text);
    }

    public override function update() {

        super.update();
    }
}
