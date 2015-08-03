string myID="Not Set";
integer channel=-814591;
integer listen_handle;
string controllerName="Digital Signs Controller";
 
default
{
    state_entry()
    {
        string desc = llGetObjectDesc();
        list items = llParseString2List(desc, [":"], [""]);
        if(llGetListLength(items)>1)
        {
            myID = llStringTrim(llList2String(items, 1),STRING_TRIM);
        }
        if(myID == "Not Set")
        {
            llWhisper(0, "Please set this sign's ID in the prim description!");
            llSetObjectDesc("ID: Not Set");
        } else {
            llWhisper(0, "Ready with ID: " + myID);
        }
        listen_handle = llListen(channel, controllerName, NULL_KEY, "");
    }
    on_rez(integer count)
    {
        llResetScript();
    }
    changed(integer change)
    {
       if(change & (CHANGED_REGION | CHANGED_REGION_START | CHANGED_OWNER)) llResetScript();
    }
    listen(integer channel, string name, key id, string msg)
    {
        list items = llParseString2List(msg, [":"], [""]);
        if(llGetListLength(items)==1)
        {
            string cmd=llStringTrim(llList2String(items, 0),STRING_TRIM);
            if(cmd=="Query") llRegionSay(channel, llGetObjectName() + " : " + myID  + " : " + (string)llGetPos() + " : " +(string)llGetRot() + " : " + llGetTexture(1));
            if(cmd=="Reset") llResetScript();
        }
        if(llGetListLength(items)>1)
        {
            string msgID = llStringTrim(llList2String(items, 0),STRING_TRIM);
            if(msgID==myID)
            {
                string textureUUID=llStringTrim(llList2String(items, 1),STRING_TRIM);
                llWhisper(0,"Received command to set texture UUID to: " + textureUUID);
                llSetLinkPrimitiveParamsFast(1, [PRIM_TEXTURE, 3, textureUUID, <1.0,1.0,1.0>, <0.0,0.0,0.0>, 270*DEG_TO_RAD ]);
                llSetLinkPrimitiveParamsFast(1, [PRIM_TEXTURE, 1, textureUUID, <1.0,1.0,1.0>, <0.0,0.0,0.0>, 270*DEG_TO_RAD ]);
            }
        }
    }
}
 