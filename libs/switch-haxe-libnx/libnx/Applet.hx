package libnx;

class Applet extends ammer.Library<"nx">
{
    @:ammer.native("appletMainLoop")
    public static function mainLoop(): Bool;
}
