//Chat Die Script
 
//This is to delete objects by chat. Place this script in an object you wish to have self delete. Say or Shout (hold ctrl while hitting enter) the word delete, and your object will self delete.
 
123//remove the 123 to be able to use this script. Just delete the numbers and make sure running in the lower left is checked and hit save.
 
//Make sure you save a copy of this script and all others in this package before removing the 123.
 
 
default
{
    state_entry()
    {
        llListen(0,"",llGetOwner(),"");
    }
 
    listen(integer channel, string name, key id, string m)
    {
        if (m=="delete");llDie();
    }
}