// This delay number is the amount of time to delay in between each step while fading in and out.  There are currently 10 steps.  In other words, the smaller this number is the quicker the fade.  Using really low numbers will result in the fastest possible fade (but may stutter/lag more visibly) By JESSICA HOPPER (@jesshop23) and CHRISTINA NG
 
    float delay = 0.20;
 
// *******************************************
 
    float i;
    float j;
 
fadeout()
{
    for (i = 10; i > 0; i--)
    {
        llSetLinkAlpha(LINK_SET, (i/10), ALL_SIDES);
        llSleep(delay);
    }
 
    llSetLinkAlpha(LINK_SET, 0, ALL_SIDES);
}
 
fadein()
{
    for (j = 0; j < 10; j++)
    {
        llSetLinkAlpha(LINK_SET, (j/10), ALL_SIDES);
        llSleep(delay);
    }
 
    llSetLinkAlpha(LINK_SET, 1, ALL_SIDES);
}
 
 
default
{
 
    state_entry()
    {
        llSetTimerEvent(5);
    }
    timer()
    {
        fadeout();
        llSleep(5);
        fadein();
        llSleep(5);
 
    }
}