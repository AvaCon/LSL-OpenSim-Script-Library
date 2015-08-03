//By: Xeno Cao
//(Open Source) Please Share or feel free to mod   ^_^
//Please do not sell this script as is.
//
//This is a tool I like to use when building things I need to know wich number the prims are, for scripting.
//Just drop in the Main/Adult prim of the linked object.
//In this newer version the script doesn't self clean and you can now click any prim and find it's link number in the object.
//Makes it a little more helpful. Enjoy.
 
default
{
    state_entry()
    {
        llSay(0, "My Link Number is "+(string)llGetLinkNumber());
    }
    touch_start(integer num_detected)
    {
        integer i = 0;
        for(; i<num_detected; ++i)
            llSay(0,"The touched primative's link number is "+(string)llDetectedLinkNumber(i));
    }
}