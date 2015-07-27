//Chat Logger (GPL
//
//Code adapted from: http://www.simteach.com/wiki/index.php?title=SL_Chat_Logger (by Patch Lamington) which is covered by GNU Free Documentation License (http://www.gnu.org/copyleft/fdl.html) in the spirit of which this script is GPL'd. Copyright (C) 2007 Nobody Fugazi/T. Rampersad
 
//(This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. The GPL license: [1]
 
//You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 
//Change Log:
 
//    * March 15, 2008: Fixed memory leaks & cleaned up the whitespace. (SO)
// * January 12, 2007: Text output in HTML, Requests permissions from user before logging chat. (NF/TR)
 
list names;
list speech;
list colours=["002EB8","FF6633","006600","660066","660033","663300","1A9900","FF14B1","001A99","B88A00"];
list unique_names;
list ignore_names;
list buffer_await;
 
list ALLOW_MENU = ["sure", "no way"]; // the main menu
integer CHANNEL = 42; // Life, the Universe, and Everything.
integer HandleDialogListen;
 
default
{
    state_entry()
    {
        llSetText("This is a GPL Chat Logger.\n We request permission before recording.",<0.0, 0.0, 0.0>, 1.0);
        integer i = 0;
        integer c = llGetListLength(names);
        for (;i < c;++i)
        {
            llSetObjectName("<font color=#" + llList2String(colours,
                    llListFindList(unique_names, llList2List(names,i,i))
                    % llGetListLength(colours))
                + ">" + llList2String(names,i) );
            llOwnerSay( llList2String(speech,i) + "</font>" );
        }
        names = speech = unique_names = [];
        llSetObjectName("GPL ChatLogger 0.1");
    }
 
    on_rez(integer i)
    {
        llResetScript();
    }
 
    touch_start(integer total_number)
    {
        if (llDetectedKey(0) == llGetOwner() )
        {
            llSay(0, "Beginning Chat Logging.");
            state chat_logging;
        }
    }
}
 
state chat_logging
{
    state_entry()
    {
        llListen(0,"",NULL_KEY,"");
        buffer_await = [];
    }
 
    on_rez(integer i)
    {
        llOwnerSay("Logging still active! Touch to get playback");
    }
 
    timer()
    {
        // If the dialog is hanging out doing nothing too long, kill the llListen
        llListenRemove(HandleDialogListen);
        buffer_await = [];
    }
 
    touch_start(integer total_number)
    {
        if (llDetectedKey(0) == llGetOwner() )
        {
            llSay(0, "chat logging now off - replaying log!.");
            buffer_await = [];
            state default;
        }
    }
 
    listen(integer channel, string name, key id, string message)
    {
        if (llGetOwnerKey(id) == id)//only listen to avatars (they own themselves)
        {
            // Is this a message from the permissions dialog?
            list temp_name = (list)name;
            if (channel == CHANNEL)
            {
                if (~llListFindList(ALLOW_MENU, [message]))
                {
                    // we'll need this from the strided list.
                    integer buffer_loc;
 
                    if (~(buffer_loc = llListFindList(ignore_names, temp_name)))
                    {
                        ignore_names = llDeleteSubList(ignore_names, buffer_loc, buffer_loc);
                    }
                    if (~(buffer_loc = llListFindList(unique_names, temp_name)))
                    {
                        unique_names = llDeleteSubList(unique_names, buffer_loc, buffer_loc);
                    }
                    if (message == "sure")
                    {
                        unique_names += name;
                        while (~(buffer_loc = llListFindList(buffer_await, temp_name)))
                        {
                            // buffered message is worthwhile, so add it:
                            names += llList2String(buffer_await, buffer_loc);
                            speech += llList2String(buffer_await, buffer_loc + 1);
                            buffer_await = llDeleteSubList(buffer_await, buffer_loc, buffer_loc + 1);
                        }
                    }
                    else
                    {
                        ignore_names += name;
                        while (~(buffer_loc = llListFindList(buffer_await, temp_name)))
                        {
                            buffer_await = llDeleteSubList(buffer_await, buffer_loc, buffer_loc + 1);
                        }
                    }
                    if (buffer_await == [])
                    {
                        llListenRemove(HandleDialogListen);
                    }
                }
            }
            else if (!~llListFindList(ignore_names, temp_name))
            {
                if (!~llListFindList(unique_names, temp_name))
                {
                    //Check if avatar will give permissions
                    if (!~llListFindList(buffer_await, temp_name))
                    {
                        if (buffer_await == [])
                        {
                            HandleDialogListen = llListen(CHANNEL, "", NULL_KEY, "");
                        }
                        llDialog(id, "Hello. This is a chat logger. If you give us permission, your participation will be recorded. May we have your permission?", ALLOW_MENU, CHANNEL);
                        // Give people 1.5 minutes to respond,
                        // else kill the llListen in timer()
                        llSetTimerEvent(0.0);
                        llSetTimerEvent(90.0);
                    }
                    // store in strided buffer in case last message is to be permed.
                    buffer_await += temp_name + (key)message;
                }
                else
                {
                    names += name;
                    speech += message;
                }
            }
        }
    }
}