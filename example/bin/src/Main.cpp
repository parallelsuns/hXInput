#include <hxcpp.h>

#ifndef INCLUDED_IntIter
#include <IntIter.h>
#endif
#ifndef INCLUDED_Main
#include <Main.h>
#endif
#ifndef INCLUDED_hxMath
#include <hxMath.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_Sys
#include <Sys.h>
#endif
#ifndef INCLUDED_Xbox360Input
#include <Xbox360Input.h>
#endif

Void Main_obj::__construct()
{
	return null();
}

Main_obj::~Main_obj() { }

Dynamic Main_obj::__CreateEmpty() { return  new Main_obj; }
hx::ObjectPtr< Main_obj > Main_obj::__new()
{  hx::ObjectPtr< Main_obj > result = new Main_obj();
	result->__construct();
	return result;}

Dynamic Main_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Main_obj > result = new Main_obj();
	result->__construct();
	return result;}

int Main_obj::stickThreshold;

int Main_obj::triggerThreshold;

Void Main_obj::main( ){
{
		HX_STACK_PUSH("Main::main","Main.hx",24);
		HX_STACK_LINE(25)
		::Sys_obj::println(HX_CSTRING("hXInput Controller Test"));
		HX_STACK_LINE(26)
		::Sys_obj::println(HX_CSTRING(""));
		HX_STACK_LINE(27)
		::Sys_obj::println(HX_CSTRING("Press a button, pull a trigger, move a stick to read its value."));
		HX_STACK_LINE(28)
		::Sys_obj::println(HX_CSTRING("Pulling a trigger activates the corresponding rumble motor."));
		HX_STACK_LINE(29)
		::Sys_obj::println(HX_CSTRING(""));
		HX_STACK_LINE(30)
		::Sys_obj::println(HX_CSTRING("Note: Right motor vibrates at a higher freq than the left motor."));
		HX_STACK_LINE(31)
		::Sys_obj::println(HX_CSTRING("You can only control rumble intensity, not frequency."));
		HX_STACK_LINE(32)
		::Sys_obj::println(HX_CSTRING(""));
		HX_STACK_LINE(33)
		::Sys_obj::println(HX_CSTRING(""));
		HX_STACK_LINE(35)
		while((true)){
			HX_STACK_LINE(37)
			::IntIter intI = ::IntIter_obj::__new((int)0,(int)4);		HX_STACK_VAR(intI,"intI");
			HX_STACK_LINE(38)
			for(::cpp::FastIterator_obj< int > *__it = ::cpp::CreateFastIterator< int >(intI);  __it->hasNext(); ){
				int i = __it->next();
				if (((::Xbox360Input_obj::getCtrlState(i) == true))){
					HX_STACK_LINE(42)
					if ((::Xbox360Input_obj::checkButton(i,(int)4096))){
						HX_STACK_LINE(42)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string(::Std_obj::string((i + (int)1)))) + HX_CSTRING(": ")) + HX_CSTRING("A pressed.")));
					}
					HX_STACK_LINE(43)
					if ((::Xbox360Input_obj::checkButton(i,(int)8192))){
						HX_STACK_LINE(43)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("B pressed.")));
					}
					HX_STACK_LINE(44)
					if ((::Xbox360Input_obj::checkButton(i,(int)16384))){
						HX_STACK_LINE(44)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("X pressed.")));
					}
					HX_STACK_LINE(45)
					if ((::Xbox360Input_obj::checkButton(i,(int)32768))){
						HX_STACK_LINE(45)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("Y pressed.")));
					}
					HX_STACK_LINE(46)
					if ((::Xbox360Input_obj::checkButton(i,(int)1))){
						HX_STACK_LINE(46)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("DPAD_UP pressed.")));
					}
					HX_STACK_LINE(47)
					if ((::Xbox360Input_obj::checkButton(i,(int)2))){
						HX_STACK_LINE(47)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("DPAD_DOWN pressed.")));
					}
					HX_STACK_LINE(48)
					if ((::Xbox360Input_obj::checkButton(i,(int)4))){
						HX_STACK_LINE(48)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("DPAD_LEFT pressed.")));
					}
					HX_STACK_LINE(49)
					if ((::Xbox360Input_obj::checkButton(i,(int)8))){
						HX_STACK_LINE(49)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("DPAD_RIGHT pressed.")));
					}
					HX_STACK_LINE(50)
					if ((::Xbox360Input_obj::checkButton(i,(int)32))){
						HX_STACK_LINE(50)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("BACK pressed.")));
					}
					HX_STACK_LINE(51)
					if ((::Xbox360Input_obj::checkButton(i,(int)16))){
						HX_STACK_LINE(51)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("START pressed.")));
					}
					HX_STACK_LINE(52)
					if ((::Xbox360Input_obj::checkButton(i,(int)512))){
						HX_STACK_LINE(52)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("RIGHT_SHOULDER pressed.")));
					}
					HX_STACK_LINE(53)
					if ((::Xbox360Input_obj::checkButton(i,(int)256))){
						HX_STACK_LINE(53)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("LEFT_SHOULDER pressed.")));
					}
					HX_STACK_LINE(54)
					if ((::Xbox360Input_obj::checkButton(i,(int)128))){
						HX_STACK_LINE(54)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("RIGHT_THUMB pressed.")));
					}
					HX_STACK_LINE(55)
					if ((::Xbox360Input_obj::checkButton(i,(int)64))){
						HX_STACK_LINE(55)
						::Sys_obj::println((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("LEFT_THUMB pressed.")));
					}
					HX_STACK_LINE(57)
					if (((::Math_obj::abs(::Xbox360Input_obj::rightThumbX(i)) >= (int)8500))){
						HX_STACK_LINE(57)
						::Sys_obj::println(((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("RIGHT_THUMB_X: ")) + ::Xbox360Input_obj::rightThumbX(i)));
					}
					HX_STACK_LINE(58)
					if (((::Math_obj::abs(::Xbox360Input_obj::rightThumbY(i)) >= (int)8500))){
						HX_STACK_LINE(58)
						::Sys_obj::println(((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("RIGHT_THUMB_Y: ")) + ::Xbox360Input_obj::rightThumbY(i)));
					}
					HX_STACK_LINE(59)
					if (((::Math_obj::abs(::Xbox360Input_obj::leftThumbX(i)) >= (int)8500))){
						HX_STACK_LINE(59)
						::Sys_obj::println(((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("LEFT_THUMB_X: ")) + ::Xbox360Input_obj::leftThumbX(i)));
					}
					HX_STACK_LINE(60)
					if (((::Math_obj::abs(::Xbox360Input_obj::leftThumbY(i)) >= (int)8500))){
						HX_STACK_LINE(60)
						::Sys_obj::println(((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("LEFT_THUMB_Y: ")) + ::Xbox360Input_obj::leftThumbY(i)));
					}
					HX_STACK_LINE(62)
					if (((::Xbox360Input_obj::rightTrigger(i) >= (int)50))){
						HX_STACK_LINE(62)
						::Sys_obj::println(((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("RIGHT_TRIGGER: ")) + ::Xbox360Input_obj::rightTrigger(i)));
					}
					HX_STACK_LINE(63)
					if (((::Xbox360Input_obj::leftTrigger(i) >= (int)50))){
						HX_STACK_LINE(63)
						::Sys_obj::println(((((HX_CSTRING("Player ") + ::Std_obj::string((i + (int)1))) + HX_CSTRING(": ")) + HX_CSTRING("LEFT_TRIGGER: ")) + ::Xbox360Input_obj::leftTrigger(i)));
					}
					HX_STACK_LINE(64)
					::Xbox360Input_obj::setRumble(i,(::Xbox360Input_obj::leftTrigger(i) * (int)256),(::Xbox360Input_obj::rightTrigger(i) * (int)256));
				}
;
			}
			HX_STACK_LINE(67)
			::Sys_obj::sleep(0.1);
		}
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Main_obj,main,(void))


Main_obj::Main_obj()
{
}

void Main_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Main);
	HX_MARK_END_CLASS();
}

void Main_obj::__Visit(HX_VISIT_PARAMS)
{
}

Dynamic Main_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"main") ) { return main_dyn(); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"stickThreshold") ) { return stickThreshold; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"triggerThreshold") ) { return triggerThreshold; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Main_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 14:
		if (HX_FIELD_EQ(inName,"stickThreshold") ) { stickThreshold=inValue.Cast< int >(); return inValue; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"triggerThreshold") ) { triggerThreshold=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Main_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("stickThreshold"),
	HX_CSTRING("triggerThreshold"),
	HX_CSTRING("main"),
	String(null()) };

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Main_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Main_obj::stickThreshold,"stickThreshold");
	HX_MARK_MEMBER_NAME(Main_obj::triggerThreshold,"triggerThreshold");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Main_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Main_obj::stickThreshold,"stickThreshold");
	HX_VISIT_MEMBER_NAME(Main_obj::triggerThreshold,"triggerThreshold");
};

Class Main_obj::__mClass;

void Main_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("Main"), hx::TCanCast< Main_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Main_obj::__boot()
{
	stickThreshold= (int)8500;
	triggerThreshold= (int)50;
}

