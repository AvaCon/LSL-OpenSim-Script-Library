//Color Change
 
vector c;
default
{
    state_entry()
    {
        llListen(0,"","","colors");
        llListen(0,"","","stop");
        c=llGetColor(0);
    }
    listen (integer channel, string name, key id, string message)
    {
        if (message == "colors")
        {
            float random = llFrand(1.9)+.5;
            llSetTimerEvent(random);
        }
        if (message == "stop")
        {
            llSetTimerEvent(0.0);
            llSetColor(c,-1);
        }
 
    }
    timer()
    {
        float x = llFrand(1.0);
        float y = llFrand(1.0);
        float z = llFrand(1.0);
        llSetColor(<x,y,z>,-1);
    }
 
}