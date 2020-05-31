package libnx;

class Console extends ammer.Library<"nx">
{
    // TODO: add proper PrintConsole struct

    @:ammer.native("consoleInit")
    public static function init(console: Int): Void;

    @:ammer.native("consoleUpdate")
    public static function update(console: Int): Void;

    @:ammer.native("consoleExit")
    public static function exit(console: Int): Void;
}
