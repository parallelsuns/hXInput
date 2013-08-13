package;

import Xbox360Input;
/**
 * ...
 * @author Karaidon
 */

class Main 
{
	/**
	 * The sticks have deadzones. They will not register 0 even if not touched.
	 * This var prvents falsely registering input when there is none.
	 */
	private static inline var stickThreshold:Int = 8500;
	
	/**
	 * The triggers have deadzones. They will not register 0 even if not touched.
	 * This var prvents falsely registering input when there is none.
	 */
	private static inline var triggerThreshold:Int = 50;
	
	static function main() 
	{
		Sys.println("hXInput Controller Test");
		Sys.println("");
		Sys.println("Press a button, pull a trigger, move a stick to read its value.");
		Sys.println("Pulling a trigger activates the corresponding rumble motor.");
		Sys.println("");
		Sys.println("Note: Right motor vibrates at a higher freq than the left motor.");
		Sys.println("You can only control rumble intensity, not frequency.");
		Sys.println("");
		Sys.println("");
		
		while (true)
		{
			var intI:IntIter = new IntIter(0, 4);
			for (i in intI)
			{
				if (Xbox360Input.getCtrlState(i) == true)
				{
					if (Xbox360Input.checkButton(i, Xbox360Input.A)) Sys.println("Player " + Std.string(Std.string(i+1)) + ": " + "A pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.B)) Sys.println("Player " + Std.string(i+1) + ": " + "B pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.X)) Sys.println("Player " + Std.string(i+1) + ": " + "X pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.Y)) Sys.println("Player " + Std.string(i+1) + ": " + "Y pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.DPAD_UP)) Sys.println("Player " + Std.string(i+1) + ": " + "DPAD_UP pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.DPAD_DOWN)) Sys.println("Player " + Std.string(i+1) + ": " + "DPAD_DOWN pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.DPAD_LEFT)) Sys.println("Player " + Std.string(i+1) + ": " + "DPAD_LEFT pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.DPAD_RIGHT)) Sys.println("Player " + Std.string(i+1) + ": " + "DPAD_RIGHT pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.BACK)) Sys.println("Player " + Std.string(i+1) + ": " + "BACK pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.START)) Sys.println("Player " + Std.string(i+1) + ": " + "START pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.RIGHT_SHOULDER)) Sys.println("Player " + Std.string(i+1) + ": " + "RIGHT_SHOULDER pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.LEFT_SHOULDER)) Sys.println("Player " + Std.string(i+1) + ": " + "LEFT_SHOULDER pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.RIGHT_THUMB)) Sys.println("Player " + Std.string(i+1) + ": " + "RIGHT_THUMB pressed.");
					if (Xbox360Input.checkButton(i, Xbox360Input.LEFT_THUMB)) Sys.println("Player " + Std.string(i+1) + ": " + "LEFT_THUMB pressed.");
					
					if (Math.abs(Xbox360Input.rightThumbX(i)) >= stickThreshold) Sys.println("Player " + Std.string(i+1) + ": " + "RIGHT_THUMB_X: " + Xbox360Input.rightThumbX(i));
					if (Math.abs(Xbox360Input.rightThumbY(i)) >= stickThreshold) Sys.println("Player " + Std.string(i+1) + ": " + "RIGHT_THUMB_X: " + Xbox360Input.rightThumbY(i));
					if (Math.abs(Xbox360Input.leftThumbX(i)) >= stickThreshold) Sys.println("Player " + Std.string(i+1) + ": " + "RIGHT_THUMB_X: " + Xbox360Input.leftThumbX(i));
					if (Math.abs(Xbox360Input.leftThumbY(i)) >= stickThreshold) Sys.println("Player " + Std.string(i+1) + ": " + "RIGHT_THUMB_X: " + Xbox360Input.leftThumbY(i));
					
					if (Xbox360Input.rightTrigger(i) >= triggerThreshold) Sys.println("Player " + Std.string(i+1) + ": " + "RIGHT_TRIGGER: " + Xbox360Input.rightTrigger(i));
					if (Xbox360Input.leftTrigger(i) >= triggerThreshold) Sys.println("Player " + Std.string(i+1) + ": " + "LEFT_TRIGGER: " + Xbox360Input.leftTrigger(i));
					Xbox360Input.setRumble(i, Xbox360Input.leftTrigger(i)*256, Xbox360Input.rightTrigger(i)*256);
				}
			}
			Sys.sleep(0.1);
		}
	}
}