hXInput
=======

hXInput is a DLL, based on GMXInput by yellowsix (http://gmc.yoyogames.com/index.php?showtopic=360286),
that acts as a wrapper for the XInput API (which is part of DirectX), allowing access to XInput within Haxe.

This allows full native support for the Xbox 360 controller, with all buttons, sticks and triggers accessible on Windows.
Rumble is also supported. It also allows you to turn on and off controllers without issue even while your
application is running.

hXInput should work with 32-bit and 64-bit versions of Windows 8, 7, Vista, and possibly XP (unconfirmed).

The compiled DLL and source is available, with a compiled test application and source for the test application.

Basic Usage:
Grab the hXInput.dll and drop it in your application directory. Refer to or use Xbox360Input.hx in the example
application for a class with all the necessary functions to interface with XInput.

Note: calling the dll functions when there is no controller connected can be unusually resource-intensive, 
and may result in a noticeable framerate drop in your game. You should use poll the controller/s with
getCtrlState() every few seconds to check if they are connected and disable the hXInput function calls when
they are not connected.

IF you need something which already includes higher-level features (i.e, button release checks, 
stick deadzone checks,etc.), refer to: openfl-xinput (https://github.com/Sunjammer/openfl-xinput).
That requires openfl though, while hXInput does not.
