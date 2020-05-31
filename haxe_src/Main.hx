import libnx.Console;
import libnx.Applet;
import libnx.Hid;

class Main
{
    static public function main() : Void
    {
        // Initialize console
        Console.init(0);

        // Hello World!
        trace("Hello World");

        while(Applet.mainLoop())
        {
            // Scan all the inputs. This should be done once for each frame
            Hid.scanInput();

            // hidKeysDown returns information about which buttons have been just pressed (and they weren't in the previous frame)
            final kDown: Int = Hid.keysDown(HidControllerID.CONTROLLER_P1_AUTO);

            if (kDown & HidControllerKeys.KEY_PLUS != 0) break; // break in order to return to hbmenu

            Console.update(0);
        }

        Console.exit(0);
    }
}
