package hxinput.controller;
import hxinput.XInput;

/**
 * ...
 * @author Karaidon
 */
 
class GameController 
{

	public var index:Int;
	public var type:ControllerType;
	public var enabled:Bool;
	public var isUsed:Bool;
	
	private var buttons:Array<Button>;
	private var sticks:Array<Stick>;
	private var triggers:Array<Trigger>;
	
	private var rumbleTime:Float = 0;
	private var rumbleTimer:Float = 0;
	private var leftRumbleValue:Int = 0;
	private var rightRumbleValue:Int = 0;
	private var rumbleTimeStore:Float = 0;
	
	public var disconnected:Bool = false;
	public var connected:Bool = false;
	
	public function new(buttonIds:Array<Int>, triggerTypes:Array<ControlType>, stickTypes:Array<ControlType>, controllerIndex:Int, controllerType:ControllerType) 
	{
		index = controllerIndex;
		type = controllerType;
		
		buttons = new Array<Button>();
		sticks = new Array<Stick>();
		triggers = new Array<Trigger>();
		
		for (i in buttonIds.iterator())
		{
			buttons.push(new Button(this, i));
		}
		
		for (i in triggerTypes.iterator())
		{
			triggers.push(new Trigger(this, i));
		}
		
		for (i in stickTypes.iterator())
		{
			sticks.push(new Stick(this, i));
		}
	}
	
	public function update():Void
	{
		disconnected = false;
		connected = false;
		
		if (isUsed == false) return;
		
		var enabledStore:Bool = enabled;
		pollController();
		if (enabledStore != enabled)
		{
			if (enabled == true) connected = true;
			else disconnected = true;
		}
		
		if (enabled == false) return;
		
		if (rumbleTime > 0)
		{
			rumbleTimer = RumbleTimer.getNewTime(rumbleTimeStore,rumbleTimer);
			if (rumbleTimer >= rumbleTime)
			{
				XInput.setRumble(index, 0 , 0);
				rumbleTimer = 0;
				rumbleTime = 0;
				leftRumbleValue = 0;
				rightRumbleValue = 0;
			}
		}
		
		for (i in buttons.iterator())
		{
			i.update();
		}
		for (i in sticks.iterator())
		{
			i.update();
		}
		for (i in triggers.iterator())
		{
			i.update();
		}
	}
	
	public function setRumble(left:Int, right:Int, time:Float):Void
	{
		XInput.setRumble(index, left, right);
		leftRumbleValue = left;
		rightRumbleValue = right;
		rumbleTime = time;
		rumbleTimer = 0;
		rumbleTimeStore = RumbleTimer.getStartTime();
	}
	
	public function buttonCheck(buttonId:Int):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in buttons.iterator())
		{
			if (i.id == buttonId)
			{
				return i.check();
			}
		}
		return false;
	}
	
	public function buttonPressed(buttonId:Int):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in buttons.iterator())
		{
			if (i.id == buttonId)
			{
				return i.pressed();
			}
		}
		return false;
	}
	
	public function buttonReleased(buttonId:Int):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in buttons.iterator())
		{
			if (i.id == buttonId)
			{
				return i.released();
			}
		}
		return false;
	}
	
	public function stickCheck(controlType:ControlType):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in sticks.iterator())
		{
			if (i.type == controlType)
			{
				return i.check();
			}
		}
		return false;
	}
	
	public function stickPressed(controlType:ControlType):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in sticks.iterator())
		{
			if (i.type == controlType)
			{
				return i.pressed();
			}
		}
		return false;
	}
	
	public function stickReleased(controlType:ControlType):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in sticks.iterator())
		{
			if (i.type == controlType)
			{
				return i.released();
			}
		}
		return false;
	}
	
	public function stickAxisCheck(controlType:ControlType, axis:StickAxis):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in sticks.iterator())
		{
			if (i.type == controlType)
			{
				return i.axisCheck(axis);
			}
		}
		return false;
	}
	
	public function stickAxisPressed(controlType:ControlType, axis:StickAxis):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in sticks.iterator())
		{
			if (i.type == controlType)
			{
				return i.axisPressed(axis);
			}
		}
		return false;
	}
	
	public function stickAxisReleased(controlType:ControlType, axis:StickAxis):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in sticks.iterator())
		{
			if (i.type == controlType)
			{
				return i.axisReleased(axis);
			}
		}
		return false;
	}
	
	public function stickGetAxis(controlType:ControlType, axis:StickAxis):Int
	{
		if (isUsed == false || enabled == false) return 0;
		for (i in sticks.iterator())
		{
			if (i.type == controlType)
			{
				return i.getAxis(axis);
			}
		}
		return 0;
	}
	
	public function stickGetAxisDirection(controlType:ControlType, axis:StickAxis):StickDirection
	{
		if (isUsed == false || enabled == false) return StickDirection.none;
		for (i in sticks.iterator())
		{
			if (i.type == controlType)
			{
				return i.getDirection(axis);
			}
		}
		return StickDirection.none;
	}
	
	public function triggerCheck(controlType:ControlType):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in triggers.iterator())
		{
			if (i.type == controlType)
			{
				return i.check();
			}
		}
		return false;
	}
	
	public function triggerPressed(controlType:ControlType):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in triggers.iterator())
		{
			if (i.type == controlType)
			{
				return i.pressed();
			}
		}
		return false;
	}
	
	public function triggerReleased(controlType:ControlType):Bool
	{
		if (isUsed == false || enabled == false) return false;
		for (i in triggers.iterator())
		{
			if (i.type == controlType)
			{
				return i.released();
			}
		}
		return false;
	}
	
	public function getTrigger(controlType:ControlType):Int
	{
		if (isUsed == false || enabled == false) return 0;
		for (i in triggers.iterator())
		{
			if (i.type == controlType)
			{
				return i.getTrigger();
			}
		}
		return 0;
	}
	
	public function setUsageState(state:Bool):Void
	{
		isUsed = state;
		if (state == false)
		{
			XInput.setRumble(index, 0, 0);
			rumbleTime = 0;
			rumbleTimer = 0;
			leftRumbleValue = 0;
			rightRumbleValue = 0;
			for (i in buttons.iterator())
			{
				i.reset();
			}
			for (i in triggers.iterator())
			{
				i.reset();
			}
			for (i in sticks.iterator())
			{
				i.reset();
			}
		}
	}
	
	public function inputCheck(inputType:InputType):Bool
	{
		if (Type.enumEq(inputType, InputType.stick(ControlType.left)))
		{
			for (i in sticks.iterator())
			{
				if (i.type == ControlType.left)
				{
					return i.check();
				}
			}
			return false;
		}
		else if (Type.enumEq(inputType, InputType.stick(ControlType.right)))
		{
			for (i in sticks.iterator())
			{
				if (i.type == ControlType.right)
				{
					return i.check();
				}
			}
			return false;
		}
		else if (Type.enumEq(inputType, InputType.trigger(ControlType.left)))
		{
			for (i in triggers.iterator())
			{
				if (i.type == ControlType.left)
				{
					return i.check();
				}
			}
			return false;
		}
		else if (Type.enumEq(inputType, InputType.trigger(ControlType.right)))
		{
			for (i in triggers.iterator())
			{
				if (i.type == ControlType.right)
				{
					return i.check();
				}
			}
			return false;
		}
		else
		{
			var id:Int = -1;
			id = Type.enumParameters(inputType)[0];
			for (i in buttons.iterator())
			{
				if (i.id == id)
				{
					return i.check();
				}
			}
			return false;
		}
	}
	
	public function inputPressed(inputType:InputType):Bool
	{
		if (Type.enumEq(inputType, InputType.stick(ControlType.left)))
		{
			for (i in sticks.iterator())
			{
				if (i.type == ControlType.left)
				{
					return i.pressed();
				}
			}
			return false;
		}
		else if (Type.enumEq(inputType, InputType.stick(ControlType.right)))
		{
			for (i in sticks.iterator())
			{
				if (i.type == ControlType.right)
				{
					return i.pressed();
				}
			}
			return false;
		}
		else if (Type.enumEq(inputType, InputType.trigger(ControlType.left)))
		{
			for (i in triggers.iterator())
			{
				if (i.type == ControlType.left)
				{
					return i.pressed();
				}
			}
			return false;
		}
		else if (Type.enumEq(inputType, InputType.trigger(ControlType.right)))
		{
			for (i in triggers.iterator())
			{
				if (i.type == ControlType.right)
				{
					return i.pressed();
				}
			}
			return false;
		}
		else
		{
			var id:Int = -1;
			id = Type.enumParameters(inputType)[0];
			for (i in buttons.iterator())
			{
				if (i.id == id)
				{
					return i.pressed();
				}
			}
			return false;
		}
	}
	
	public function inputReleased(inputType:InputType):Bool
	{
		if (Type.enumEq(inputType, InputType.stick(ControlType.left)))
		{
			for (i in sticks.iterator())
			{
				if (i.type == ControlType.left)
				{
					return i.released();
				}
			}
			return false;
		}
		else if (Type.enumEq(inputType, InputType.stick(ControlType.right)))
		{
			for (i in sticks.iterator())
			{
				if (i.type == ControlType.right)
				{
					return i.released();
				}
			}
			return false;
		}
		else if (Type.enumEq(inputType, InputType.trigger(ControlType.left)))
		{
			for (i in triggers.iterator())
			{
				if (i.type == ControlType.left)
				{
					return i.released();
				}
			}
			return false;
		}
		else if (Type.enumEq(inputType, InputType.trigger(ControlType.right)))
		{
			for (i in triggers.iterator())
			{
				if (i.type == ControlType.right)
				{
					return i.released();
				}
			}
			return false;
		}
		else
		{
			var id:Int = -1;
			id = Type.enumParameters(inputType)[0];
			for (i in buttons.iterator())
			{
				if (i.id == id)
				{
					return i.released();
				}
			}
			return false;
		}
	}
	
	public function getFirstTrigger():InputType
	{
		for (i in triggers.iterator())
		{
			if (i.pressed() == true)
			{
				return InputType.trigger(i.type);
			}
		}
		return InputType.button(-1);
	}
	
	public function getFirstButton():InputType
	{
		for (i in buttons.iterator())
		{
			if (i.pressed() == true)
			{
				return InputType.button(i.id);
			}
		}
		return InputType.button(-1);
	}
	
	public function getFirstStick():InputType
	{
		for (i in sticks.iterator())
		{
			if (i.pressed() == true)
			{
				return InputType.stick(i.type);
			}
		}
		return InputType.button(-1);
	}
	
	public function getFirstInput():InputType
	{
		for (i in buttons.iterator())
		{
			if (i.check() == true)
			{
				return InputType.button(i.id);
			}
		}
		for (i in triggers.iterator())
		{
			if (i.check() == true)
			{
				return InputType.trigger(i.type);
			}
		}
		for (i in sticks.iterator())
		{
			if (i.check() == true)
			{
				return InputType.stick(i.type);
			}
		}
		return InputType.button(-1);
	}
	
	public function getAllPushedButtons():Array<InputType>
	{
		var buttonsArray:Array<InputType> = new Array<InputType>();
		for (i in buttons.iterator())
		{
			if (i.check() == true)
			{
				buttonsArray.push(InputType.button(i.id));
			}
		}
		
		return buttonsArray;
	}
	
	public function getAllPushedTriggers():Array<InputType>
	{
		var sticksArray:Array<InputType> = new Array<InputType>();
		for (i in sticks.iterator())
		{
			if (i.check() == true)
			{
				sticksArray.push(InputType.stick(i.type));
			}
		}
		
		return sticksArray;
	}
	
	public function getAllPushedSticks():Array<InputType>
	{
		var triggersArray:Array<InputType> = new Array<InputType>();
		for (i in triggers.iterator())
		{
			if (i.check() == true)
			{
				triggersArray.push(InputType.trigger(i.type));
			}
		}
		
		return triggersArray;
	}
	
	public function getAllPushedInputs():Array<InputType>
	{
		var inputsArray:Array<InputType> = new Array<InputType>();
		for (i in buttons.iterator())
		{
			if (i.check() == true)
			{
				inputsArray.push(InputType.button(i.id));
			}
		}
		for (i in triggers.iterator())
		{
			if (i.check() == true)
			{
				inputsArray.push(InputType.trigger(i.type));
			}
		}
		for (i in sticks.iterator())
		{
			if (i.check() == true)
			{
				inputsArray.push(InputType.stick(i.type));
			}
		}
		
		return inputsArray;
	}
	
	public function getThreshold(inputType:InputType, stickAxis:StickAxis):Int
	{
		if (Type.enumEq(inputType, InputType.stick(ControlType.left)))
		{
			for (i in sticks.iterator())
			{
				if (i.type == ControlType.left)
				{
					return i.getThreshold(stickAxis);
				}
			}
			return 0;
		}
		else if (Type.enumEq(inputType, InputType.stick(ControlType.right)))
		{
			for (i in sticks.iterator())
			{
				if (i.type == ControlType.right)
				{
					return i.getThreshold(stickAxis);
				}
			}
			return 0;
		}
		else if (Type.enumEq(inputType, InputType.trigger(ControlType.left)))
		{
			for (i in triggers.iterator())
			{
				if (i.type == ControlType.left)
				{
					return i.getThreshold();
				}
			}
			return 0;
		}
		else if (Type.enumEq(inputType, InputType.trigger(ControlType.right)))
		{
			for (i in triggers.iterator())
			{
				if (i.type == ControlType.right)
				{
					return i.getThreshold();
				}
			}
			return 0;
		}
		else return 0;
	}
	
	public function setThreshold(inputType:InputType, stickAxis:StickAxis, value:Int):Void
	{
		if (Type.enumEq(inputType, InputType.stick(ControlType.left)))
		{
			for (i in sticks.iterator())
			{
				if (i.type == ControlType.left)
				{
					i.setThreshold(stickAxis, value);
				}
			}
		}
		else if (Type.enumEq(inputType, InputType.stick(ControlType.right)))
		{
			for (i in sticks.iterator())
			{
				if (i.type == ControlType.right)
				{
					i.setThreshold(stickAxis, value);
				}
			}
		}
		else if (Type.enumEq(inputType, InputType.trigger(ControlType.left)))
		{
			for (i in triggers.iterator())
			{
				if (i.type == ControlType.left)
				{
					i.setThreshold(value);
				}
			}
		}
		else if (Type.enumEq(inputType, InputType.trigger(ControlType.right)))
		{
			for (i in triggers.iterator())
			{
				if (i.type == ControlType.right)
				{
					i.setThreshold(value);
				}
			}
		}
	}
	
	private function pollController():Void
	{
		enabled = XInput.getCtrlState(index);
		if (enabled == false)
		{
			rumbleTime = 0;
			rumbleTimer = 0;
			leftRumbleValue = 0;
			rightRumbleValue = 0;
			for (i in buttons.iterator())
			{
				i.reset();
			}
			for (i in triggers.iterator())
			{
				i.reset();
			}
			for (i in sticks.iterator())
			{
				i.reset();
			}
		}
	}
}