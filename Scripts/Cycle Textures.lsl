//Cycle Textures
 
default
{
    state_entry()
    {
        llSetText("Glass Texture Bundle", <0,1,0>,1);
        llSetTimerEvent(5.0);
    }
    timer()
    {
        integer number = llGetInventoryNumber(INVENTORY_TEXTURE);
        float rand = llFrand(number);
        integer choice = (integer)rand;
        string name = llGetInventoryName(INVENTORY_TEXTURE, choice);
        if (name != "")
            llSetTexture(name, 4);
    }
}
 