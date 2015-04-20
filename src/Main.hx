import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine {

    override public function init() {
        HXP.scene = new scenes.MainMenu();
    }

    public static function main() {
        new Main(); 
    }
}
