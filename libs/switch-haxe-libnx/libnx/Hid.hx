package libnx;

@:ammer.sub((_:HidControllerID))
@:ammer.sub((_:HidControllerKeys))
class Hid extends ammer.Library<"nx">
{
    @:ammer.native("hidScanInput")
    public static function scanInput(): Void;

    @:ammer.native("hidKeysDown")
    public static function keysDown(controllerId: Int): Int;
}

class HidControllerID extends ammer.Sublibrary<Hid>
{
    public static var CONTROLLER_P1_AUTO: Int;
}

class HidControllerKeys extends ammer.Sublibrary<Hid>
{
    public static var KEY_PLUS: Int;
}
