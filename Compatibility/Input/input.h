
#define OPENEMU_DEVICE_NONE         0
#define OPENEMU_DEVICE_JOYPAD       1
#define OPENEMU_DEVICE_MOUSE        2
#define OPENEMU_DEVICE_KEYBOARD     3
#define OPENEMU_DEVICE_LIGHTGUN     4
#define OPENEMU_DEVICE_ANALOG       5
#define OPENEMU_DEVICE_POINTER      6
#define OPENEMU_DEVICE_ID_JOYPAD_B        0
#define OPENEMU_DEVICE_ID_JOYPAD_Y        1
#define OPENEMU_DEVICE_ID_JOYPAD_SELECT   2
#define OPENEMU_DEVICE_ID_JOYPAD_START    3
#define OPENEMU_DEVICE_ID_JOYPAD_UP       4
#define OPENEMU_DEVICE_ID_JOYPAD_DOWN     5
#define OPENEMU_DEVICE_ID_JOYPAD_LEFT     6
#define OPENEMU_DEVICE_ID_JOYPAD_RIGHT    7
#define OPENEMU_DEVICE_ID_JOYPAD_A        8
#define OPENEMU_DEVICE_ID_JOYPAD_X        9
#define OPENEMU_DEVICE_ID_JOYPAD_L       10
#define OPENEMU_DEVICE_ID_JOYPAD_R       11
#define OPENEMU_DEVICE_ID_JOYPAD_L2      12
#define OPENEMU_DEVICE_ID_JOYPAD_R2      13
#define OPENEMU_DEVICE_ID_JOYPAD_L3      14
#define OPENEMU_DEVICE_ID_JOYPAD_R3      15
#define OPENEMU_DEVICE_INDEX_ANALOG_LEFT       0
#define OPENEMU_DEVICE_INDEX_ANALOG_RIGHT      1
#define OPENEMU_DEVICE_INDEX_ANALOG_BUTTON     2
#define OPENEMU_DEVICE_ID_ANALOG_X             0
#define OPENEMU_DEVICE_ID_ANALOG_Y             1
#define OPENEMU_DEVICE_ID_MOUSE_X                0
#define OPENEMU_DEVICE_ID_MOUSE_Y                1
#define OPENEMU_DEVICE_ID_MOUSE_LEFT             2
#define OPENEMU_DEVICE_ID_MOUSE_RIGHT            3
#define OPENEMU_DEVICE_ID_MOUSE_WHEELUP          4
#define OPENEMU_DEVICE_ID_MOUSE_WHEELDOWN        5
#define OPENEMU_DEVICE_ID_MOUSE_MIDDLE           6
#define OPENEMU_DEVICE_ID_MOUSE_HORIZ_WHEELUP    7
#define OPENEMU_DEVICE_ID_MOUSE_HORIZ_WHEELDOWN  8
#define OPENEMU_DEVICE_ID_MOUSE_BUTTON_4         9
#define OPENEMU_DEVICE_ID_MOUSE_BUTTON_5         10
#define OPENEMU_DEVICE_ID_LIGHTGUN_SCREEN_X        13 /*Absolute Position*/
#define OPENEMU_DEVICE_ID_LIGHTGUN_SCREEN_Y        14 /*Absolute*/
#define OPENEMU_DEVICE_ID_LIGHTGUN_IS_OFFSCREEN    15 /*Status Check*/
#define OPENEMU_DEVICE_ID_LIGHTGUN_TRIGGER          2
#define OPENEMU_DEVICE_ID_LIGHTGUN_RELOAD          16 /*Forced off-screen shot*/
#define OPENEMU_DEVICE_ID_LIGHTGUN_AUX_A            3
#define OPENEMU_DEVICE_ID_LIGHTGUN_AUX_B            4
#define OPENEMU_DEVICE_ID_LIGHTGUN_START            6
#define OPENEMU_DEVICE_ID_LIGHTGUN_SELECT           7
#define OPENEMU_DEVICE_ID_LIGHTGUN_AUX_C            8
#define OPENEMU_DEVICE_ID_LIGHTGUN_DPAD_UP          9
#define OPENEMU_DEVICE_ID_LIGHTGUN_DPAD_DOWN       10
#define OPENEMU_DEVICE_ID_LIGHTGUN_DPAD_LEFT       11
#define OPENEMU_DEVICE_ID_LIGHTGUN_DPAD_RIGHT      12

#define OPENEMU_DEVICE_ID_POINTER_X         0
#define OPENEMU_DEVICE_ID_POINTER_Y         1
#define OPENEMU_DEVICE_ID_POINTER_PRESSED   2


#define OPENEMU_DEVICE_WIIMOTE ((1 << 8) | OPENEMU_DEVICE_JOYPAD)
#define OPENEMU_DEVICE_WIIMOTE_SW ((2 << 8) | OPENEMU_DEVICE_JOYPAD)
#define OPENEMU_DEVICE_WIIMOTE_NC ((3 << 8) | OPENEMU_DEVICE_JOYPAD)
#define OPENEMU_DEVICE_WIIMOTE_CC ((4 << 8) | OPENEMU_DEVICE_JOYPAD)
#define OPENEMU_DEVICE_REAL_WIIMOTE ((6 << 8) | OPENEMU_DEVICE_NONE)

struct openemu_controller_description
{
    const char *desc;
    unsigned id;
};

struct openemu_controller_info
{
    const struct openemu_controller_description *types;
    unsigned num_types;
};

struct openemu_input_descriptor
{
    unsigned port;
    unsigned device;
    unsigned index;
    unsigned id;
    const char *description;
};

typedef int16_t (*openemu_input_state_t)(unsigned port, unsigned device, unsigned index, unsigned id);

void openemu_set_controller_port_device(unsigned port, unsigned device);
void openemu_set_input_state(openemu_input_state_t);

void Openemu_Input_Init();
