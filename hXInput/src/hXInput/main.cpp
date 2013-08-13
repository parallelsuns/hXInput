/**
hXInput
Wrapper DLL for XInput, providing native support for Xbox 360 gamepads on Windows in Haxe.
-Karaidon (www.karaidon.com)
**/
#define IMPLEMENT_API
#include <C:/Motion-Twin/Haxe/lib/hxcpp/3,0,0/include/hx/CFFI.h>

#include <windows.h>
#include <XInput.h>
#pragma comment(lib, "XInput.lib")
#define EXPORTREAL extern "C" __declspec(dllexport) double __cdecl
#define EXPORTSTRING extern "C" __declspec(dllexport) LPSTR __cdecl

//index: 0 = player 1, 1 = player 2, 2 = player 3, 4 = player 4

//XInput Api Constants, easier to just redefine them in Haxe
//LEFT_THUMB_DEADZONE  7849
//RIGHT_THUMB_DEADZONE 8689
//TRIGGER_THRESHOLD    30

//left, right: 0 = no rumble, 65535 = full rumble
static value setRumble(value index, value left, value right)
{
	XINPUT_VIBRATION vibration;

	if (val_is_int(left)) vibration.wLeftMotorSpeed = (double)val_int(left);
	else vibration.wLeftMotorSpeed = 0;

	if (val_is_int(right)) vibration.wRightMotorSpeed = (double)val_int(right);
	else vibration.wRightMotorSpeed = 0;

	if (val_is_int(index)) XInputSetState((double)val_int(index),&vibration);

	return alloc_int(val_int(index));
}

//0 = released, 255 = full pull
static value leftTrigger(value index)
{
	XINPUT_STATE state;

	if (val_is_int(index)) 
	{
		XInputGetState((double)val_int(index),&state);
		return alloc_int((int)state.Gamepad.bLeftTrigger);
	}
	else return alloc_int(0);
}

//0 = released, 255 = full pull
static value rightTrigger(value index)
{
	XINPUT_STATE state;

	if (val_is_int(index)) 
	{
		XInputGetState((double)val_int(index),&state);
		return alloc_int((int)state.Gamepad.bRightTrigger);
	}
	else return alloc_int(0);
}

//left = -32768, right = 32767
static value leftThumbX(value index)
{
	XINPUT_STATE state;
	
	if (val_is_int(index))
	{
		XInputGetState((double)val_int(index),&state);
		return alloc_int((int)state.Gamepad.sThumbLX);
	}
	else return alloc_int(0);
}

//bottom = -32768, top = 32767
static value leftThumbY(value index)
{
	XINPUT_STATE state;
	
	if (val_is_int(index))
	{
		XInputGetState((double)val_int(index),&state);
		return alloc_int((int)state.Gamepad.sThumbLY);
	}
	else return alloc_int(0);
}

//left = -32768, right = 32767
static value rightThumbX(value index)
{
	XINPUT_STATE state;
	
	if (val_is_int(index))
	{
		XInputGetState((double)val_int(index),&state);
		return alloc_int((int)state.Gamepad.sThumbRX);
	}
	else return alloc_int(0);
}

//bottom = -32768, top = 32767
static value rightThumbY(value index)
{
	XINPUT_STATE state;
	
	if (val_is_int(index))
	{
		XInputGetState((double)val_int(index),&state);
		return alloc_int((int)state.Gamepad.sThumbRY);
	}
	else return alloc_int(0);
}

//returns a bitmask of the diff button states.
//http://msdn.microsoft.com/en-us/library/windows/desktop/microsoft.directx_sdk.reference.xinput_gamepad(v=vs.85).aspx
//example:
// if (getButtonState(0) & 0x8000 != 0) Y pressed
// else Y not pressed
//Much easier to just use CheckButton, refer below for the hex values
static value getButtonState(value index)
{
	XINPUT_STATE state;
	if (val_is_int(index))
	{
		XInputGetState((double)val_int(index),&state);
		return alloc_int((int)state.Gamepad.wButtons);
	}
	else return alloc_int(0);
}

/**
button:
returns 1 if pressed down, else returns 0
DPAD_UP          0x0001
DPAD_DOWN        0x0002
DPAD_LEFT        0x0004
DPAD_RIGHT       0x0008
START            0x0010
BACK             0x0020
LEFT_THUMB       0x0040
RIGHT_THUMB      0x0080
LEFT_SHOULDER    0x0100
RIGHT_SHOULDER   0x0200
A                0x1000
B                0x2000
X                0x4000
Y                0x8000
**/
static value checkButton(value index, value button)
{
	WORD buttonWord;
	XINPUT_STATE state;

	if (val_is_int(button)) buttonWord = (double)val_int(button);
	else buttonWord = 0;

	if (val_is_int(index))
	{
		XInputGetState((double)val_int(index),&state);
		return alloc_int((state.Gamepad.wButtons & buttonWord) ? 1 : 0);
	}
	else return 0;
}

//returns 1167 if not connected, else returns 0
static value getCtrlState(value index)
{
	XINPUT_STATE state;

	return alloc_int((int)XInputGetState((double)val_int(index),&state));
}

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
					 )
{
	XINPUT_VIBRATION vibration;

	vibration.wLeftMotorSpeed = 0;
	vibration.wRightMotorSpeed = 0;

	XInputSetState(0,&vibration);

	return TRUE;
}

DEFINE_PRIM (rightThumbX, 1);
DEFINE_PRIM (setRumble, 3);
DEFINE_PRIM (leftTrigger, 1);
DEFINE_PRIM (rightTrigger, 1);
DEFINE_PRIM (leftThumbX, 1);
DEFINE_PRIM (leftThumbY, 1);
DEFINE_PRIM (rightThumbY, 1);
DEFINE_PRIM (getButtonState, 1);
DEFINE_PRIM (checkButton, 2);
DEFINE_PRIM (getCtrlState, 1);