package player;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.math.Vector;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import items.Item;
import items.Deodorant;
import items.Remote;
import player.Inventory;

class Player extends Entity {

    public var interacting:Bool;
    public var inventoryOpen:Bool;
    private var inventory:Inventory;
    private var items:Array<Item>;

    private var sprite:Spritemap;
    private var velocity:Vector;

    public function new(x:Float, y:Float) {

        super(x, y);
        
        setHitbox(65, 110, -5, -7);
        type = "player";

        sprite = new Spritemap("graphics/sem.png", 75, 125);
        sprite.add("idle", [0]);
        sprite.add("walk", [0, 1, 2], 10);
        sprite.play("idle");

        graphic = sprite;
        layer = 0;

        Input.define("left", [Key.LEFT]);
        Input.define("right", [Key.RIGHT]);
        Input.define("inventory", [Key.X]);
        Input.define("shift", [Key.SHIFT]);

        interacting = false;
        inventoryOpen = false;
        items = new Array<Item>();
        velocity = new Vector(0, 0);
    }

    public function addItem(item:Item) {

        items.push(item);
    }

    public function getInventory():Inventory {

        return inventory;
    }

    private function handleAnimations() {

        if (velocity.x < 0) {
            sprite.play("walk");
            sprite.flipped = true;
        }
        else if (velocity.x > 0) {
            sprite.play("walk");
            sprite.flipped = false;
        }
        else if (velocity.x == 0) {
            sprite.play("idle");
        }
    }

    private function handleInput() {

        velocity.x = 0;

        if (Input.check("left")) {
            if (collide("solid", x - 2, y) == null) {
                velocity.x = -2;
            }
        }
        else if (Input.check("right")) {
            if (collide("solid", x + 2, y) == null) {
                velocity.x = 2;
            }
        }

        if (Input.check("shift")) {
            if (Input.check("left")) {
                if (collide("solid", x - 5, y) == null) {
                    velocity.x = -5;
                }
            }
            else if (Input.check("right")) {
                if (collide("solid", x + 5, y) == null) {
                    velocity.x = 5;
                }
            }
        }

        if (Input.pressed("inventory")) {
            inventory = new Inventory(items);
            if (x < 700) {
                inventory.x = HXP.halfWidth + HXP.halfWidth / 8;
            }
            else if (x > 700 && x < 1400) {
                inventory.x = HXP.halfWidth / 8;
            }
            else if (x > 1400 && x < 2100) {
                inventory.x = HXP.halfWidth + HXP.halfWidth / 8;
            }
            scene.add(inventory);
            inventoryOpen = true;
        }
    }

    private function handleGravity() {

        if (collide("solid", x, y + 2) == null) {
            velocity.y = 2;
        }
    }

    private function handleInventory() {
        if (Input.pressed("inventory")) {
            scene.remove(inventory);
            inventoryOpen = false;
        }
    }

    public override function update() {

        handleAnimations();
        //handleGravity();
        if (!interacting && !inventoryOpen) {
            handleInput();
        }
        else if (!interacting && inventoryOpen) {
            handleInventory();
        }

        if (interacting || inventoryOpen) {
            velocity.x = 0;
            velocity.y = 0;
        }

        moveBy(velocity.x, velocity.y);

        if (!interacting && !inventoryOpen && x > 1410 && x < 1500 && y == 890) {
            if (Input.pressed("interact"))
                y = 540;
        }
        else if (!interacting && !inventoryOpen && x > 1410 && x < 1500 && y == 540) {
            if (Input.pressed("interact"))
                y = 890;
        }
        else if (!interacting && !inventoryOpen && x > 1560 && x < 1620 && y == 540) {
            if (Input.pressed("interact"))
                y = 190;
        }
        else if (!interacting && !inventoryOpen && x > 1410 && x < 1500 && y == 190) {
            if (Input.pressed("interact"))
                y = 540;
        }

        super.update();
    }
}
