//GiveAllContents 2.1 - Give to Anyone
 
// Copyright 2004, Trimming Hedges.  Released to the public domain.
 
// This is a simple script that gives everything in a box to the person who clicked.
// By default, it will only give items to the owner of the box.
 
// I wrote this because of all the texture bundles that are given out.  It's really a PAIN
// to move a lot of textures or other contents out of a box.  This speeds that up.
 
// This is NOT a vending script.  You can use this script to give everything in a box to someone, by changing 'owneronly' to be 0.  BUT:
//
//  I suggest not using this script in an area where several people are going to touch it at once, because giving inventory is slow.
//  Version 2.0 of this script now detects multiple simultaneous touches: it is still slow, but it should work better at classes or events.
 
//  THIS IS NOT A VENDING SCRIPT.  It gives items away, it does NOT SELL THEM.  (You don't need a script for most vending anyway.)
//  This script doesn't give itself away.  If you want it to, put it in the box, and set it to not running.
//  Then rename a copy and put that in the box too.  The renamed copy should be the running one.
//  Rename it FIRST, I had weird issues with renaming it when it was already in
//  the box. (version 1.2.12 of SL.)
 
integer owneronly = 1;
key owner;
 
default
{
    state_entry()
    {
        owner = llGetOwner();
    }
 
    touch_start(integer total_number)
    {
        integer i;
        for (i=0;i<total_number;i++)
        {
            key target = llDetectedKey(i);
 
            if ( (target != owner) && (owneronly == 1) )  // person clicking isn't owner and owneronly is set;
            {
                llInstantMessage(target,"Sorry, only the owner is allowed to get my contents.");
                return;
            }
            list inventory_types = [INVENTORY_BODYPART,INVENTORY_CLOTHING,INVENTORY_LANDMARK,INVENTORY_NOTECARD,INVENTORY_OBJECT,INVENTORY_SCRIPT,INVENTORY_SOUND,INVENTORY_TEXTURE];
            integer inventory_count = llGetListLength(inventory_types);
            integer j;
            integer k;
            integer type;
            integer typecount;
            string myname = llGetScriptName();
            string objectname;
 
            for (j=0; j<inventory_count;j++)
            {
                type = llList2Integer(inventory_types,j); // get the next inventory type from the list
                typecount = llGetInventoryNumber(type);  // how many of that kind of inventory is in the box?
                if (typecount > 0)
                {
                    for (k=0; k<typecount;k++)
                    {
                        objectname = llGetInventoryName(type,k);
                        if (objectname != myname)  // don't give self out so the user doesn't get fifty thousand copies.
                        {
                            llGiveInventory(target,objectname);
                        }
                    }
                }
            }
        }
    }
}