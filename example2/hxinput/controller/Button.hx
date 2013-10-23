package hxinput.controller;
import hxinput.XInput;

/**
 * ...
 * @author Karaidon
 */
 
class Button 
{
	
	private var parent:GameController;
	private var state:ButtonState;
	public var id:Int = 0;
	
	public function new(parentController:GameController, buttonId:Int = -1)
	{
		parent = parentController;
		id = buttonId;
		state = ButtonState.off;
	}
	
	public function update():Void
	{
		var buttonState:Bool = false;
		
		if (parent.type == ControllerType.xInput) buttonState = XInput.checkButton(parent.index, id);
		else buttonState = XInput.checkButton(parent.index, id);
		
		updateState(buttonState);
	}
	
	public function pressed():Bool
	{
		if (state == ButtonState.pressed) return true;
		else return false;
	}
	
	public function released():Bool
	{
		if (state == ButtonState.released) return true;
		else return false;
	}
	
	public function check():Bool
	{
		if (state == ButtonState.pressed || state == ButtonState.on) return true;
		else return false;
	}
	
	private function updateState(buttonState:Bool = false):Void
	{
		if (buttonState == true)
		{
			switch (state)
			{
				case ButtonState.pressed:
				state = ButtonState.on;
				
				case ButtonState.on:
				state = ButtonState.on;
				
				case ButtonState.released:
				state = ButtonState.pressed;
				
				case ButtonState.off:
				state = ButtonState.pressed;
				
				default:
				state = ButtonState.on;
			}
		}
		else
		{
			switch (state)
			{
				case ButtonState.pressed:
				state = ButtonState.released;
				
				case ButtonState.on:
				state = ButtonState.released;
				
				case ButtonState.released:
				state = ButtonState.off;
				
				case ButtonState.off:
				state = ButtonState.off;
				
				default:
				state = ButtonState.off;
			}
		}
	}
	
	public function reset():Void
	{
		state = ButtonState.off;
	}
}