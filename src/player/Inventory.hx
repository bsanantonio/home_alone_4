package player;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import flash.text.TextFormatAlign;

import items.Item;

class Inventory extends Entity {

    private var cursor:Entity;
    private var icons:List<Entity>;
    private var items:Array<Item>;
    private var selection:Int;

    public function new(items:Array<Item>) {

        super(HXP.halfWidth + HXP.halfWidth / 8, HXP.halfHeight / 3);

        Input.define("up", [Key.UP]);
        Input.define("down", [Key.DOWN]);
        Input.define("cancel", [Key.X]);
        
        graphic = new Image("graphics/inventory.png");

        icons = new List<Entity>();
        this.items = items;
        selection = 0;
        followCamera = true;
    }

    public override function added() {

        super.added();

        var i:Int = 0;
        if (items.length > 0) {
            cursor = new Entity();
            cursor.graphic = Image.createRect(160, 36, 0xde8728, 0.3);
            cursor.x = x + 24;
            cursor.y = y + 36;
            scene.add(cursor);

            for (item in items) {

                var label:Text = new Text("", 0, 0, 0, 0, {color: 0x206d8b, font: "font/snoopy.otf", resizable: true, size: 24});
                label.text = item.name;
                label.x = 24;
                label.y = label.textHeight * i + 32;
                addGraphic(label);

                var icon:Entity = new Entity();
                icon.graphic = item.getIcon();
                icon.x = x + label.x + 128;
                icon.y = y + label.y;
                icons.add(icon);
                scene.add(icon);
                i++;
            }
        }
        else {

            var label:Text = new Text("", 0, 0, 384, 160, {align: TextFormatAlign.CENTER, color: 0xde8728, font: "font/snoopy.otf", resizable: true, wordWrap: true});
            label.text = "Weapon inventory is empty.";
            label.y = (160 - label.textHeight) / 2;
            addGraphic(label);
        }
    }

    public override function removed() {

        super.removed();

        if (items.length > 0) {
            scene.remove(cursor);
            scene.removeList(icons);
        }
    }

    public function getSelected() {

        return items[selection];
    }

    private function handleInput() {

        if (Input.pressed("up")) {
            selection--;
        }
        else if (Input.pressed("down")) {
            selection++;
        }

        if (selection > items.length - 1) {
            selection = 0;
        }
        if (selection < 0) {
            selection = items.length;
        }

        if (items.length > 0) {
            cursor.y = y + 36 + selection * 32;
        }
    }

    public override function update() {

        super.update();

        handleInput();
    }
}
