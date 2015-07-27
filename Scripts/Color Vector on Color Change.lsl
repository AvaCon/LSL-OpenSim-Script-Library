//Color Vector on Color Change
 
//Aki-Tools
//"ColorVec on ColorChange" 01/27/2004
//This script is useful if you are trying to figure out a color vector. When you change the color of the object this script is on, the object will whisper the new color vector.
 
init()
{
    llSetColor(<1,1,1>, ALL_SIDES);
}
 
colorize()
{
    integer s;
    vector color = llGetColor(1);
    llWhisper(0, "Current Color Vector: [ "+(string)color+" ]");
}
 
default
{
    state_entry()
    {
    init();
    }
 
    on_rez(integer a)
    {
        init();
    }
 
    touch_start(integer total_number)
    {
        colorize();
    }
 
    changed(integer change)
    {
        if (change & CHANGED_COLOR)
        {
            colorize();
        }
    }
}
 
state sold
{
   state_entry() { }
}