//Blog Feed Script
 
default
{
    state_entry()
    {
        llHTTPRequest("http://blog.secondlife.com/feed",[],"");
    }
    http_response(key id,integer status,list metadat,string body)
    {
        list a = llParseString2List(body,["description>"],[]);
        list b = llParseString2List(llList2String(a,1),["</"],[]);
        string Desc = llList2String(b,0);
        list c = llParseString2List(body,["<title>"],[]);
        list d = llParseString2List(llList2String(c,1),["</"],[]);
        string Start = llList2String(d,0);
        d = [];
        list e = llParseString2List(body,["<pubDate>"],[]);
        list f = llParseString2List(llList2String(e,1),["+0000"],[]);
        string Date = llList2String(f,0);
        f= [];
        list g = llParseString2List(llList2String(c,2),["</"],[]);
        string Title = llList2String(g,0);
        list get = llParseString2List(llList2String(g,0),["#38;"],[]);
        g = [];
        list h = llParseString2List(body,["<description><![CDATA["],[]);
        f = llParseString2List(llList2String(h,1),["]]></description>"],[]);
        string Info = llList2String(f,0);
        list j = llParseString2List(Info,["#38;"],[]);
        if(llGetListLength(j) > 0)
        {
            Info = "";
            integer i;
            for(i = 0;i < llGetListLength(j);i++)
            {
                Info += llList2String(j,i);
            }
        }
        if(llGetListLength(get) > 0)
        {
            Title = "";
            integer i;
            for(i = 0;i < llGetListLength(get);i++)
            {
                Title += llList2String(get,i);
            }
        }
        j = llParseString2List(Info,["."],[]);
        if(llGetListLength(j) > 0 & llStringLength(Info) > 700)
        {
            llSay(0,"Second Life Blog"+"\n"+Title+"\n"+Desc+"\n"+Start+"\n"+Date);
            integer i;
            for(i = 0;i < llGetListLength(j);i++)
            {
                llSay(0,llList2String(j,i));
            }
        }
        else
        {
            llSay(0,"Second Life Blog"+"\n"+Title+"\n"+Desc+"\n"+Start+"\n"+Date+"\n"+Info);
        }
    }
}