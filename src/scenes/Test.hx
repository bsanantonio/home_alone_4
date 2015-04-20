package scenes;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import SmokeParticles;
import Star;
import TextBox;
import items.Item;
import items.Deodorant;
import items.Doughnut;
import items.Mop;
import items.Record;
import items.Remote;
import monsters.Benny;
import monsters.Larry;
import monsters.Tim;
import monsters.Tyrone;
import monsters.TyroneThrustin;
import monsters.Monster;
import player.Player;
import scenes.Sleep;

class Test extends Scene {

    private var monsterCount:Int;
    private var canSleep:Bool;
    private var music:Sfx;
    private var currentTextBox:TextBox;
    private var player:Player;

    public function new() {
        super();

        player = new Player(1050, 890);
        add(player);

        monsterCount = 4;
        Input.define("interact", [Key.Z]);
    }

    public override function begin() {

        var wall:Entity = new Entity(-16, 0);
        wall.setHitbox(16, 1050);
        wall.type = "solid";
        add(wall);
        wall = new Entity(2100, 0);
        wall.setHitbox(16, 1050);
        wall.type = "solid";
        add(wall);

        var backdrop:Image = new Image("graphics/outside.png");
        var background:Entity = new Entity(0, 700);
        background.graphic = backdrop;
        background.layer = 10;
        add(background);

        backdrop = new Image("graphics/livingroom.png");
        background = new Entity(700, 700);
        background.graphic = backdrop;
        background.layer = 10;
        add(background);

        backdrop = new Image("graphics/kitchen.png");
        background = new Entity(1400, 700);
        background.graphic = backdrop;
        background.layer = 10;
        add(background);

        backdrop = new Image("graphics/mapa.png");
        background = new Entity(0, 350);
        background.graphic = backdrop;
        background.layer = 10;
        add(background);

        backdrop = new Image("graphics/study.png");
        background = new Entity(700, 350);
        background.graphic = backdrop;
        background.layer = 10;
        add(background);

        backdrop = new Image("graphics/hallbath.png");
        background = new Entity(1400, 350);
        background.graphic = backdrop;
        background.layer = 10;
        add(background);

        backdrop = new Image("graphics/semroom.png");
        background = new Entity(1400, 0);
        background.graphic = backdrop;
        background.layer = 10;
        add(background);

        music = new Sfx("audio/ld_1.mp3");
        music.loop();


        var benny:Benny = new Benny(96, 890);
        add(benny);

        var larry:Larry = new Larry(1200, 890);
        add(larry);

        var tim:Tim = new Tim(1100, 540);
        add(tim);

        var tyrone:Tyrone = new Tyrone(64, 460);
        add(tyrone);

        for (i in 0...3) {

            var tyroneThrustin:TyroneThrustin = new TyroneThrustin(764 + 100 * i, 110);
            add(tyroneThrustin);
        }

        var deodrant:Deodorant = new Deodorant(580, 540);
        add(deodrant);

        var donut:Doughnut = new Doughnut(2000, 870);
        add(donut);

        var mop:Mop = new Mop(2000, 540);
        add(mop);

        var record:Record = new Record(1900, 250);
        add(record);

        var remote:Remote = new Remote(1050, 880);
        add(remote);

        var moon:Moon = new Moon(32, 732);
        add(moon);

        for (i in 0...15) {

            var star:Star = new Star(Std.random(630) + 32, Std.random(178) + 700);
            add(star);
        }
    }

    private function handleInteractions() {

        if (!player.inventoryOpen) {
            var e:Entity = player.collide("item", player.x, player.y);
            if (e != null) {
                var item:Item = cast(e, Item);
                if (Input.pressed("interact")) {
                    if (player.interacting) {
                        player.interacting = false;
                        player.addItem(item);
                        remove(item);
                        remove(currentTextBox);
                    }
                    else {
                        player.interacting = true;
                        currentTextBox = new TextBox(player.x - player.width, player.y - player.height, "You picked up a " + item.name + ".");
                        add(currentTextBox);
                    }
                }
            }

            var e:Entity = player.collide("monster", player.x, player.y);
            if (e != null) {
                var monster:Monster = cast(e, Monster);
                if (Input.pressed("interact")) {
                    if (player.interacting) {
                        player.interacting = false;
                        remove(currentTextBox);
                    }
                    else {
                        player.interacting = true;
                        var quote:String = monster.getQuote();
                        if (quote == "") {
                            quote = monster.getQuote();
                        }
                        currentTextBox = new TextBox(player.x - player.width, player.y - player.height, quote);
                        add(currentTextBox);
                    }
                }
            }
        }
        else {

            if (Input.pressed("interact")) {

                var usedItem:Item = player.getInventory().getSelected();
                var e:Entity = player.collide("item", player.x, player.y);
                var f:Entity = player.collide("monster", player.x, player.y);

                if (e != null) {

                    if (player.interacting) {
                        player.interacting = false;
                        remove(currentTextBox);
                    }
                    else {
                        var item:Item = cast(e, Item);
                        var quote:String = "";
                        if (usedItem.getUsableWith() == item.name) {
                            quote = usedItem.getSuccess();
                        }
                        else {
                            quote = usedItem.getFail();
                        }
                        player.interacting = true;
                        currentTextBox = new TextBox(player.x - player.width, player.y - player.height, quote);
                        add(currentTextBox);
                    }
                }
                else if (f != null) {

                    if (player.interacting) {
                        player.interacting = false;
                        remove(currentTextBox);
                    }
                    else {
                        var monster:Monster = cast(f, Monster);
                        var quote:String = "";
                        if (usedItem.getUsableWith() == monster.name) {
                            quote = usedItem.getSuccess();
                            remove(monster);
                            monsterCount--;
                        }
                        else {
                            quote = usedItem.getFail();
                        }
                        player.interacting = true;
                        currentTextBox = new TextBox(player.x - player.width, player.y - player.height, quote);
                        add(currentTextBox);
                    }
                }
                else {
                    if (player.interacting) {
                        player.interacting = false;
                        remove(currentTextBox);
                        if (monsterCount == 0) {
                            canSleep = true;
                            currentTextBox = new TextBox(player.x - player.width, player.y - player.height, "Woo! That's all of 'em. Time to sleep.");
                            add(currentTextBox);
                            player.interacting = true;
                            monsterCount = -1;
                        }
                    }
                    else {
                        player.interacting = true;
                        var quote:String = usedItem.getFail();
                        currentTextBox = new TextBox(player.x - player.width, player.y - player.height, quote);
                        add(currentTextBox);
                    }
                }
            }
        }
    }

    public override function update() {

        super.update();

        handleInteractions();

        // camera stuff
        if (player.x < 700)
            camera.x = 0;
        else if (player.x > 700 && player.x < 1400)
            camera.x = 700;
        else if (player.x > 1400 && player.x < 2100)
            camera.x = 1400;
        if (player.y < 350)
            camera.y = 0;
        else if (player.y > 350 && player.y < 700)
            camera.y = 350;
        else if (player.y > 700 && player.y < 1050)
            camera.y = 700;

        if (canSleep && player.y == 190) {
            music.stop();
            HXP.scene = new Sleep();
        }
    }
}
