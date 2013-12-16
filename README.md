hXInput
=======

hXInput is a Haxe library and DLL (the dll's api is based on GMXInput by yellowsix (http://gmc.yoyogames.com/index.php?showtopic=360286)),
that acts as a wrapper for the XInput API (which is part of DirectX), allowing access to XInput within Haxe.

This allows full native support for the Xbox 360 controller, with all buttons, sticks and triggers accessible on Windows.
Rumble is also supported. It also allows you to turn on and off controllers without issue even while your
application is running.

hXInput should work with 32-bit and 64-bit versions of Windows 8, 7, Vista, and possibly XP (unconfirmed).

The compiled DLL and source is available, with 2 haxe libraries to interface with the dll. One is a basic library (in example folder) which just mirrors the DLL's api. This is if you wish to implement your own input handling methods.

The other library (in example2 folder) is fully developed with plenty of functions to get and send input.

<h3>Usage with basic haxe library:</h3>
Grab the hXInput.dll and drop it in your application directory. 

For a basic input library, refer to or use Xbox360Input.hx in the example
folder for a class with all the basic necessary functions to interface with XInput.

<h3>Usage with more complete haxe library</h3>
For a more complete input library, use example2. To use the library in example2, call ControllerInput.initialize() at application start.
Then ensure you call ControllerInput.update() every frame, prior to your entity update loop. the only class you have to interact with is ControllerInput. 

You may also have to import some of the enums in the hx files to provide as arguments for functions. For buttons, use the int constants in the Xbox360Gamepad class, in ControllerInput.hx.

It has plenty of functions for receiving input and sending rumble data, and all functions are thoroughly documented.
Everything else is handled behind the scenes.

<h3>Note:</h3>
If using the more complete haxe library, you should modify the getNewTime() function in RumbleTimer.hx to use the appropriate timing functionality depending on which engine/framework you are using, e.g. Haxepunk's HXP.elapsed or HaxeFlixel's FlxG.elapsed etc.

<h3>Note:</h3>
If using the basic library, calling the dll functions when there is no controller connected can be unusually resource-intensive, 
and may result in a noticeable framerate drop in your game. You should poll the controller/s with
getCtrlState() every few seconds to check if they are connected and disable the hXInput function calls when
they are not connected.

<h3>License:</h3>
Public Domain. Refer to License file for details.

If you're using openfl, an alternative is: openfl-xinput (https://github.com/Sunjammer/openfl-xinput).
That requires openfl though, while hXInput does not.
