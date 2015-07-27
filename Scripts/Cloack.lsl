 
default
{
    state_entry()
    {
        key owner = llGetOwner();
        llWhisper(0,"Cloaking ready");
        llListen(0,"",owner,"");
    }
 
    listen( integer channel, string name, key id, string message )
    {
        if( message == "cloak" )
        {
            llSetStatus(STATUS_PHANTOM, TRUE);
            llWhisper(0,"Cloaking");
            llSetAlpha(0,ALL_SIDES);
        }
        if( message == "uncloak" )
        {
            llSetStatus(STATUS_PHANTOM, FALSE);
            llWhisper(0,"Uncloaking");
            llSetAlpha(1,ALL_SIDES);
        }
    }
}