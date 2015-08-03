//Dialogue Menu SB Dialog
 
integer sbDialog(key keyAgent, string strMessage, list lstButtons, integer intChannel) {
    integer intHandle;
 
    lstButtons =
        llList2List(lstButtons, -3, -1) +
        llList2List(lstButtons, -6, -4) +
        llList2List(lstButtons, -9, -7) +
        llList2List(lstButtons, -12, -10);
 
    intHandle = llListen(intChannel, "", keyAgent, "");
    llDialog(keyAgent, strMessage, lstButtons, intChannel);
    return intHandle;
}