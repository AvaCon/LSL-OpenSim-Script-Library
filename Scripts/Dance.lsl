//Dance
 
list dances = [ "BackFlip","dance1", "dance2", "dance3", "dance4" ];
integer WHICH = 0;
integer TOTAL = 5;
integer PERMS = 0;
integer ON = FALSE;
 
default
{
    state_entry()
    {
        llRequestPermissions(llGetOwner(), PERMISSION_TRIGGER_ANIMATION);
        llSetTimerEvent(1.0);
        llListen(0, "", llGetOwner(), "");
    }
 
    timer()
    {
        PERMS = llGetPermissions();
        if (PERMS & PERMISSION_TRIGGER_ANIMATION)
        {
            if (ON == TRUE)
            {
                llStopAnimation(llList2String(dances, WHICH - 1));
                llStartAnimation(llList2String(dances, WHICH));
                WHICH++;
                if (WHICH >= TOTAL)
                {
                    WHICH = 0;
                }
            } else if (ON == 2)
            {
                llStopAnimation(llList2String(dances, WHICH - 1));
                WHICH = (integer)llFrand(TOTAL + 0.999);
                llStartAnimation(llList2String(dances, WHICH));
            }
        }
    }
 
    listen(integer channel, string name, key id, string message)
    {
        if (channel == 0 && id == llGetOwner())
        {
            if (message == "doff")
            {
                ON = FALSE;
            } else if (ON == FALSE && message == "don")
            {
                if (!(PERMS & PERMISSION_TRIGGER_ANIMATION))
                {
                    llRequestPermissions(llGetOwner(), PERMISSION_TRIGGER_ANIMATION);
                }
                ON = TRUE;
            } else if (ON == FALSE && message == "dancer")
            {
                if (!(PERMS & PERMISSION_TRIGGER_ANIMATION))
                {
                    llRequestPermissions(llGetOwner(), PERMISSION_TRIGGER_ANIMATION);
                }
                ON = 2;
            }
        }
    }
}