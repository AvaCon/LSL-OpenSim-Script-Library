//Avatar Alert Script
 
integer switch=0;
key name;
 
default
{
    state_entry()
    {
        llWhisper(0,"Alert Script Active");
        name = llGetOwner();
    }
 
    touch_start(integer total_number)
    {
        if(switch==0)
        {
            switch=1;
            llSensorRepeat("","",AGENT,90.0,PI,20.0);
            llWhisper(0,"Alert on");
        }
        else if(switch==1)
        {
            switch=0;
            llSensorRemove();
            llWhisper(0,"Alert off");
        }
    }
 
    sensor(integer total_number)
    {
        vector pos = llGetPos();
        integer j;
        integer count = total_number;
        for (j = 0; j < count; j++)
        {
            if(llDetectedKey(j) != name)
            {
                float diff = llVecDist(pos,llDetectedPos(j));
                integer dist = llRound(diff);
                string result =  (llDetectedName(j)) + " " + ((string)dist) + "m";
                llWhisper(0,result);
            }
        }
    }
 
    no_sensor()
    {
        llWhisper(0,"Nothing Found");
    }
 
}