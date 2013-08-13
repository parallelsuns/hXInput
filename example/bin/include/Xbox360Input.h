#ifndef INCLUDED_Xbox360Input
#define INCLUDED_Xbox360Input

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS0(Xbox360Input)


class Xbox360Input_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef Xbox360Input_obj OBJ_;
		Xbox360Input_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< Xbox360Input_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~Xbox360Input_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("Xbox360Input"); }

		static Dynamic dll_setRumble; /* REM */ 
		static Dynamic dll_leftTrigger; /* REM */ 
		static Dynamic dll_rightTrigger; /* REM */ 
		static Dynamic dll_leftThumbX; /* REM */ 
		static Dynamic dll_leftThumbY; /* REM */ 
		static Dynamic dll_rightThumbX; /* REM */ 
		static Dynamic dll_rightThumbY; /* REM */ 
		static Dynamic dll_getButtonState; /* REM */ 
		static Dynamic dll_checkButton; /* REM */ 
		static Dynamic dll_getCtrlState; /* REM */ 
		static int DPAD_UP; /* REM */ 
		static int DPAD_DOWN; /* REM */ 
		static int DPAD_LEFT; /* REM */ 
		static int DPAD_RIGHT; /* REM */ 
		static int START; /* REM */ 
		static int BACK; /* REM */ 
		static int LEFT_THUMB; /* REM */ 
		static int RIGHT_THUMB; /* REM */ 
		static int LEFT_SHOULDER; /* REM */ 
		static int RIGHT_SHOULDER; /* REM */ 
		static int A; /* REM */ 
		static int B; /* REM */ 
		static int X; /* REM */ 
		static int Y; /* REM */ 
		static int setRumble( hx::Null< int >  index,hx::Null< int >  left,hx::Null< int >  right);
		static Dynamic setRumble_dyn();

		static int leftTrigger( int index);
		static Dynamic leftTrigger_dyn();

		static int rightTrigger( int index);
		static Dynamic rightTrigger_dyn();

		static int leftThumbX( int index);
		static Dynamic leftThumbX_dyn();

		static int rightThumbX( int index);
		static Dynamic rightThumbX_dyn();

		static int leftThumbY( int index);
		static Dynamic leftThumbY_dyn();

		static int rightThumbY( int index);
		static Dynamic rightThumbY_dyn();

		static int getButtonState( int index);
		static Dynamic getButtonState_dyn();

		static bool checkButton( int index,int button);
		static Dynamic checkButton_dyn();

		static bool getCtrlState( int index);
		static Dynamic getCtrlState_dyn();

};


#endif /* INCLUDED_Xbox360Input */ 
