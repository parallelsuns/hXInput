package hxinput;
import hxinput.controller.GameController;
import hxinput.controller.ControlType;
import hxinput.controller.ControllerType;
import hxinput.controller.InputType;
import hxinput.controller.StickAxis;
import hxinput.controller.StickDirection;
/**
 * ...
 * @author Karaidon
 */
 
class Xbox360Gamepad
{
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
	
	public static inline var LEFT_STICK_THRESHOLD:Int = 7849;
	public static inline var RIGHT_STICK_THRESHOLD:Int = 8689;
	public static inline var TRIGGER_THRESHOLD = 52;
	
	public static var buttons:Array<Int> =
	[Xbox360Gamepad.A, Xbox360Gamepad.B,
	Xbox360Gamepad.X, Xbox360Gamepad.Y,
	Xbox360Gamepad.DPAD_UP, Xbox360Gamepad.DPAD_DOWN,
	Xbox360Gamepad.DPAD_LEFT, Xbox360Gamepad.DPAD_RIGHT,
	Xbox360Gamepad.START, Xbox360Gamepad.BACK,
	Xbox360Gamepad.LEFT_THUMB, Xbox360Gamepad.RIGHT_THUMB,
	Xbox360Gamepad.LEFT_SHOULDER, Xbox360Gamepad.RIGHT_SHOULDER];
}
 
class ControllerInput
{
	private static var controllers:Array<GameController>;
	private static var indexArray:Array<Int> = [0, 1, 2, 3];
	
	/**
	 * Loads the hXInput DLL and initalizes the controllers.
	 */
	public static function initialize():Void
	{
		XInput.initialize();	
		
		var controlTypes:Array<ControlType> = [ControlType.left, ControlType.right];
		
		controllers = new Array<GameController>();
		for (i in indexArray.iterator())
		{
			controllers[i] = new GameController(Xbox360Gamepad.buttons, controlTypes, controlTypes, i, ControllerType.xInput);
		}
		
	}
	
	/**
	 * Updates all active controllers.
	 */
	public static function update():Void
	{
		for (i in controllers.iterator())
		{
			i.update();
		}
	}
	
	/**
	 * Checks if the specified button is activated.
	 * @param	index Controller index
	 * @param	buttonId Int value representing the button.
	 * @return True if activated.
	 */
	public static function buttonCheck(index:Int, buttonId:Int):Bool
	{
		return controllers[index].buttonCheck(buttonId);
	}
	
	/**
	 * Checks if the specified button was pressed this frame.
	 * @param	index Controller index
	 * @param	buttonId Int value representing the button.
	 * @return True if pressed this frame.
	 */
	public static function buttonPressed(index:Int, buttonId:Int):Bool
	{
		return controllers[index].buttonPressed(buttonId);
	}
	
	/**
	 * Checks if the specified button was released this frame.
	 * @param	index Controller index
	 * @param	buttonId Int value representing the button.
	 * @return True if released this frame.
	 */
	public static function buttonReleased(index:Int, buttonId:Int):Bool
	{
		return controllers[index].buttonReleased(buttonId);
	}
	
	/**
	 * Gets the value of the specified trigger.
	 * @param	index Controller index
	 * @param	stick ControlType specifying which trigger.
	 * @return Value of the trigger.
	 */
	public static function getTrigger(index:Int, trigger:ControlType):Int
	{
		return controllers[index].getTrigger(trigger);
	}
	
	/**
	 * Checks if the specified stick is activated.
	 * @param	index Controller index
	 * @param	stick ControlType specifying which stick
	 * @return True if is activated.
	 */
	public static function stickCheck(index:Int, stick:ControlType):Bool
	{
		return controllers[index].stickCheck(stick);
	}
	
	/**
	 * Gets the value of the specified stick's axis.
	 * @param	index Controller index
	 * @param	stick ControlType specifying which stick.
	 * @param	axis StickAxis specifing which axis.
	 * @return Value of the stick's axis.
	 */
	public static function stickGetAxis(index:Int, stick:ControlType, axis:StickAxis):Int
	{
		return controllers[index].stickGetAxis(stick, axis);
	}
	
	/**
	 * Checks what direction the specified stick's axis is pushed towards.
	 * @param	index Controller index
	 * @param	stick ControlType specifying which stick.
	 * @param	axis StickAxis specifying which axis.
	 * @return StickDirection representing pushed direction, none if not pushed at all.
	 */
	public static function stickGetAxisDirection(index:Int, stick:ControlType, axis:StickAxis):StickDirection
	{
		return controllers[index].stickGetAxisDirection(stick, axis);
	}
	
	/**
	 * Checks if the specified stick was pressedd this frame.
	 * @param	index Controller index
	 * @param	stick ControlType specifying which stick.
	 * @return True if was pressed this frame.
	 */
	public static function stickPressed(index:Int, stick:ControlType):Bool
	{
		return controllers[index].stickPressed(stick);
	}
	
	/**
	 * Checks if the specified stick was released this frame.
	 * @param	index Controller index
	 * @param	stick ControlType specifying which stick.
	 * @return True if was released this frame.
	 */
	public static function stickReleased(index:Int, stick:ControlType):Bool
	{
		return controllers[index].stickReleased(stick);
	}
	
	/**
	 * Checks if the specified stick's axis is activated.
	 * @param	index Controller index
	 * @param	stick ControlType specifying which stick.
	 * @param	axis StickAxis representing which axis.
	 * @return True if is activated.
	 */
	public static function stickAxisCheck(index:Int, stick:ControlType, axis:StickAxis):Bool
	{
		return controllers[index].stickAxisCheck(stick, axis);
	}
	
	/**
	 * Checks if the specified stick's axis was pressed this frame.
	 * @param	index Controller index
	 * @param	stick ControlType specifying which stick.
	 * @param	axis StickAxis representing which axis.
	 * @return True if is pressed this frame.
	 */
	public static function stickAxisPressed(index:Int, stick:ControlType, axis:StickAxis):Bool
	{
		return controllers[index].stickAxisPressed(stick, axis);
	}
	
	/**
	 * Checks if the specified stick was pushed in the specified direction this frame.
	 * @param	index Controller index
	 * @param	stick ControlType specifying which stick.
	 * @param	stickDirection StickDirection specifying which direction.
	 * @return True if stick was pushed in the direction this frame.
	 */
	public static function stickDirectionPressed(index:Int, stick:ControlType, stickDirection:StickDirection):Bool
	{
		if (stickDirection == StickDirection.left || stickDirection == StickDirection.right)
		{
			return (ControllerInput.stickGetAxisDirection(index, stick, StickAxis.horizontal) == stickDirection && ControllerInput.stickAxisPressed(index, stick, StickAxis.horizontal));
		}
		else if (stickDirection == StickDirection.up || stickDirection == StickDirection.down)
		{
			return (ControllerInput.stickGetAxisDirection(index, stick, StickAxis.vertical) == stickDirection && ControllerInput.stickAxisPressed(index, stick, StickAxis.vertical));
		}
		else return false;
	}
	
	/**
	 * Checks if the specified stick's axis was released this frame.
	 * @param	index Controller index
	 * @param	stick ControlType specifying which stick.
	 * @param	axis StickAxis representing which axis.
	 * @return True is released this frame.
	 */
	public static function stickAxisReleased(index:Int, stick:ControlType, axis:StickAxis):Bool
	{
		return controllers[index].stickAxisReleased(stick, axis);
	}
	
	/**
	 * Checks if the specified trigger is activated.
	 * @param	index Controller index
	 * @param	trigger ControlType specifying which trigger.
	 * @return True if is activated.
	 */
	public static function triggerCheck(index:Int, trigger:ControlType):Bool
	{
		return controllers[index].triggerCheck(trigger);
	}
	
	/**
	 * Checks if the specified trigger was pressed this frame.
	 * @param	index Controller index
	 * @param	trigger ControlType specifying which trigger.
	 * @return True is pressed this frame.
	 */
	public static function triggerPressed(index:Int, trigger:ControlType):Bool
	{
		return controllers[index].triggerPressed(trigger);
	}
	
	/**
	 * Checks if the specified trigger was released this frame.
	 * @param	index Controller index
	 * @param	trigger ControlType specifying which trigger.
	 * @return True is released this frame.
	 */
	public static function triggerReleased(index:Int, trigger:ControlType):Bool
	{
		return controllers[index].triggerReleased(trigger);
	}
	
	/**
	 * Tells the controller to rumble.
	 * @param	index Controller index
	 * @param	left Left motor intensity
	 * @param	right Right motor intensity
	 * @param	time Time in seconds that the rumble should last.
	 */
	public static function setRumble(index:Int, left:Int, right:Int, time:Float):Void
	{
		controllers[index].setRumble(left, right, time);
	}
	
	/**
	 * Checks if the specified input is activated.
	 * @param	index Controller index
	 * @param	inputType Input to be checked.
	 * @return True is is activated.
	 */
	public static function inputCheck(index:Int, inputType:InputType):Bool
	{
		return controllers[index].inputCheck(inputType);
	}
	
	/**
	 * Checks if the specified input was pressed this frame.
	 * @param	index Controller index
	 * @param	inputType Input to be checked.
	 * @return True if pressed this frame.
	 */
	public static function inputPressed(index:Int, inputType:InputType):Bool
	{
		return controllers[index].inputPressed(inputType);
	}
	
	/**
	 * Checks if the specified input was released this frame.
	 * @param	index Controller index
	 * @param	inputType Input to be checked.
	 * @return True if released this frame.
	 */
	public static function inputReleased(index:Int, inputType:InputType):Bool
	{
		return controllers[index].inputReleased(inputType);
	}
	
	/**
	 * Gets the first checked strigger that is activated.
	 * @param	index Controller index
	 * @return InputType representing activated trigger.
	 */
	public static function getFirstTrigger(index:Int):InputType
	{
		return controllers[index].getFirstTrigger();
	}
	
	/**
	 * Gets the first checked button that is activated.
	 * @param	index Controller index
	 * @return InputType representing activated button.
	 */
	public static function getFirstButton(index:Int):InputType
	{
		return controllers[index].getFirstButton();
	}
	
	/**
	 * Gets the first checked stick that is activated.
	 * @param	index Controller index
	 * @return InputType representing activated input.
	 */
	public static function getFirstStick(index:Int):InputType
	{
		return controllers[index].getFirstStick();
	}
	
	/**
	 * Gets the first checked input that is activated.
	 * @param	index Controller index
	 * @return InputType representing activated input.
	 */
	public static function getFirstInput(index:Int):InputType
	{
		return controllers[index].getFirstInput();
	}
	
	/**
	 * Checks what buttons have been activated by the player.
	 * @param	index Controller index
	 * @return Array of InputType enums representing activated buttons.
	 */
	public static function getAllPushedButtons(index:Int):Array<InputType>
	{
		return controllers[index].getAllPushedButtons();
	}
	
	/**
	 * Checks what triggers have been activated by the player.
	 * @param	index Controller index
	 * @return Array of InputType enums representing activated triggers.
	 */
	public static function getAllPushedTriggers(index:Int):Array<InputType>
	{
		return controllers[index].getAllPushedTriggers();
	}
	
	/**
	 * Checks what sticks have been activated by the player.
	 * @param	index Controller index
	 * @return Array of InputType enums representing activated sticks.
	 */
	public static function getAllPushedSticks(index:Int):Array<InputType>
	{
		return controllers[index].getAllPushedSticks();
	}
	
	/**
	 * Checks what inputs have been activated by the player.
	 * @param	index Controller index
	 * @return Array of InputType enums representing activated inputs.
	 */
	public static function getAllPushedInputs(index:Int):Array<InputType>
	{
		return controllers[index].getAllPushedInputs();
	}
	
	/**
	 * Sets which controllers should be used.
	 * Unused controllers will not be polled and user input on that controller will be ignored.
	 * @param	state A 4-element array specifying whether that controller should be used. E.g. [true,true,false,true] means player 3 is disabled.
	 */
	public static function setControllersUsageState(state:Array<Bool>):Void
	{
		for (i in indexArray.iterator())
		{
			if (controllers[i] != null)
			{
				controllers[i].setUsageState(state[i]);
			}
		}
	}
	/**
	 * Checks which controllers are actively used.
	 * Unused controllers will not be polled and user input on that controller will be ignored.
	 * @return A 4-element array specifying whether that controller is used. E.g. [true,true,false,true] means player 3 is disabled.
	 */
	public static function getControllersUsageState():Array<Bool>
	{
		var usageStates:Array<Bool> = [false, false, false, false];
		for (i in indexArray.iterator())
		{
			if (controllers[i] != null)
			{
				usageStates[i] = controllers[i].isUsed;
			}
		}
		
		return usageStates;
	}
	
	/**
	 * Gets the threshold value of a trigger/stick required for input to be registered.
	 * Lower values are more sensitive but may register false positives.
	 * @param	index Controller index
	 * @param	inputType InputType to check. InputType.button will return 0.
	 * @param	stickAxis If input is a stick, which axis to get threshold for.
	 * @return Threshold of specified input.
	 */
	public static function getThreshold(index:Int, inputType:InputType, stickAxis:StickAxis):Int
	{
		return controllers[index].getThreshold(inputType, stickAxis);
	}
	
	/**
	 * Sets the threshold value of a trigger/stick required for input to be registered.
	 * @param	index Controller index
	 * @param	inputType InputType to set. InputType.button will be ignored.
	 * @param	stickAxis If input to set is a stick, which axis to set threshold for.
	 * @param	value new threshold value
	 */
	public static function setThreshold(index:Int, inputType:InputType, stickAxis:StickAxis, value:Int):Void
	{
		controllers[index].setThreshold(inputType, stickAxis, value);
	}
	
	/**
	 * Checks if a controller was disconnected this frame.
	 * Do not call this function before calling update().
	 * @param	index The index of the controller to check.
	 * @return True if disconnected this frame.
	 */
	public static function wasDisconnected(index:Int):Bool
	{
		return controllers[index].disconnected;
	}
	
	/**
	 * Checks if a controller was connected this frame.
	 * @param	index The index of the controller to check.
	 * @return True is connected this frame.
	 */
	public static function wasConnected(index:Int):Bool
	{
		return controllers[index].connected;
	}
	
	/**
	 * Checks if the a controller is connected.
	 * @param	index Controller index
	 * @return True if connected.
	 */
	public static function isConnected(index:Int):Bool
	{
		return controllers[index].enabled;
	}
}