import com.haxepunk.Entity;

class Interactable extends Entity {

    private var quotes:Array<String>;
    private var quotesIterator:Int;

    public function new(x:Float, y:Float) {

        super(x, y);

        quotes = new Array<String>();
        quotesIterator = 0;
    }

    public function getQuote():String {

        if (quotesIterator == quotes.length) {
            quotesIterator = 0;
            return "";
        }
        var quote:String = quotes[quotesIterator];
        quotesIterator++;
        return quote;
    }
}
