package hxinput;
import cpp.Lib;

/**
 * ...
 * @author Karaidon
 */

class XInput 
{
	
	private static var dll_setRumble:Dynamic;
	private static var dll_leftTrigger:Dynamic;
	private static var dll_rightTrigger:Dynamic;
	private static var dll_leftThumbX:Dynamic;
	private static var dll_leftThumbY:Dynamic;
	private static var dll_rightThumbX:Dynamic;
	private static var dll_rightThumbY:Dynamic;
	private static var dll_getButtonState:Dynamic;
	private static var dll_checkButton:Dynamic;
	private static var dll_getCtrlState:Dynamic;
	
	public static var enabled:Bool = true;

	public static function initialize():Bool
	{
		try
		{
			dll_setRumble = Lib.load("hXInput", "setRumble", 3);
			dll_leftTrigger = Lib.load("hXInput", "leftTrigger", 1);
			dll_rightTrigger = Lib.load("hXInput", "rightTrigger", 1);
			dll_leftThumbX = Lib.load("hXInput", "leftThumbX", 1);
			dll_leftThumbY = Lib.load("hXInput", "leftThumbY", 1);
			dll_rightThumbX = Lib.load("hXInput", "rightThumbX", 1);
			dll_rightThumbY = Lib.load("hXInput", "rightThumbY", 1);
			dll_getButtonState = Lib.load("hXInput", "getButtonState", 1);
			dll_checkButton = Lib.load("hXInput", "checkButton", 2);
			dll_getCtrlState = Lib.load("hXInput", "getCtrlState", 1);
			enabled = true;
			return true;
		}
		catch (e:Dynamic)
		{
			enabled = false;
			return false;
		}
	}
	
	/**
	 * 
	 * @param	_index index of controller to send rumble to
	 * @param	_left rumble level of left motor
	 * @param	_right rumble level of right motor
	 * @return  _index
	 */
	public static function setRumble(_index:Int = 0, _left:Int = 0, _right:Int = 0):Int
	{
		if (enabled == false) return 0;
		if (dll_setRumble == null) return 0;
		return dll_setRumble(Std.int(Math.max(0, Math.min(_index, 3))),
		Std.int(Math.max(0, Math.min(_left, 65535))),
		Std.int(Math.max(0, Math.min(_right, 65535))));
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return 0 - 255, 255 is fully pulled
	 */
	public static function leftTrigger(_index:Int):Int
	{
		if (enabled == false) return 0;
		if (dll_leftTrigger == null) return 0;
		return dll_leftTrigger(Std.int(Math.max(0, Math.min(_index, 3))));
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return 0 - 255, 255 is fully pulled
	 */
	public static function rightTrigger(_index:Int):Int
	{
		if (enabled == false) return 0;
		if (dll_rightTrigger == null) return 0;
		return dll_rightTrigger(Std.int(Math.max(0, Math.min(_index, 3))));
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return -32768 - 32767, fully right is 32767
	 */
	public static function leftThumbX(_index:Int):Int
	{
		if (enabled == false) return 0;
		if (dll_leftThumbX == null) return 0;
		return dll_leftThumbX(Std.int(Math.max(0, Math.min(_index, 3))));
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return -32768 - 32767, fully right is 32767
	 */
	public static function rightThumbX(_index:Int):Int
	{
		if (enabled == false) return 0;
		if (dll_rightThumbX == null) return 0;
		return dll_rightThumbX(Std.int(Math.max(0, Math.min(_index, 3))));
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return -32768 - 32767, fully up is 32767
	 */
	public static function leftThumbY(_index:Int):Int
	{
		if (enabled == false) return 0;
		if (dll_leftThumbY == null) return 0;
		return dll_leftThumbY(Std.int(Math.max(0, Math.min(_index, 3))));
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return -32768 - 32767, fully right is 32767
	 */
	public static function rightThumbY(_index:Int):Int
	{
		if (enabled == false) return 0;
		if (dll_rightThumbY == null) return 0;
		return dll_rightThumbY(Std.int(Math.max(0, Math.min(_index, 3))));
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return int representing state of all buttons
	 * http://msdn.microsoft.com/en-us/library/windows/desktop/microsoft.directx_sdk.reference.xinput_gamepad(v=vs.85).aspx
	 * Use bitwise AND to check state of each button
	 * example: if (getButtonState(0) & Xbox360.Y != 0) trace("Y pressed");
	 * else trace("Y not pressed");
	 * It's much easier to just use checkButton() for getting user input
	 * This is useful, though, for allowing custom key bindings
	 */
	public static function getButtonState(_index:Int):Int
	{
		if (enabled == false) return 0;
		if (dll_getButtonState == null) return 0;
		return dll_getButtonState(Std.int(Math.max(0, Math.min(_index, 3))));
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @param	_button use one of the class inline vars
	 * @return true if button is pressed
	 */
	public static function checkButton(_index:Int, _button:Int):Bool
	{
		if (enabled == false) return false;
		if (dll_checkButton == null) return false;
		if (dll_checkButton(Std.int(Math.max(0, Math.min(_index, 3))), _button) == 1) return true;
		else return false;
	}
	
	/**
	 * 
	 * @param	_index index of controller to check
	 * @return true if controller is connected
	 */
	public static function getCtrlState(_index:Int):Bool
	{
		if (enabled == false) return false;
		if (dll_getCtrlState == null) return false;
		if (dll_getCtrlState(Std.int(Math.max(0, Math.min(_index, 3)))) == 1167) return false;
		else return true;
	}
	
}