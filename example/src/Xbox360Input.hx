package;
import cpp.Lib;
/**
 * Handles communication with hXInput,
 * allows interface with Xbox 360 gamepads.
 * @author Karaidon
 */

class Xbox360Input
{
	private static var dll_setRumble:Dynamic = Lib.load("hXInput", "setRumble", 3);
	private static var dll_leftTrigger:Dynamic = Lib.load("hXInput", "leftTrigger", 1);
	private static var dll_rightTrigger:Dynamic = Lib.load("hXInput", "rightTrigger", 1);
	private static var dll_leftThumbX:Dynamic = Lib.load("hXInput", "leftThumbX", 1);
	private static var dll_leftThumbY:Dynamic = Lib.load("hXInput", "leftThumbY", 1);
	private static var dll_rightThumbX:Dynamic = Lib.load("hXInput", "rightThumbX", 1);
	private static var dll_rightThumbY:Dynamic = Lib.load("hXInput", "rightThumbY", 1);
	private static var dll_getButtonState:Dynamic = Lib.load("hXInput", "getButtonState", 1);
	private static var dll_checkButton:Dynamic = Lib.load("hXInput", "checkButton", 2);
	private static var dll_getCtrlState:Dynamic = Lib.load("hXInput", "getCtrlState", 1);
	
	public static inline var DPAD_UP:Int = 0x0001;
	public static inline var DPAD_DOWN:Int = 0x0002;
	public static inline var DPAD_LEFT:Int = 0x0004;
	public static inline var DPAD_RIGHT:Int = 0x0008;
	public static inline var START:Int = 0x0010;
	public static inline var BACK:Int = 0x0020;
	public static inline var LEFT_THUMB:Int = 0x0040;
	public static inline var RIGHT_THUMB:Int = 0x0080;
	public static inline var LEFT_SHOULDER:Int = 0x0100;
	public static inline var RIGHT_SHOULDER:Int = 0x0200;
	public static inline var A:Int = 0x1000;
	public static inline var B:Int = 0x2000;
	public static inline var X:Int = 0x4000;
	public static inline var Y:Int = 0x8000;
	
	public static var enabled:Bool = true;
	
	/**
	 * 
	 * @param	index index of controller to send rumble to
	 * @param	left rumble level of left motor
	 * @param	right rumble level of right motor
	 * @return  index
	 */
	public static function setRumble(index:Int = 0, left:Int = 0, right:Int = 0):Int
	{
		if (enabled == false) return 0;
		return dll_setRumble(index, left, right);
	}
	
	/**
	 * 
	 * @param	index index of controller to read from
	 * @return 0 - 255, 255 is fully pulled
	 */
	public static function leftTrigger(index:Int):Int
	{
		if (enabled == false) return 0;
		return dll_leftTrigger(index);
	}
	
	/**
	 * 
	 * @param	index index of controller to read from
	 * @return 0 - 255, 255 is fully pulled
	 */
	public static function rightTrigger(index:Int):Int
	{
		if (enabled == false) return 0;
		return dll_rightTrigger(index);
	}
	
	/**
	 * 
	 * @param	index index of controller to read from
	 * @return -32768 - 32767, fully right is 32767
	 */
	public static function leftThumbX(index:Int):Int
	{
		if (enabled == false) return 0;
		return dll_leftThumbX(index);
	}
	
	/**
	 * 
	 * @param	index index of controller to read from
	 * @return -32768 - 32767, fully right is 32767
	 */
	public static function rightThumbX(index:Int):Int
	{
		if (enabled == false) return 0;
		return dll_rightThumbX(index);
	}
	
	/**
	 * 
	 * @param	index index of controller to read from
	 * @return -32768 - 32767, fully up is 32767
	 */
	public static function leftThumbY(index:Int):Int
	{
		if (enabled == false) return 0;
		return dll_leftThumbY(index);
	}
	
	/**
	 * 
	 * @param	index index of controller to read from
	 * @return -32768 - 32767, fully right is 32767
	 */
	public static function rightThumbY(index:Int):Int
	{
		if (enabled == false) return 0;
		return dll_rightThumbY(index);
	}
	
	/**
	 * 
	 * @param	index index of controller to read from
	 * @return int representing state of all buttons
	 * http://msdn.microsoft.com/en-us/library/windows/desktop/microsoft.directxsdk.reference.xinputgamepad(v=vs.85).aspx
	 * Use bitwise AND to check state of each button
	 * example: if (getButtonState(0) & Xbox360.Y != 0) trace("Y pressed");
	 * else trace("Y not pressed");
	 * 
	 * It's much easier to just use checkButton().
	 */
	public static function getButtonState(index:Int):Int
	{
		if (enabled == false) return 0;
		return dll_getButtonState(index);
	}
	
	/**
	 * 
	 * @param	index index of controller to read from
	 * @param	button use one of the class inline vars
	 * @return true if button is pressed
	 */
	public static function checkButton(index:Int, button:Int):Bool
	{
		if (enabled == false) return false;
		if (dll_checkButton(index, button) == 1) return true;
		else return false;
	}
	
	/**
	 * 
	 * @param	index index of controller to check
	 * @return true if controller is connected
	 */
	public static function getCtrlState(index:Int):Bool
	{
		if (dll_getCtrlState(index) == 1167) return false;
		else return true;
	}
	/**
	 * Polls controllers to check if they are connected. If they are not,
	 * disable Xbox360Input.
	 * @param	start first controller to poll
	 * @param	end last controller to poll
	 * @return	true if there is at least one controller is detected, else false.
	 */
	public static function poll(start:Int = 0, end:Int = 3):Bool
	{
		var iter:IntIter = new IntIter(start, end);
		var state:Bool = false;
		for (i in iter)
		{
			if (getCtrlState(i) == true) state = true;
		}
		
		if (state == true) enabled = true;
		else enabled = false;
		
		return enabled;
	}
}