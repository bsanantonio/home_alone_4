package monsters;

class Monster extends Interactable {

    private var fail:String;
    private var success:String;
    private var usableWith:String;

    public function new(x:Float, y:Float) {

        super(x, y);

        type = "monster";
    }

    public function getFail():String {

        return fail;
    }

    public function getSuccess():String {
        
        return success;
    }

    public function getUsableWith():String {

        return usableWith;
    }
}
