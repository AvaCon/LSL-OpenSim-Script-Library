// Get LinkNumber Script
//
// Written by Joel Gross (SL: Ringo Moonstone)
//
// Distributed under Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License.
// http://creativecommons.org/licenses/by-nc-sa/3.0/
//
// --------------------------------------------------
 
default
{
    state_entry()
    {
    llOwnerSay("Link Number:" + (string)llGetLinkNumber());
    } //end state_entry
 
 link_message(integer sender_num, integer num, string dialog, key id)
    {
       // if(dialog == "getLinkNumbers"){
       //   llOwnerSay("Blank Panel Link Number:" + (string)llGetLinkNumber());
       // }
    }
 
} //end default