list buttons = ["Status", "Template", "Program", "Reset"];
string dialogInfo = "\nUse Scan Signs to get a list of all Digital Signs and their state in the Region via Notecard. Edit the notecard and place it in this prims inventory, then choose Program Signs to set each sign's texture. Reset instructs all signs to re-read their ID tag.";
 
string myName="Digital Signs Controller";
 
integer debug=1;
key ToucherID;
integer dialogChannel;
integer listenHandle1;
 
integer signsChannel=-814591;
integer listenHandle2;
 
list queryResult;
integer querying=0;
 
string noteCardStatusName="Digital Signs Status Report";
string noteCardTemplateName="Digital Signs Settings Template";
string noteCardProgramName="Digital Signs Settings";
 
list ListItemDeleteAllButOne(list mylist, string element)
{
    integer notdone=1;
    while(notdone)
    {
        integer placeinlist = llListFindList(mylist, [element]);
        if(placeinlist != -1) mylist = llDeleteSubList(mylist, placeinlist, placeinlist);
        else notdone=0;
        //if(debug) llWhisper(0, "ListItemDeleteAllButOne: " + element + " | " + (string)mylist + " | " + placeinlist);
    }
    mylist = [element] + mylist;
    return mylist;
}
 
makeStatusNotecard()
{
    integer ll=llGetListLength(queryResult);
    if(ll>0)
    {
        string queryLine;
        list noteCard;
        integer i=0;
        noteCard = ["//  This is a status notecard showing the current settings information for all Digital Signs on the region."];
        noteCard += ["//  Each Digital Sign has an ID in it's prim Description field in the format ID: MyStringID "];
        noteCard += ["//  We use MyStringID as an address to which we can send new settings for things like the sign texture."];
        noteCard += [""];
        for(; i<ll; ++i)
        {
            queryLine=llList2String(queryResult, i);
            list items = llParseString2List(queryLine, [":"], [""]);
            if(llGetListLength(items)==5)
            {
                noteCard += ["Sign Name  : " + llList2String(items, 0)];
                noteCard += ["Sign ID    : " + llList2String(items, 1)];
                noteCard += ["Location   : " + llList2String(items, 2)];
                noteCard += ["Rotation   : " + llList2String(items, 3)];
                noteCard += ["TextureUUID: " + llList2String(items, 4)];
                noteCard += [""];
            }
        }
        osMakeNotecard(noteCardStatusName, noteCard);
        llGiveInventory(ToucherID, noteCardStatusName);
        llRemoveInventory(noteCardStatusName);
    } else llWhisper(0, "No Digital Signs could be found!");
}
makeTemplateNotecard()
{
    integer ll=llGetListLength(queryResult);
    if(ll>0)
    {
        string queryLine;
        list signList;
        list noteCard;
        integer i=0;
        for(; i<ll; ++i)
        {
            queryLine=llList2String(queryResult, i);
            list items = llParseString2List(queryLine, [":"], [""]);
            if(llGetListLength(items)==5) signList += [llStringTrim(llList2String(items, 1),STRING_TRIM) + " : " + llStringTrim(llList2String(items, 4),STRING_TRIM)];
        }
        if(debug) llWhisper(0, (string)signList);
        i=0;
        while(i<llGetListLength(signList))
        {
            signList = ListItemDeleteAllButOne(signList, llList2String(signList, i));
            i++;
            //if(debug) llWhisper(0, (string)signList);
        }
        noteCard = ["//  This is a template notecard containing the current settings information for all Digital Signs on the region."];
        noteCard += ["//  Each Digital Sign has an ID in it's prim Description field in the format ID: MyStringID "];
        noteCard += ["//  In this notecard you can target one or more Digital Sign IDs and send them settings data."];
        noteCard += ["//  The format is:"];
        noteCard += ["//  MyStringID : TextureUUID"];
        noteCard += ["//   ....one per line. MyStringID is the Sign's ID string, TextureUUID is the UUID of a texture that the sign should display."];
        noteCard += [""];
        noteCard += ["//  The data below is what is in the region at the moment and is provided as a template."];
        noteCard += ["//  You should edit this notecard to substitute new settings for each sign ID, then rename it to '" + noteCardProgramName + "' "];
        noteCard += ["//  before you *replace* it back in the Controller's inventory."];
        noteCard += ["//  Please look out for signs that currently have the same ID, but different textures."];
        noteCard += ["//  You'll *will* need to fix the ID on these signs locally if you're sure the textures should be different, because we'll"];
        noteCard += ["//  overwrite them all by the (last) ID read from this file when you hit the 'Program' button!"];
        noteCard += [""];
        noteCard += llListSort(signList, 1, FALSE);
        osMakeNotecard(noteCardTemplateName, noteCard);
        llGiveInventory(ToucherID, noteCardTemplateName);
        llRemoveInventory(noteCardTemplateName);
    } else llWhisper(0, "No Digital Signs could be found!");
}
list readProgramNotecard()
{
    list notecardData;
    integer i;
    string line;
    integer t = llGetInventoryType(noteCardProgramName);
    if(t==INVENTORY_NOTECARD)
    {
        integer nl=osGetNumberOfNotecardLines(noteCardProgramName);
        if(nl>0)
        {
            for(i=1; i<nl; i++)
            {
                line=llStringTrim(osGetNotecardLine(noteCardProgramName, i),STRING_TRIM);
                if(line != "" & llSubStringIndex(line, "//")!=0)
                {
                    notecardData += [line];
                }
            }
        }
    } else llWhisper(0, "A notecard with the name '" + noteCardProgramName + "' must be present in the Controller's Inventory!");
 
    return notecardData;
}
 
default
{
    state_entry()
    {
        dialogChannel = -1 - (integer)("0x" + llGetSubString( (string)llGetKey(), -7, -1) );
        llWhisper(0, myName + " Active");
        llSetText(myName, <1.0,1.0,1.0>, 1.0);
    }
    on_rez(integer count)
    {
        llResetScript();
    }
    touch_start(integer num_detected)
    {
        ToucherID = llDetectedKey(0);
        llListenRemove(listenHandle1);
        llListenRemove(listenHandle2);
        listenHandle1 = llListen(dialogChannel, "", ToucherID, "");
        llDialog(ToucherID, dialogInfo, buttons, dialogChannel);
        llSetTimerEvent(60.0); // Here we set a time limit for responses
    }
    timer()
    {
        llSetTimerEvent(0.0);
        llListenRemove(listenHandle1);
        llListenRemove(listenHandle2);
        if(querying==1)
        {
            makeStatusNotecard();
            querying=0;
        }
        if(querying==2)
        {
            makeTemplateNotecard();
            querying=0;
        }
    }
    listen(integer channel, string name, key id, string msg)
    {
        if(channel==dialogChannel)
        {
            llListenRemove(listenHandle1);
            if(msg == llList2String(buttons, 0)) //list
            {
                listenHandle2 = llListen(signsChannel, "", NULL_KEY, "");
                queryResult = [];
                querying=1;
                llRegionSay(signsChannel, "Query");
                llSetTimerEvent(5.0);
                llWhisper(0, "Please wait while we query the status of all the Digital Signs on the region....");
            }
            if(msg == llList2String(buttons, 1)) //template
            {
                listenHandle2 = llListen(signsChannel, "", NULL_KEY, "");
                queryResult = [];
                querying=2;
                llRegionSay(signsChannel, "Query");
                llSetTimerEvent(5.0);
                llWhisper(0, "Please wait while we create a template notecard for all of the Digital Signs on the region....");
            }
            if(msg == llList2String(buttons, 2)) //program
            {
                list data=readProgramNotecard();
                integer i=0;
                integer nl=llGetListLength(data);
                if(nl>0)
                {
                    llWhisper(0,"Sending the following data to all Digital Signs:");
                    for(;i<nl;i++)
                    {
                        llWhisper(0,llList2String(data, i));
                        llRegionSay(signsChannel, llList2String(data, i));
                    }
                }
            }
            if(msg == llList2String(buttons, 3)) //reset
            {
                llRegionSay(signsChannel, "Reset");
                llWhisper(0, "Please wait while all the Digital Signs in the region re-read their ID tag....");
            }
        }
        if(channel==signsChannel)
        {
            if(debug) llWhisper(0,"Received: " + msg);
            queryResult += [msg];
        }
    }
}
 