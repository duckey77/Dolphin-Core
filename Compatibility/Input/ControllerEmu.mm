#include "DolphinGameCore.h"
#include "DolHost.h"
#include "input.h"

 int16_t input_cb_f(unsigned m_port, unsigned  m_device, unsigned m_index, unsigned m_id){
    
     NSLog(@"Input Callback has been called");
    return 0;
    
};


void init_Callback() {
    NSLog(@"Input Callback has set-up");
    openemu_set_input_state(input_cb_f);
}

typedef struct
{
    int openemuButton;
    unsigned dolphinButton;
    int value;
} keymap;

typedef struct
{
    float Xaxis;
    float Yaxis;
} axismap;

typedef struct
{
    keymap gc_pad_keymap[12] = {
        {OEGCButtonLeft, OPENEMU_DEVICE_ID_JOYPAD_LEFT, 0},
        {OEGCButtonRight, OPENEMU_DEVICE_ID_JOYPAD_RIGHT, 0},
        {OEGCButtonDown,OPENEMU_DEVICE_ID_JOYPAD_DOWN, 0},
        {OEGCButtonUp, OPENEMU_DEVICE_ID_JOYPAD_UP, 0},
        //{OEGCButtonZ, OPENEMU_DEVICE_ID_JOYPAD_Z, 0},
        {OEGCButtonR, OPENEMU_DEVICE_ID_JOYPAD_R, 0},
        {OEGCButtonL, OPENEMU_DEVICE_ID_JOYPAD_L, 0},
        {OEGCButtonA, OPENEMU_DEVICE_ID_JOYPAD_A, 0},
        {OEGCButtonB, OPENEMU_DEVICE_ID_JOYPAD_B, 0},
        {OEGCButtonX, OPENEMU_DEVICE_ID_JOYPAD_X, 0},
        {OEGCButtonY, OPENEMU_DEVICE_ID_JOYPAD_Y, 0},
        {OEGCButtonStart, OPENEMU_DEVICE_ID_JOYPAD_START, 0},
    };

    axismap gc_pad_Analog;
    axismap gc_pad_AnalogC;
} gc_pad;




//
//static unsigned connected_wiimote_type[MAX_BBMOTES];
//static int current_mote_id;
////static InputConfig s_config(WIIMOTE_INI_NAME, _trans("Wii Remote"), "Wiimote");

//
//typedef struct
//{
//    keymap wiimote_keymap[11] = {
//        {OEWiiMoteButtonLeft, WiimoteEmu::Wiimote::PAD_LEFT, 0},
//        {OEWiiMoteButtonRight, WiimoteEmu::Wiimote::PAD_RIGHT, 0},
//        {OEWiiMoteButtonDown, WiimoteEmu::Wiimote::PAD_DOWN, 0},
//        {OEWiiMoteButtonUp, WiimoteEmu::Wiimote::PAD_UP, 0},
//        {OEWiiMoteButtonPlus, WiimoteEmu::Wiimote::BUTTON_PLUS, 0},
//        {OEWiiMoteButton2, WiimoteEmu::Wiimote::BUTTON_TWO, 0},
//        {OEWiiMoteButton1, WiimoteEmu::Wiimote::BUTTON_ONE, 0},
//        {OEWiiMoteButtonB, WiimoteEmu::Wiimote::BUTTON_B, 0},
//        {OEWiiMoteButtonA, WiimoteEmu::Wiimote::BUTTON_A, 0},
//        {OEWiiMoteButtonMinus, WiimoteEmu::Wiimote::BUTTON_MINUS, 0},
//        {OEWiiMoteButtonHome, WiimoteEmu::Wiimote::BUTTON_HOME, 0},
//    };
//
//    keymap sideways_keymap[11] = {
//        {OEWiiMoteButtonLeft, WiimoteEmu::Wiimote::PAD_UP, 0},
//        {OEWiiMoteButtonRight, WiimoteEmu::Wiimote::PAD_DOWN, 0},
//        {OEWiiMoteButtonDown, WiimoteEmu::Wiimote::PAD_LEFT, 0},
//        {OEWiiMoteButtonUp, WiimoteEmu::Wiimote::PAD_RIGHT, 0},
//        {OEWiiMoteButtonPlus, WiimoteEmu::Wiimote::BUTTON_PLUS, 0},
//        {OEWiiMoteButton2, WiimoteEmu::Wiimote::BUTTON_TWO, 0},
//        {OEWiiMoteButton1, WiimoteEmu::Wiimote::BUTTON_ONE, 0},
//        {OEWiiMoteButtonB, WiimoteEmu::Wiimote::BUTTON_B, 0},
//        {OEWiiMoteButtonA, WiimoteEmu::Wiimote::BUTTON_A, 0},
//        {OEWiiMoteButtonMinus, WiimoteEmu::Wiimote::BUTTON_MINUS, 0},
//        {OEWiiMoteButtonHome, WiimoteEmu::Wiimote::BUTTON_HOME, 0},
//    };
//
//    axismap wiimote_tilt;
//    axismap wiimote_swing;
//    bool emuShake;
//    bool Sideways;
//
//    keymap nunchuk_keymap[2] = {
//        {OEWiiNunchukButtonC, WiimoteEmu::Nunchuk::BUTTON_C, 0},
//        {OEWiiNunchuckButtonZ, WiimoteEmu::Nunchuk::BUTTON_Z, 0},
//    };
//
//    axismap nunchuck_Analog;
//
//    keymap classic_keymap[15] = {
//        {OEWiiClassicButtonRight, WiimoteEmu::Classic::PAD_RIGHT, 0},
//        {OEWiiClassicButtonDown, WiimoteEmu::Classic::PAD_DOWN, 0},
//        {OEWiiClassicButtonL, WiimoteEmu::Classic::TRIGGER_L, 0},
//        {OEWiiClassicButtonSelect, WiimoteEmu::Classic::BUTTON_MINUS, 0},
//        {OEWiiClassicButtonHome, WiimoteEmu::Classic::BUTTON_HOME, 0},
//        {OEWiiClassicButtonStart, WiimoteEmu::Classic::BUTTON_PLUS, 0},
//        {OEWiiClassicButtonR, WiimoteEmu::Classic::TRIGGER_R, 0},
//        {OEWiiClassicButtonZl, WiimoteEmu::Classic::BUTTON_ZL, 0},
//        {OEWiiClassicButtonB, WiimoteEmu::Classic::BUTTON_B, 0},
//        {OEWiiClassicButtonY, WiimoteEmu::Classic::BUTTON_Y, 0},
//        {OEWiiClassicButtonX, WiimoteEmu::Classic::BUTTON_X, 0},
//        {OEWiiClassicButtonA, WiimoteEmu::Classic::BUTTON_A, 0},
//        {OEWiiClassicButtonZr, WiimoteEmu::Classic::BUTTON_ZR, 0},
//        {OEWiiClassicButtonLeft, WiimoteEmu::Classic::PAD_LEFT, 0},
//        {OEWiiClassicButtonUp, WiimoteEmu::Classic::PAD_UP, 0},
//    };
//
//    axismap classic_AnalogLeft;
//    axismap classic_AnalogRight;
//    axismap classic_TriggerLeft;
//    axismap classic_TriggerRight;
//
//    int extension;
//    ControlState dx, dy;
//
//} wii_remote;
//
//
// static gc_pad GameCubePads[4];
// static wii_remote WiiRemotes[4];
// static int want_extension[4];
//
//void setGameCubeButton(int pad_num, int button , int value);
//void setGameCubeAxis(int pad_num, int button , float value);
//
//void setWiiButton(int pad_num, int button , int value);
//void setWiimoteButton(int pad_num, int button , int value);
//void setWiiClassicButton(int pad_num, int button , int value);
//void setWiiNunchukButton(int pad_num, int button , int value);
//
//void setWiiAxis(int pad_num, int button , float value);
//void setWiimoteAxis(int pad_num, int button , float value);
//void setWiiClassicAxis(int pad_num, int button , float value);
//void setWiiNunchukAxis(int pad_num, int button , float value);
//void setWiiIR(int pad_num, float x , float y);
//
//int getWiiExtension (int pad_num);



    
    
//}





//// Copyright 2010 Dolphin Emulator Project
//// Licensed under GPLv2+
//// Refer to the license.txt file included.
//
//#include "Core/HW/WiimoteEmu/Extension/Classic.h"
//
//#include <array>
//#include <cassert>
//
//#include "Common/BitUtils.h"
//#include "Common/Common.h"
//#include "Common/CommonTypes.h"
//#include "Core/HW/WiimoteEmu/WiimoteEmu.h"
//
//#include "InputCommon/ControllerEmu/Control/Input.h"
//#include "InputCommon/ControllerEmu/ControlGroup/AnalogStick.h"
//#include "InputCommon/ControllerEmu/ControlGroup/Buttons.h"
//#include "InputCommon/ControllerEmu/ControlGroup/ControlGroup.h"
//#include "InputCommon/ControllerEmu/ControlGroup/MixedTriggers.h"
//
//namespace WiimoteEmu
//{
//    constexpr std::array<u8, 6> classic_id{{0x00, 0x00, 0xa4, 0x20, 0x01, 0x01}};
//    
//    constexpr std::array<u16, 9> classic_button_bitmasks{{
//        Classic::BUTTON_A,
//        Classic::BUTTON_B,
//        Classic::BUTTON_X,
//        Classic::BUTTON_Y,
//        
//        Classic::BUTTON_ZL,
//        Classic::BUTTON_ZR,
//        
//        Classic::BUTTON_MINUS,
//        Classic::BUTTON_PLUS,
//        
//        Classic::BUTTON_HOME,
//    }};
//    
//    constexpr std::array<const char*, 9> classic_button_names{{
//        "A",
//        "B",
//        "X",
//        "Y",
//        "ZL",
//        "ZR",
//        "-",
//        "+",
//        "Home",
//    }};
//    
//    constexpr std::array<u16, 2> classic_trigger_bitmasks{{
//        Classic::TRIGGER_L,
//        Classic::TRIGGER_R,
//    }};
//    
//    constexpr std::array<const char*, 4> classic_trigger_names{{
//        // i18n: The left trigger button (labeled L on real controllers)
//        _trans("L"),
//        // i18n: The right trigger button (labeled R on real controllers)
//        _trans("R"),
//        // i18n: The left trigger button (labeled L on real controllers) used as an analog input
//        _trans("L-Analog"),
//        // i18n: The right trigger button (labeled R on real controllers) used as an analog input
//        _trans("R-Analog"),
//    }};
//    
//    constexpr std::array<u16, 4> classic_dpad_bitmasks{{
//        Classic::PAD_UP,
//        Classic::PAD_DOWN,
//        Classic::PAD_LEFT,
//        Classic::PAD_RIGHT,
//    }};
//    
//    Classic::Classic() : EncryptedExtension(_trans("Classic"))
//    {
//        // buttons
//        groups.emplace_back(m_buttons = new ControllerEmu::Buttons(_trans("Buttons")));
//        for (const char* button_name : classic_button_names)
//        {
//            const std::string& ui_name = (button_name == std::string("Home")) ? "HOME" : button_name;
//            m_buttons->controls.emplace_back(
//                                             new ControllerEmu::Input(ControllerEmu::DoNotTranslate, button_name, ui_name));
//        }
//        
//        // sticks
//        constexpr auto gate_radius = ControlState(STICK_GATE_RADIUS) / LEFT_STICK_RADIUS;
//        groups.emplace_back(m_left_stick =
//                            new ControllerEmu::OctagonAnalogStick(_trans("Left Stick"), gate_radius));
//        groups.emplace_back(
//                            m_right_stick = new ControllerEmu::OctagonAnalogStick(_trans("Right Stick"), gate_radius));
//        
//        // triggers
//        groups.emplace_back(m_triggers = new ControllerEmu::MixedTriggers(_trans("Triggers")));
//        for (const char* trigger_name : classic_trigger_names)
//        {
//            m_triggers->controls.emplace_back(
//                                              new ControllerEmu::Input(ControllerEmu::Translate, trigger_name));
//        }
//        
//        // dpad
//        groups.emplace_back(m_dpad = new ControllerEmu::Buttons(_trans("D-Pad")));
//        for (const char* named_direction : named_directions)
//        {
//            m_dpad->controls.emplace_back(
//                                          new ControllerEmu::Input(ControllerEmu::Translate, named_direction));
//        }
//    }
//    
//    void Classic::Update()
//    {
//        DataFormat classic_data = {};
//        
//        // left stick
//        {
//            const ControllerEmu::AnalogStick::StateData left_stick_state = m_left_stick->GetState();
//            
//            classic_data.lx = static_cast<u8>(Classic::LEFT_STICK_CENTER_X +
//                                              (left_stick_state.x * Classic::LEFT_STICK_RADIUS));
//            classic_data.ly = static_cast<u8>(Classic::LEFT_STICK_CENTER_Y +
//                                              (left_stick_state.y * Classic::LEFT_STICK_RADIUS));
//        }
//        
//        // right stick
//        {
//            const ControllerEmu::AnalogStick::StateData right_stick_data = m_right_stick->GetState();
//            
//            const u8 x = static_cast<u8>(Classic::RIGHT_STICK_CENTER_X +
//                                         (right_stick_data.x * Classic::RIGHT_STICK_RADIUS));
//            const u8 y = static_cast<u8>(Classic::RIGHT_STICK_CENTER_Y +
//                                         (right_stick_data.y * Classic::RIGHT_STICK_RADIUS));
//            
//            classic_data.rx1 = x;
//            classic_data.rx2 = x >> 1;
//            classic_data.rx3 = x >> 3;
//            classic_data.ry = y;
//        }
//        
//        // triggers
//        {
//            ControlState trigs[2] = {0, 0};
//            m_triggers->GetState(&classic_data.bt.hex, classic_trigger_bitmasks.data(), trigs);
//            
//            const u8 lt = static_cast<u8>(trigs[0] * Classic::LEFT_TRIGGER_RANGE);
//            const u8 rt = static_cast<u8>(trigs[1] * Classic::RIGHT_TRIGGER_RANGE);
//            
//            classic_data.lt1 = lt;
//            classic_data.lt2 = lt >> 3;
//            classic_data.rt = rt;
//        }
//        
//        // buttons
//        m_buttons->GetState(&classic_data.bt.hex, classic_button_bitmasks.data());
//        // dpad
//        m_dpad->GetState(&classic_data.bt.hex, classic_dpad_bitmasks.data());
//        
//        // flip button bits
//        classic_data.bt.hex ^= 0xFFFF;
//        
//        Common::BitCastPtr<DataFormat>(&m_reg.controller_data) = classic_data;
//    }
//    
//    bool Classic::IsButtonPressed() const
//    {
//        u16 buttons = 0;
//        std::array<ControlState, 2> trigs{};
//        m_buttons->GetState(&buttons, classic_button_bitmasks.data());
//        m_dpad->GetState(&buttons, classic_dpad_bitmasks.data());
//        m_triggers->GetState(&buttons, classic_trigger_bitmasks.data(), trigs.data());
//        return buttons != 0;
//    }
//    
//    void Classic::Reset()
//    {
//        m_reg = {};
//        m_reg.identifier = classic_id;
//        
//        // Build calibration data:
//        m_reg.calibration = {{
//            // Left Stick X max,min,center:
//            CAL_STICK_CENTER + CAL_STICK_RANGE,
//            CAL_STICK_CENTER - CAL_STICK_RANGE,
//            CAL_STICK_CENTER,
//            // Left Stick Y max,min,center:
//            CAL_STICK_CENTER + CAL_STICK_RANGE,
//            CAL_STICK_CENTER - CAL_STICK_RANGE,
//            CAL_STICK_CENTER,
//            // Right Stick X max,min,center:
//            CAL_STICK_CENTER + CAL_STICK_RANGE,
//            CAL_STICK_CENTER - CAL_STICK_RANGE,
//            CAL_STICK_CENTER,
//            // Right Stick Y max,min,center:
//            CAL_STICK_CENTER + CAL_STICK_RANGE,
//            CAL_STICK_CENTER - CAL_STICK_RANGE,
//            CAL_STICK_CENTER,
//            // Left/Right trigger range: (assumed based on real calibration data values)
//            LEFT_TRIGGER_RANGE,
//            RIGHT_TRIGGER_RANGE,
//            // 2 checksum bytes calculated below:
//            0x00,
//            0x00,
//        }};
//        
//        UpdateCalibrationDataChecksum(m_reg.calibration, CALIBRATION_CHECKSUM_BYTES);
//    }
//    
//    ControllerEmu::ControlGroup* Classic::GetGroup(ClassicGroup group)
//    {
//        switch (group)
//        {
//            case ClassicGroup::Buttons:
//                return m_buttons;
//            case ClassicGroup::Triggers:
//                return m_triggers;
//            case ClassicGroup::DPad:
//                return m_dpad;
//            case ClassicGroup::LeftStick:
//                return m_left_stick;
//            case ClassicGroup::RightStick:
//                return m_right_stick;
//            default:
//                assert(false);
//                return nullptr;
//        }
//    }
//}  // namespace WiimoteEmu
