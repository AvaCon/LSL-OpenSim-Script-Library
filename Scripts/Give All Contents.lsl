//Give All Contents - Fleep Fave
 
list    gInventoryList;
 
list getInventoryList()
{
    integer    i;
    integer    n = llGetInventoryNumber(INVENTORY_ALL);
    list          result = [];
 
    for( i = 0; i < n; i++ )
    {
        result += [ llGetInventoryName(INVENTORY_ALL, i) ];
    }
    return result;
}
 
default
{
    state_entry()
    {
        gInventoryList = getInventoryList();
 
    }
 
    touch_start( integer n )
    {
 
        integer i;
 
        for( i = 0; i < n; i++ )
        {
            llGiveInventoryList(llDetectedKey(i), llGetObjectName(), gInventoryList );
 
        }
    }
 
    changed( integer change )
    {
       if ( change == CHANGED_INVENTORY )
           gInventoryList = getInventoryList();
    }
}