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
	
	/**
	 * 
	 * @param	_index index of controller to send rumble to
	 * @param	_left rumble level of left motor
	 * @param	_right rumble level of right motor
	 * @return  _index
	 */
	public static function setRumble(_index:Int = 0, _left:Int = 0, _right:Int = 0):Int
	{
		return dll_setRumble(_index, _left, _right);
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return 0 - 255, 255 is fully pulled
	 */
	public static function leftTrigger(_index:Int):Int
	{
		return dll_leftTrigger(_index);
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return 0 - 255, 255 is fully pulled
	 */
	public static function rightTrigger(_index:Int):Int
	{
		return dll_rightTrigger(_index);
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return -32768 - 32767, fully right is 32767
	 */
	public static function leftThumbX(_index:Int):Int
	{
		return dll_leftThumbX(_index);
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return -32768 - 32767, fully right is 32767
	 */
	public static function rightThumbX(_index:Int):Int
	{
		return dll_rightThumbX(_index);
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return -32768 - 32767, fully up is 32767
	 */
	public static function leftThumbY(_index:Int):Int
	{
		return dll_leftThumbY(_index);
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return -32768 - 32767, fully right is 32767
	 */
	public static function rightThumbY(_index:Int):Int
	{
		return dll_rightThumbY(_index);
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @return int representing state of all buttons
	 * http://msdn.microsoft.com/en-us/library/windows/desktop/microsoft.directx_sdk.reference.xinput_gamepad(v=vs.85).aspx
	 * Use bitwise AND to check state of each button
	 * example: if (getButtonState(0) & Xbox360.Y != 0) trace("Y pressed");
	 * else trace("Y not pressed");
	 * 
	 * It's much easier to just use checkButton().
	 */
	public static function getButtonState(_index:Int):Int
	{
		return dll_getButtonState(_index);
	}
	
	/**
	 * 
	 * @param	_index index of controller to read from
	 * @param	_button use one of the class inline vars
	 * @return true if button is pressed
	 */
	public static function checkButton(_index:Int, _button:Int):Bool
	{
		if (dll_checkButton(_index, _button) == 1) return true;
		else return false;
	}
	
	/**
	 * 
	 * @param	_index index of controller to check
	 * @return true if controller is connected
	 */
	public static function getCtrlState(_index:Int):Bool
	{
		if (dll_getCtrlState(_index) == 1167) return false;
		else return true;
	}
}