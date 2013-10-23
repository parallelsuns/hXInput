package hxinput.controller;

/**
 * ...
 * @author Karaidon
 */

enum ButtonState
{
	pressed; // Button was pressed this frame
	on; //Button was not pressed this frame but is held down
	released; //Button was released this frame
	off; //Button is not held down and was not released this frame
}