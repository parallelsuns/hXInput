package hxinput.controller;

/**
 * ...
 * @author Karaidon
 */

enum InputType
{
	button(id:Int);
	stick(controlType:ControlType);
	trigger(controlType:ControlType);
}