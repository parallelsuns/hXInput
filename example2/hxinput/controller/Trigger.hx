package hxinput.controller;
import hxinput.XInput;
import hxinput.ControllerInput;

/**
 * ...
 * @author Karaidon
 */
 
class Trigger extends Button
{

	public var resolution:Int = 256;
	public var threshold:Int;
	public var type:ControlType;
	
	public function new(parentController:GameController, controlType:ControlType, triggerRes:Int = 256)
	{
		type = controlType;
		resolution = triggerRes;
		threshold = Xbox360Gamepad.TRIGGER_THRESHOLD;
		super(parentController, -1);
	}
	
	override public function update():Void
	{
		var triggerValue:Int = 0;
		var triggerState:Bool = false;
		if (parent.type == ControllerType.xInput) 
		{
			if (type == ControlType.left) triggerValue = XInput.leftTrigger(parent.index);
			else if (type == ControlType.right) triggerValue = XInput.rightTrigger(parent.index);
		}
		
		if (triggerValue >= threshold) triggerState = true;
		else triggerState = false;
		
		updateState(triggerState);
	}
	
	
	public function getTrigger():Int
	{
		var triggerValue:Int = 0;
		if (parent.type == ControllerType.xInput) 
		{
			if (type == ControlType.left) triggerValue = XInput.leftTrigger(parent.index);
			else if (type == ControlType.right) triggerValue = XInput.rightTrigger(parent.index);
		}
		
		return triggerValue;
	}
	
	public function getThreshold():Int
	{
		return threshold;
	}
	
	public function setThreshold(value:Int):Void
	{
		threshold = value;
	}
}