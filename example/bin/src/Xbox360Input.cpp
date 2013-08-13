#include <hxcpp.h>

#ifndef INCLUDED_Xbox360Input
#include <Xbox360Input.h>
#endif
#ifndef INCLUDED_cpp_Lib
#include <cpp/Lib.h>
#endif

Void Xbox360Input_obj::__construct()
{
	return null();
}

Xbox360Input_obj::~Xbox360Input_obj() { }

Dynamic Xbox360Input_obj::__CreateEmpty() { return  new Xbox360Input_obj; }
hx::ObjectPtr< Xbox360Input_obj > Xbox360Input_obj::__new()
{  hx::ObjectPtr< Xbox360Input_obj > result = new Xbox360Input_obj();
	result->__construct();
	return result;}

Dynamic Xbox360Input_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Xbox360Input_obj > result = new Xbox360Input_obj();
	result->__construct();
	return result;}

Dynamic Xbox360Input_obj::dll_setRumble;

Dynamic Xbox360Input_obj::dll_leftTrigger;

Dynamic Xbox360Input_obj::dll_rightTrigger;

Dynamic Xbox360Input_obj::dll_leftThumbX;

Dynamic Xbox360Input_obj::dll_leftThumbY;

Dynamic Xbox360Input_obj::dll_rightThumbX;

Dynamic Xbox360Input_obj::dll_rightThumbY;

Dynamic Xbox360Input_obj::dll_getButtonState;

Dynamic Xbox360Input_obj::dll_checkButton;

Dynamic Xbox360Input_obj::dll_getCtrlState;

int Xbox360Input_obj::DPAD_UP;

int Xbox360Input_obj::DPAD_DOWN;

int Xbox360Input_obj::DPAD_LEFT;

int Xbox360Input_obj::DPAD_RIGHT;

int Xbox360Input_obj::START;

int Xbox360Input_obj::BACK;

int Xbox360Input_obj::LEFT_THUMB;

int Xbox360Input_obj::RIGHT_THUMB;

int Xbox360Input_obj::LEFT_SHOULDER;

int Xbox360Input_obj::RIGHT_SHOULDER;

int Xbox360Input_obj::A;

int Xbox360Input_obj::B;

int Xbox360Input_obj::X;

int Xbox360Input_obj::Y;

int Xbox360Input_obj::setRumble( hx::Null< int >  __o_index,hx::Null< int >  __o_left,hx::Null< int >  __o_right){
int index = __o_index.Default(0);
int left = __o_left.Default(0);
int right = __o_right.Default(0);
	HX_STACK_PUSH("Xbox360Input::setRumble","Xbox360Input.hx",45);
	HX_STACK_ARG(index,"index");
	HX_STACK_ARG(left,"left");
	HX_STACK_ARG(right,"right");
{
		HX_STACK_LINE(45)
		return ::Xbox360Input_obj::dll_setRumble(index,left,right);
	}
}


STATIC_HX_DEFINE_DYNAMIC_FUNC3(Xbox360Input_obj,setRumble,return )

int Xbox360Input_obj::leftTrigger( int index){
	HX_STACK_PUSH("Xbox360Input::leftTrigger","Xbox360Input.hx",55);
	HX_STACK_ARG(index,"index");
	HX_STACK_LINE(55)
	return ::Xbox360Input_obj::dll_leftTrigger(index);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Xbox360Input_obj,leftTrigger,return )

int Xbox360Input_obj::rightTrigger( int index){
	HX_STACK_PUSH("Xbox360Input::rightTrigger","Xbox360Input.hx",65);
	HX_STACK_ARG(index,"index");
	HX_STACK_LINE(65)
	return ::Xbox360Input_obj::dll_rightTrigger(index);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Xbox360Input_obj,rightTrigger,return )

int Xbox360Input_obj::leftThumbX( int index){
	HX_STACK_PUSH("Xbox360Input::leftThumbX","Xbox360Input.hx",75);
	HX_STACK_ARG(index,"index");
	HX_STACK_LINE(75)
	return ::Xbox360Input_obj::dll_leftThumbX(index);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Xbox360Input_obj,leftThumbX,return )

int Xbox360Input_obj::rightThumbX( int index){
	HX_STACK_PUSH("Xbox360Input::rightThumbX","Xbox360Input.hx",85);
	HX_STACK_ARG(index,"index");
	HX_STACK_LINE(85)
	return ::Xbox360Input_obj::dll_rightThumbX(index);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Xbox360Input_obj,rightThumbX,return )

int Xbox360Input_obj::leftThumbY( int index){
	HX_STACK_PUSH("Xbox360Input::leftThumbY","Xbox360Input.hx",95);
	HX_STACK_ARG(index,"index");
	HX_STACK_LINE(95)
	return ::Xbox360Input_obj::dll_leftThumbY(index);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Xbox360Input_obj,leftThumbY,return )

int Xbox360Input_obj::rightThumbY( int index){
	HX_STACK_PUSH("Xbox360Input::rightThumbY","Xbox360Input.hx",105);
	HX_STACK_ARG(index,"index");
	HX_STACK_LINE(105)
	return ::Xbox360Input_obj::dll_rightThumbY(index);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Xbox360Input_obj,rightThumbY,return )

int Xbox360Input_obj::getButtonState( int index){
	HX_STACK_PUSH("Xbox360Input::getButtonState","Xbox360Input.hx",121);
	HX_STACK_ARG(index,"index");
	HX_STACK_LINE(121)
	return ::Xbox360Input_obj::dll_getButtonState(index);
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Xbox360Input_obj,getButtonState,return )

bool Xbox360Input_obj::checkButton( int index,int button){
	HX_STACK_PUSH("Xbox360Input::checkButton","Xbox360Input.hx",132);
	HX_STACK_ARG(index,"index");
	HX_STACK_ARG(button,"button");
	HX_STACK_LINE(132)
	if (((::Xbox360Input_obj::dll_checkButton(index,button) == (int)1))){
		HX_STACK_LINE(133)
		return true;
	}
	else{
		HX_STACK_LINE(134)
		return false;
	}
	HX_STACK_LINE(132)
	return false;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC2(Xbox360Input_obj,checkButton,return )

bool Xbox360Input_obj::getCtrlState( int index){
	HX_STACK_PUSH("Xbox360Input::getCtrlState","Xbox360Input.hx",143);
	HX_STACK_ARG(index,"index");
	HX_STACK_LINE(143)
	if (((::Xbox360Input_obj::dll_getCtrlState(index) == (int)1167))){
		HX_STACK_LINE(144)
		return false;
	}
	else{
		HX_STACK_LINE(145)
		return true;
	}
	HX_STACK_LINE(143)
	return false;
}


STATIC_HX_DEFINE_DYNAMIC_FUNC1(Xbox360Input_obj,getCtrlState,return )


Xbox360Input_obj::Xbox360Input_obj()
{
}

void Xbox360Input_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Xbox360Input);
	HX_MARK_END_CLASS();
}

void Xbox360Input_obj::__Visit(HX_VISIT_PARAMS)
{
}

Dynamic Xbox360Input_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"A") ) { return A; }
		if (HX_FIELD_EQ(inName,"B") ) { return B; }
		if (HX_FIELD_EQ(inName,"X") ) { return X; }
		if (HX_FIELD_EQ(inName,"Y") ) { return Y; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"BACK") ) { return BACK; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"START") ) { return START; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"DPAD_UP") ) { return DPAD_UP; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"DPAD_DOWN") ) { return DPAD_DOWN; }
		if (HX_FIELD_EQ(inName,"DPAD_LEFT") ) { return DPAD_LEFT; }
		if (HX_FIELD_EQ(inName,"setRumble") ) { return setRumble_dyn(); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"DPAD_RIGHT") ) { return DPAD_RIGHT; }
		if (HX_FIELD_EQ(inName,"LEFT_THUMB") ) { return LEFT_THUMB; }
		if (HX_FIELD_EQ(inName,"leftThumbX") ) { return leftThumbX_dyn(); }
		if (HX_FIELD_EQ(inName,"leftThumbY") ) { return leftThumbY_dyn(); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"RIGHT_THUMB") ) { return RIGHT_THUMB; }
		if (HX_FIELD_EQ(inName,"leftTrigger") ) { return leftTrigger_dyn(); }
		if (HX_FIELD_EQ(inName,"rightThumbX") ) { return rightThumbX_dyn(); }
		if (HX_FIELD_EQ(inName,"rightThumbY") ) { return rightThumbY_dyn(); }
		if (HX_FIELD_EQ(inName,"checkButton") ) { return checkButton_dyn(); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"rightTrigger") ) { return rightTrigger_dyn(); }
		if (HX_FIELD_EQ(inName,"getCtrlState") ) { return getCtrlState_dyn(); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"dll_setRumble") ) { return dll_setRumble; }
		if (HX_FIELD_EQ(inName,"LEFT_SHOULDER") ) { return LEFT_SHOULDER; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"dll_leftThumbX") ) { return dll_leftThumbX; }
		if (HX_FIELD_EQ(inName,"dll_leftThumbY") ) { return dll_leftThumbY; }
		if (HX_FIELD_EQ(inName,"RIGHT_SHOULDER") ) { return RIGHT_SHOULDER; }
		if (HX_FIELD_EQ(inName,"getButtonState") ) { return getButtonState_dyn(); }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"dll_leftTrigger") ) { return dll_leftTrigger; }
		if (HX_FIELD_EQ(inName,"dll_rightThumbX") ) { return dll_rightThumbX; }
		if (HX_FIELD_EQ(inName,"dll_rightThumbY") ) { return dll_rightThumbY; }
		if (HX_FIELD_EQ(inName,"dll_checkButton") ) { return dll_checkButton; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"dll_rightTrigger") ) { return dll_rightTrigger; }
		if (HX_FIELD_EQ(inName,"dll_getCtrlState") ) { return dll_getCtrlState; }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"dll_getButtonState") ) { return dll_getButtonState; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Xbox360Input_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"A") ) { A=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"B") ) { B=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"X") ) { X=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"Y") ) { Y=inValue.Cast< int >(); return inValue; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"BACK") ) { BACK=inValue.Cast< int >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"START") ) { START=inValue.Cast< int >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"DPAD_UP") ) { DPAD_UP=inValue.Cast< int >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"DPAD_DOWN") ) { DPAD_DOWN=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"DPAD_LEFT") ) { DPAD_LEFT=inValue.Cast< int >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"DPAD_RIGHT") ) { DPAD_RIGHT=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"LEFT_THUMB") ) { LEFT_THUMB=inValue.Cast< int >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"RIGHT_THUMB") ) { RIGHT_THUMB=inValue.Cast< int >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"dll_setRumble") ) { dll_setRumble=inValue.Cast< Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"LEFT_SHOULDER") ) { LEFT_SHOULDER=inValue.Cast< int >(); return inValue; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"dll_leftThumbX") ) { dll_leftThumbX=inValue.Cast< Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"dll_leftThumbY") ) { dll_leftThumbY=inValue.Cast< Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"RIGHT_SHOULDER") ) { RIGHT_SHOULDER=inValue.Cast< int >(); return inValue; }
		break;
	case 15:
		if (HX_FIELD_EQ(inName,"dll_leftTrigger") ) { dll_leftTrigger=inValue.Cast< Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"dll_rightThumbX") ) { dll_rightThumbX=inValue.Cast< Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"dll_rightThumbY") ) { dll_rightThumbY=inValue.Cast< Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"dll_checkButton") ) { dll_checkButton=inValue.Cast< Dynamic >(); return inValue; }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"dll_rightTrigger") ) { dll_rightTrigger=inValue.Cast< Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"dll_getCtrlState") ) { dll_getCtrlState=inValue.Cast< Dynamic >(); return inValue; }
		break;
	case 18:
		if (HX_FIELD_EQ(inName,"dll_getButtonState") ) { dll_getButtonState=inValue.Cast< Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Xbox360Input_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("dll_setRumble"),
	HX_CSTRING("dll_leftTrigger"),
	HX_CSTRING("dll_rightTrigger"),
	HX_CSTRING("dll_leftThumbX"),
	HX_CSTRING("dll_leftThumbY"),
	HX_CSTRING("dll_rightThumbX"),
	HX_CSTRING("dll_rightThumbY"),
	HX_CSTRING("dll_getButtonState"),
	HX_CSTRING("dll_checkButton"),
	HX_CSTRING("dll_getCtrlState"),
	HX_CSTRING("DPAD_UP"),
	HX_CSTRING("DPAD_DOWN"),
	HX_CSTRING("DPAD_LEFT"),
	HX_CSTRING("DPAD_RIGHT"),
	HX_CSTRING("START"),
	HX_CSTRING("BACK"),
	HX_CSTRING("LEFT_THUMB"),
	HX_CSTRING("RIGHT_THUMB"),
	HX_CSTRING("LEFT_SHOULDER"),
	HX_CSTRING("RIGHT_SHOULDER"),
	HX_CSTRING("A"),
	HX_CSTRING("B"),
	HX_CSTRING("X"),
	HX_CSTRING("Y"),
	HX_CSTRING("setRumble"),
	HX_CSTRING("leftTrigger"),
	HX_CSTRING("rightTrigger"),
	HX_CSTRING("leftThumbX"),
	HX_CSTRING("rightThumbX"),
	HX_CSTRING("leftThumbY"),
	HX_CSTRING("rightThumbY"),
	HX_CSTRING("getButtonState"),
	HX_CSTRING("checkButton"),
	HX_CSTRING("getCtrlState"),
	String(null()) };

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::dll_setRumble,"dll_setRumble");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::dll_leftTrigger,"dll_leftTrigger");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::dll_rightTrigger,"dll_rightTrigger");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::dll_leftThumbX,"dll_leftThumbX");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::dll_leftThumbY,"dll_leftThumbY");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::dll_rightThumbX,"dll_rightThumbX");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::dll_rightThumbY,"dll_rightThumbY");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::dll_getButtonState,"dll_getButtonState");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::dll_checkButton,"dll_checkButton");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::dll_getCtrlState,"dll_getCtrlState");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::DPAD_UP,"DPAD_UP");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::DPAD_DOWN,"DPAD_DOWN");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::DPAD_LEFT,"DPAD_LEFT");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::DPAD_RIGHT,"DPAD_RIGHT");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::START,"START");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::BACK,"BACK");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::LEFT_THUMB,"LEFT_THUMB");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::RIGHT_THUMB,"RIGHT_THUMB");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::LEFT_SHOULDER,"LEFT_SHOULDER");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::RIGHT_SHOULDER,"RIGHT_SHOULDER");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::A,"A");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::B,"B");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::X,"X");
	HX_MARK_MEMBER_NAME(Xbox360Input_obj::Y,"Y");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::dll_setRumble,"dll_setRumble");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::dll_leftTrigger,"dll_leftTrigger");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::dll_rightTrigger,"dll_rightTrigger");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::dll_leftThumbX,"dll_leftThumbX");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::dll_leftThumbY,"dll_leftThumbY");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::dll_rightThumbX,"dll_rightThumbX");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::dll_rightThumbY,"dll_rightThumbY");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::dll_getButtonState,"dll_getButtonState");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::dll_checkButton,"dll_checkButton");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::dll_getCtrlState,"dll_getCtrlState");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::DPAD_UP,"DPAD_UP");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::DPAD_DOWN,"DPAD_DOWN");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::DPAD_LEFT,"DPAD_LEFT");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::DPAD_RIGHT,"DPAD_RIGHT");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::START,"START");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::BACK,"BACK");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::LEFT_THUMB,"LEFT_THUMB");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::RIGHT_THUMB,"RIGHT_THUMB");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::LEFT_SHOULDER,"LEFT_SHOULDER");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::RIGHT_SHOULDER,"RIGHT_SHOULDER");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::A,"A");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::B,"B");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::X,"X");
	HX_VISIT_MEMBER_NAME(Xbox360Input_obj::Y,"Y");
};

Class Xbox360Input_obj::__mClass;

void Xbox360Input_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("Xbox360Input"), hx::TCanCast< Xbox360Input_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Xbox360Input_obj::__boot()
{
	dll_setRumble= ::cpp::Lib_obj::load(HX_CSTRING("hXInput"),HX_CSTRING("setRumble"),(int)3);
	dll_leftTrigger= ::cpp::Lib_obj::load(HX_CSTRING("hXInput"),HX_CSTRING("leftTrigger"),(int)1);
	dll_rightTrigger= ::cpp::Lib_obj::load(HX_CSTRING("hXInput"),HX_CSTRING("rightTrigger"),(int)1);
	dll_leftThumbX= ::cpp::Lib_obj::load(HX_CSTRING("hXInput"),HX_CSTRING("leftThumbX"),(int)1);
	dll_leftThumbY= ::cpp::Lib_obj::load(HX_CSTRING("hXInput"),HX_CSTRING("leftThumbY"),(int)1);
	dll_rightThumbX= ::cpp::Lib_obj::load(HX_CSTRING("hXInput"),HX_CSTRING("rightThumbX"),(int)1);
	dll_rightThumbY= ::cpp::Lib_obj::load(HX_CSTRING("hXInput"),HX_CSTRING("rightThumbY"),(int)1);
	dll_getButtonState= ::cpp::Lib_obj::load(HX_CSTRING("hXInput"),HX_CSTRING("getButtonState"),(int)1);
	dll_checkButton= ::cpp::Lib_obj::load(HX_CSTRING("hXInput"),HX_CSTRING("checkButton"),(int)2);
	dll_getCtrlState= ::cpp::Lib_obj::load(HX_CSTRING("hXInput"),HX_CSTRING("getCtrlState"),(int)1);
	DPAD_UP= (int)1;
	DPAD_DOWN= (int)2;
	DPAD_LEFT= (int)4;
	DPAD_RIGHT= (int)8;
	START= (int)16;
	BACK= (int)32;
	LEFT_THUMB= (int)64;
	RIGHT_THUMB= (int)128;
	LEFT_SHOULDER= (int)256;
	RIGHT_SHOULDER= (int)512;
	A= (int)4096;
	B= (int)8192;
	X= (int)16384;
	Y= (int)32768;
}

