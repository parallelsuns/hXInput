package hxinput.controller;
import hxinput.XInput;
import hxinput.ControllerInput;
/**
 * ...
 * @author Karaidon
 */
 
class Axis
{
	public var state:ButtonState;
	
	public function new()
	{
		state = ButtonState.off;
	}
}

class Stick extends Button
{
	public var resolution:Int = 65536;
	
	private var horizontal:Axis;
	private var vertical:Axis;
	
	public var type:ControlType;
	
	public function new(parentController:GameController, controlType:ControlType, triggerRes:Int = 65536)
	{
		horizontal = new Axis();
		vertical = new Axis();
		
		resolution = triggerRes;
		
		type = controlType;
		if (type == ControlType.left) 
		{
			horizontal.threshold = Xbox360Gamepad.LEFT_STICK_THRESHOLD;
			vertical.threshold = Xbox360Gamepad.LEFT_STICK_THRESHOLD;
		}
		else 
		{
			vertical.threshold = Xbox360Gamepad.RIGHT_STICK_THRESHOLD;
			horizontal.threshold = Xbox360Gamepad.RIGHT_STICK_THRESHOLD;
		}
		
		super(parentController, -1);
	}
	
	override public function update():Void
	{
		var horizontalValue:Int = 0;
		var horizontalState:Bool = false;
		
		var verticalValue:Int = 0;
		var verticalState:Bool = false;
		
		var overallState:Bool = false;
		
		if (parent.type == ControllerType.xInput) 
		{
			if (type == ControlType.left) 
			{
				horizontalValue = XInput.leftThumbX(parent.index);
				verticalValue = XInput.leftThumbY(parent.index);
			}
			else if (type == ControlType.right)
			{
				horizontalValue = XInput.rightThumbX(parent.index);
				verticalValue = XInput.rightThumbY(parent.index);
			}
		}
		
		if (Math.abs(horizontalValue) >= horizontal.threshold) horizontalState = true;
		else horizontalState = false;
		
		if (Math.abs(verticalValue) >= vertical.threshold) verticalState = true;
		else verticalState = false;
		
		if (horizontalState == true || verticalState == true) overallState = true;
		else overallState = false;
		
		updateStickState(overallState, horizontalState, verticalState);
	}
	
	public function axisCheck(axis:StickAxis):Bool
	{
		if (axis == StickAxis.vertical)
		{
			if (vertical.state == ButtonState.pressed || vertical.state == ButtonState.on) return true;
			else return false;
		}
		else if (axis == StickAxis.horizontal)
		{
			if (horizontal.state == ButtonState.pressed || vertical.state == ButtonState.on) return true;
			else return false;
		}
		else return false;
	}
	
	public function axisPressed(axis:StickAxis):Bool
	{
		if (axis == StickAxis.vertical)
		{
			if (vertical.state == ButtonState.pressed) return true;
			else return false;
		}
		else if (axis == StickAxis.horizontal)
		{
			if (horizontal.state == ButtonState.pressed) return true;
			else return false;
		}
		else return false;
	}
	
	public function axisReleased(axis:StickAxis):Bool
	{
		if (axis == StickAxis.vertical)
		{
			if (vertical.state == ButtonState.released) return true;
			else return false;
		}
		else if (axis == StickAxis.horizontal)
		{
			if (horizontal.state == ButtonState.released) return true;
			else return false;
		}
		else return false;
	}
	
	public function getAxis(axis:StickAxis):Int
	{
		var value:Int = 0;
		if (parent.type == ControllerType.xInput) 
		{
			if (type == ControlType.left) 
			{
				if (axis == StickAxis.horizontal) value = XInput.leftThumbX(parent.index);
				else if (axis == StickAxis.vertical) value =  XInput.leftThumbY(parent.index);
			}
			else if (type == ControlType.right) 
			{
				if (axis == StickAxis.horizontal) value = XInput.rightThumbX(parent.index);
				else if (axis == StickAxis.vertical) value =  XInput.rightThumbY(parent.index);
			}
		}
		
		return value;
	}
	
	public function getDirection(axis:StickAxis):StickDirection
	{
		var value:Int = 0;
		
		if (axis == StickAxis.horizontal)
		{
			if (parent.type == ControllerType.xInput) 
			{
				if (type == ControlType.left) value = XInput.leftThumbX(parent.index);
				else if (type == ControlType.right) value = XInput.rightThumbX(parent.index);
			}
			
			if (value >= horizontal.threshold) return StickDirection.right;
			else if (value <= -horizontal.threshold) return StickDirection.left;
			else return StickDirection.none;
		}
		else if (axis == StickAxis.vertical)
		{
			if (parent.type == ControllerType.xInput) 
			{
				if (type == ControlType.left) value = XInput.leftThumbY(parent.index);
				else if (type == ControlType.right) value = XInput.rightThumbY(parent.index);
			}
			
			if (value >= vertical.threshold) return StickDirection.up;
			else if (value <= -vertical.threshold) return StickDirection.down;
			else return StickDirection.none;
		}
		else return StickDirection.none;
	}
	
	public function getHorizontalDirection():StickDirection
	{
		var horizontalValue:Int = 0;
		if (parent.type == ControllerType.xInput) 
		{
			if (type == ControlType.left) horizontalValue = XInput.leftThumbX(parent.index);
			else if (type == ControlType.right) horizontalValue = XInput.rightThumbX(parent.index);
		}
		
		if (horizontalValue >= horizontal.threshold) return StickDirection.right;
		else if (horizontalValue <= -horizontal.threshold) return StickDirection.left;
		else return StickDirection.none;
	}
	
	public function getVerticalDirection():StickDirection
	{
		var verticalValue:Int = 0;
		if (parent.type == ControllerType.xInput) 
		{
			if (type == ControlType.left) verticalValue = XInput.leftThumbY(parent.index);
			else if (type == ControlType.right) verticalValue = XInput.rightThumbY(parent.index);
		}
		
		if (verticalValue >= vertical.threshold) return StickDirection.up;
		else if (verticalValue <= -vertical.threshold) return StickDirection.down;
		else return StickDirection.none;
	}
	
	private function updateStickState(overallState:Bool = false, horizontalState:Bool = false, verticalState:Bool = false):Void
	{
		super.updateState(overallState);
		horizontal.state = updatedAxisState(horizontalState, horizontal);
		vertical.state = updatedAxisState(verticalState, vertical);
	}

	private function updatedAxisState(axisState:Bool = false, axis:Axis):ButtonState
	{
		if (axisState == true)
		{
			switch (axis.state)
			{
				case ButtonState.pressed:
				return ButtonState.on;
				
				case ButtonState.on:
				return ButtonState.on;
				
				case ButtonState.released:
				return ButtonState.pressed;
				
				case ButtonState.off:
				return ButtonState.pressed;
				
				default:
				return ButtonState.on;
			}
		}
		else
		{
			switch (axis.state)
			{
				case ButtonState.pressed:
				return ButtonState.released;
				
				case ButtonState.on:
				return ButtonState.released;
				
				case ButtonState.released:
				return ButtonState.off;
				
				case ButtonState.off:
				return ButtonState.off;
				
				default:
				return ButtonState.off;
			}
		}
	}
	
	public function getThreshold(stickAxis:StickAxis):Int
	{
		if (stickAxis == StickAxis.horizontal) return horizontal.threshold;
		else if (stickAxis == StickAxis.vertical) return vertical.threshold;
		else return 0;
	}
	
	public function setThreshold(stickAxis:StickAxis, value:Int):Void
	{
		if (stickAxis == StickAxis.horizontal) horizontal.threshold = value;
		else if (stickAxis == StickAxis.vertical) vertical.threshold = value;
	}
	
	override public function reset():Void
	{
		super.reset();
		horizontal.state = ButtonState.off;
		vertical.state = ButtonState.off;
	}
}
