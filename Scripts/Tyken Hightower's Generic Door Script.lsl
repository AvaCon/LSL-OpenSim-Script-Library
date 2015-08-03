//start_unprocessed_text
/*/|/ Generic Door
/|/ "N" was here
 
 
 
/|/ Information
/|/ ----------------------------------------------------------------
/|/ The door prim can be either a root or child (although a child will only rotate itself, not the linkset).
/|/ The script operates assuming that the 'front' of the door is its positive x-axis, the positive y-axis shoots from the hinges through the door, and the z-axis is up.
/|/
/|/ To make a very simple one-prim door to use, give a box the following parameters and drop the script in:
/|/      Size X: 0.1
/|/      Size Y: 3.0
/|/      Size Z: 3.0
/|/      Path Cut Begin: 0.375
/|/      Path Cut End: 0.875
/|/
/|/ The door doesn't require any 'reset;' if you want to move it, go right ahead. Moving or rotating the door doesn't change its operation or open/closed status.
/|/ Changing and recompiling the script or resetting it makes the door assume it is in the 'closed' position.
/|/ ----------------------------------------------------------------
 
 
 
/|/ User-customizable constants
/|/ ----------------------------------------------------------------
/|/ Sets whether the door can be opened by touch
integer touch_to_open = TRUE;
 
/|/ Sets whether the door can be opened by collision
integer collide_to_open = TRUE;
 
/|/ Sets whether the door should use a sensor automatically open for nearby agents, the sensor range (in meters), and the sensor scan rate (in seconds)
integer sensor_open = TRUE;
float sensor_open_range = 3.0;
float sensor_open_scanrate = 1.0;
 
/|/ Seconds until an open door shuts itself automatically (set to 0.0 to let doors stay open forever)
float door_timeout = 5.0;
 
/|/ Which direction the door opens around the Z axis
/|/ Both can be set; the the direction will then depend on the position of the person opening it
integer open_clockwise = TRUE;
integer open_anticlockwise = TRUE;
/|/ Sets whether the door opens away (TRUE) from or toward (FALSE) the avatar opening it (only has an effect when both opening direction options above are TRUE)
integer open_away = TRUE;
 
/|/ Angle (in degrees) the door opens for each direction (use only positive values)
float clockwise_angle = 90.0;
float anticlockwise_angle = 90.0;
 
/|/ Sound effect inventory names (or asset UUIDs) and volume levels (0.0 to 1.0)
string open_sound = "";
float open_volume = 1.0;
string close_sound = "";
float close_volume = 1.0;
/|/ ----------------------------------------------------------------
 
 
 
/|/ Internal script variables - do not edit
/|/ ----------------------------------------------------------------
integer opened = FALSE;
integer opened_clockwise = FALSE;
 
integer timeout_waiting = FALSE;
 
rotation clockwise_rot = <0.0, 0.0, 0.0, 1.0>;
rotation inv_clockwise_rot = <0.0, 0.0, 0.0, 1.0>;
rotation anticlockwise_rot = <0.0, 0.0, 0.0, 1.0>;
rotation inv_anticlockwise_rot = <0.0, 0.0, 0.0, 1.0>;
/|/ ----------------------------------------------------------------
 
 
 
init() {
    /|/ Prepare internal rotation values to save calculations
    clockwise_rot = llEuler2Rot(<0.0, 0.0, -clockwise_angle> * DEG_TO_RAD);
    inv_clockwise_rot = ZERO_ROTATION / clockwise_rot;
    anticlockwise_rot = llEuler2Rot(<0.0, 0.0, anticlockwise_angle> * DEG_TO_RAD);
    inv_anticlockwise_rot = ZERO_ROTATION / anticlockwise_rot;
 
    if (sensor_open) {
        llSensorRepeat("", "", AGENT, sensor_open_range, PI, sensor_open_scanrate);
    }
}
 
/|/ Perform the actual opening, clockwise
do_open_clockwise() {
    if (open_sound != "") {
        llTriggerSound(open_sound, open_volume);
    }
    llSetLocalRot(clockwise_rot * llGetLocalRot());
 
    opened_clockwise = TRUE;
}
 
/|/ Perform the actual opening, anticlockwise
do_open_anticlockwise() {
    if (open_sound != "") {
        llTriggerSound(open_sound, open_volume);
    }
    llSetLocalRot(anticlockwise_rot * llGetLocalRot());
 
    opened_clockwise = FALSE;
}
 
open(vector agent_pos) {
    llSetTimerEvent(door_timeout);
    /|/ Don't try to open the door if it's already opened
    if (opened) return;
 
    /|/ If necessary, determine whether to open clockwise or anticlockwise based on the agent's position
    if (open_clockwise && open_anticlockwise) {
        float agent_angle = llRot2Angle(llRotBetween(llRot2Fwd(llGetRot()), llVecNorm(agent_pos - llGetPos())));
        if (agent_angle > PI_BY_TWO) { /|/ Agent is 'behind' the door (negative on the door's x-axis)
            if (open_away) { /|/ Default behavior; agent behind door opens it 'away,' thus clockwise
                do_open_clockwise();
            } else { /|/ Agent is behind door, but opens it toward themselves, thus anticlockwise
                do_open_anticlockwise();
            }
        } else { /|/ Agent is 'in front of' the door (positive on the door's x-axis)
            if (open_away) { /|/ Default behavior, agent in front of door opens it 'away,' thus anticlockwise
                do_open_anticlockwise();
            } else { /|/ Agent is in front of door, but opens it toward themselves, thus clockwise
                do_open_clockwise();
            }
        }
    /|/ Otherwise, open in a simple predetermined manner.
    } else if (open_clockwise) {
        do_open_clockwise();
    } else {
        do_open_anticlockwise();
    }
 
    opened = TRUE;
    timeout_waiting = FALSE;
    start_timeout();
}
 
close() {
    llSetTimerEvent(0.0);
    /|/ Don't try to close the door if it's already closed
    if (!opened) return;
 
    if (close_sound != "") {
        llTriggerSound(close_sound, close_volume);
    }
 
    if (opened_clockwise) {
        llSetLocalRot(inv_clockwise_rot * llGetLocalRot());
    } else {
        llSetLocalRot(inv_anticlockwise_rot * llGetLocalRot());
    }
 
    opened = FALSE;
    timeout_waiting = FALSE;
}
 
start_timeout() {
    if (timeout_waiting) return;
 
    llSetTimerEvent(door_timeout);
    timeout_waiting = TRUE;
}
 
default
{
    state_entry() {
        init();
    }
 
    on_rez(integer start) {
        llResetScript();
    }
 
    /|/ Touching can either open or close the door
    touch_start(integer touches) {
        if (touch_to_open) {
            if (opened) {
                close();
            } else {
                open(llDetectedPos(0));
            }
        }
    }
 
    /|/ Collisions will open the door or keep it open by resetting the timer
    collision_start(integer colliders) {
        if (collide_to_open) {
            open(llDetectedPos(0));
        }
    }
 
    /|/ Sensor matches will open the door or keep it open by resetting the timer
    sensor(integer matches) {
        open(llDetectedPos(0));
    }
 
    /|/ Avatars have left door scan range, allowing timeout to begin
    no_sensor() {
        start_timeout();
    }
 
    /|/ Timeout reached, close the door
    timer() {
        close();
    }
}*/
//end_unprocessed_text
//nfo_preprocessor_version 0
//program_version Emerald Viewer
//mono
 
 
integer touch_to_open = TRUE;
integer timeout_waiting = FALSE;
float sensor_open_scanrate = 1.0;
float sensor_open_range = 3.0;
integer sensor_open = TRUE;
integer opened_clockwise = FALSE;
integer opened = FALSE;
float open_volume = 1.0;
string open_sound = "";
integer open_clockwise = TRUE;
integer open_away = TRUE;
integer open_anticlockwise = TRUE;
rotation inv_clockwise_rot = <0.0, 0.0, 0.0, 1.0>;
rotation inv_anticlockwise_rot = <0.0, 0.0, 0.0, 1.0>;
float door_timeout = 5.0;
integer collide_to_open = TRUE;
float close_volume = 1.0;
string close_sound = "";
rotation clockwise_rot = <0.0, 0.0, 0.0, 1.0>;
float clockwise_angle = 90.0;
rotation anticlockwise_rot = <0.0, 0.0, 0.0, 1.0>;
float anticlockwise_angle = 90.0;
 
 
 
do_open_clockwise() {
    if (open_sound != "") {
        llTriggerSound(open_sound, open_volume);
    }
    llSetLocalRot(clockwise_rot * llGetLocalRot());
 
    opened_clockwise = TRUE;
}
 
 
 
do_open_anticlockwise() {
    if (open_sound != "") {
        llTriggerSound(open_sound, open_volume);
    }
    llSetLocalRot(anticlockwise_rot * llGetLocalRot());
 
    opened_clockwise = FALSE;
}
 
 
start_timeout() {
    if (timeout_waiting) return;
 
    llSetTimerEvent(door_timeout);
    timeout_waiting = TRUE;
}
 
 
open(vector agent_pos) {
    llSetTimerEvent(door_timeout);
 
    if (opened) return;
 
 
    if (open_clockwise && open_anticlockwise) {
        float agent_angle = llRot2Angle(llRotBetween(llRot2Fwd(llGetRot()), llVecNorm(agent_pos - llGetPos())));
        if (agent_angle > PI_BY_TWO) {
            if (open_away) {
                do_open_clockwise();
            } else {
                do_open_anticlockwise();
            }
        } else {
            if (open_away) {
                do_open_anticlockwise();
            } else {
                do_open_clockwise();
            }
        }
 
    } else if (open_clockwise) {
        do_open_clockwise();
    } else {
        do_open_anticlockwise();
    }
 
    opened = TRUE;
    timeout_waiting = FALSE;
    start_timeout();
}
 
 
 
 
 
init() {
 
    clockwise_rot = llEuler2Rot(<0.0, 0.0, -clockwise_angle> * DEG_TO_RAD);
    inv_clockwise_rot = ZERO_ROTATION / clockwise_rot;
    anticlockwise_rot = llEuler2Rot(<0.0, 0.0, anticlockwise_angle> * DEG_TO_RAD);
    inv_anticlockwise_rot = ZERO_ROTATION / anticlockwise_rot;
 
    if (sensor_open) {
        llSensorRepeat("", "", AGENT, sensor_open_range, PI, sensor_open_scanrate);
    }
}
 
 
close() {
    llSetTimerEvent(0.0);
 
    if (!opened) return;
 
    if (close_sound != "") {
        llTriggerSound(close_sound, close_volume);
    }
 
    if (opened_clockwise) {
        llSetLocalRot(inv_clockwise_rot * llGetLocalRot());
    } else {
        llSetLocalRot(inv_anticlockwise_rot * llGetLocalRot());
    }
 
    opened = FALSE;
    timeout_waiting = FALSE;
}
 
 
default
{
    state_entry() {
        init();
    }
 
    on_rez(integer start) {
        llResetScript();
    }
 
 
    touch_start(integer touches) {
        if (touch_to_open) {
            if (opened) {
                close();
            } else {
                open(llDetectedPos(0));
            }
        }
    }
 
 
    collision_start(integer colliders) {
        if (collide_to_open) {
            open(llDetectedPos(0));
        }
    }
 
 
    sensor(integer matches) {
        open(llDetectedPos(0));
    }
 
 
    no_sensor() {
        start_timeout();
    }
 
 
    timer() {
        close();
    }
}