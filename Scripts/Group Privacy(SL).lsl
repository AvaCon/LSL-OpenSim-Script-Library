//Group Privacy
 
//////////////////////////////////////////////////////////////////////////////////////
//
//    Version 1.0 Release
//    Copyright (C) 2007, Chance Unknown
//
//    This library is free software; you can redistribute it and/or
//    modify it under the terms of the GNU Lesser General Public License
//    as published by the Free Software Foundation; either
//    version 2.1 of the License, or (at your option) any later version.
//
//    This library is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU Lesser General Public License for more details.
//
//    You should have received a copy of the GNU Lesser General Public License
//    along with this library; if not, write to the Free Software
//    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
//////////////////////////////////////////////////////////////////////////////////////
 
float duration = 60.0;          // Duration of Land Ban Following the Eject (1Hr)
float RANGE = 40.0;             // Scan Range (40m)
float RATE = 2.0;               // Scan Rate (2 Sec)
 
integer status;
 
off()
{
    status = FALSE;
 
    llSensorRemove();
 
    llSetColor(<1,1,1>, ALL_SIDES);
 
    llSay(0, "Deactivated.");
 
    llSetText("Group Privacy\nOff\n\nTouch to Turn On", <1,1,1>, 1.0);
}
 
on()
{
    status = TRUE;
 
    llSensorRepeat("", NULL_KEY, AGENT, RANGE, PI, RATE);
 
    llSetColor(<1,0,0>, ALL_SIDES);
 
    llSay(0, "Activated while group memebers are present.");
 
    llSetText("Group Privacy\nOn\n\nTouch to Turn Off", <1,1,1>, 0.5);
}
 
boot(key id)
{
    if (llOverMyLand(id) == TRUE)
    {
        llUnSit(id);
 
        llEjectFromLand(id);
 
        llAddToLandBanList(id, duration); // Hour of Ban
    }
}
 
default
{
    state_entry()
    {
        off();
    }
 
    touch_start(integer num_detected)
    {
        if (llGetLandOwnerAt(llGetPos()) != llGetOwner())
        {
            llSay(0, "Deed device to match land group.");
 
            return;
        }
 
        if (llSameGroup(llDetectedKey(0)) == TRUE)
        {
            if (status == FALSE)
            {
                on();
            }
            else
            {
                off();
            }
        }
 
        else
        {
            llSay(0, "Authorized to group members only.");
        }
    }
 
    sensor(integer num_detected)
    {
        integer i;
 
        integer group_members = 0;
 
        for (i = 0; i != num_detected; i++)
        {
            if (llSameGroup(llDetectedKey(i)) == FALSE)
            {
                boot(llDetectedKey(i));
            }
 
            else
            {
                llRemoveFromLandBanList(llDetectedKey(i));
 
                group_members++;
            }
        }
 
        if (group_members == 0)
        {
            off();
        }
    }
 
    no_sensor()
    {
        off();
    }
}