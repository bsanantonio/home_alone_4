package items;

import com.haxepunk.graphics.Image;

class Item extends Interactable {

    private var icon:Image;
    private var fail:String;
    private var success:String;
    private var usableWith:String;

    public function new(x:Float, y:Float) {

        super(x, y);

        layer = 1;
        type = "item";
    }

    public function getIcon():Image {

        return icon;
    }

    public function getFail():String {

        return fail;
    }

    public function getSuccess():String {
        
        return success;
    }

    public function onUse() {

    }

    public function getUsableWith():String {

        return usableWith;
    }
}
