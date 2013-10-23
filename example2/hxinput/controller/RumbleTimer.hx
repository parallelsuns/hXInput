package hxinput.controller;

/**
 * ...
 * @author Karaidon
 */

class RumbleTimer 
{
	/**
	 * @return Timestamp of when rumbling started.
	 */
	public static function getStartTime():Float
	{
		return Sys.cpuTime(); //If Haxe-only
		//return 0; //If Haxe-only with constant framerate/using Haxepunk/using HaxeFlixel
	}
	
	/**
	 * @param	startTime rumbleTimeStore, i.e. indicates when rumbling started
	 * @param	oldTime rumbleTimer value from previous frame
	 * @return new rumbleTimer value
	 */
	public static function getNewTime(startTime:Float, oldTime:Float):Float
	{
		return Sys.cpuTime() - oldTime; //If Haxe-only with variable framerate
		//return 1000/60 + oldTime; //If Haxe-only with constant framerate of 60fps;
		//return org.flixel.FlxG.elapsed + oldTime //If using HaxeFlixel
		//return com.haxepunk.HXP.elapsed + oldTime; //If using Haxepunk
	}
}