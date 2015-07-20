//  Purpose
//  --------------------------------------------------------------
//  This is a basic example of how you can create a simple radar
//  to detect Avatars within a given distance around the object
//  that this script resides in.  Names will be viewed above the
//  object along with distance (in meters).
 
//  Requirements
//  --------------------------------------------------------------
//  A single prim is all that is necessary for this example.
 
 
 
//  GLOBAL VARIABLES
//  --------------------------------------------------------------
 
float   g_Range     = 96.0;     //  The range of the sensor in meters
float   g_Arc       = PI;       //  The arc of the sensor
float   g_Rate      = 1.0;      //  The repeat rate of the sensor in seconds
vector  g_TextColor = <1,1,1>;  //  Text color <1,1,1> = White
 
 
 
//  EVENTS
//  --------------------------------------------------------------
 
default
{
    state_entry()
    {
        //  ------------------------------------------------------
        //  This is the entry-point of the script.  After a script
        //  has been saved or reset, this event will fire off first
        //  ------------------------------------------------------
 
        //  We call llSetText() first to "clear" the text above the object
        //  passing an empty string into the text parameter.
        llSetText("", g_TextColor, TRUE);
 
        //  We then call the llSensorRepeat() function to start detecting
        //  avatars.  This function will raise the sensor() event handle
        //  at a rate of g_Rate seconds.
        llSensorRepeat("", NULL_KEY, AGENT, g_Range, g_Arc, g_Rate);
 
        //  Since we passed an empty string and key value to the sensor,
        //  this tells the sensor that we want to look for any name with
        //  any key as long as it's an AGENT, which is a fancy name for
        //  Avatar.  If we wanted to look for a specific person only, we
        //  could simply pass their name and/or key into these arguments.
    }
 
    sensor(integer num_detected)
    {
        //  ------------------------------------------------------
        //  This event will fire off at the rate of g_Rate in seconds
        //  after being called by either llSensor() or llSensorRepeat()
        //  ------------------------------------------------------
 
        //  First we start out by declaring a local variable "output". This
        //  variable will store information we want in a string until we
        //  are ready to display it at the end.
        string output;
 
        //  The next variable sets up the for loop
        integer x;
 
        //  This next section will loop through each one of the num_detected
        //  items properly sensed (in this case, it will be AGENTS or Avatars)
        //  and store the results into the output string.
        for(x = 0 ; x < num_detected ; x++)
        {
            //  Using llVecDist(), we can quickly figure out the distance
            //  between 2 objects in 3D space.  To make it more readable, we
            //  store it as an integer so it truncates any decimal placements
            integer distance = (integer)llVecDist(llGetPos(), llDetectedPos(x));
            output += llDetectedName(x) + " (" + (string)distance + "m)\n";
 
            //  output += llDetectedName(x)...
            //      is the same as using
            //  output = output + llDetectedName(x)...
            //  The "\n" at the end is an escape sequence used for llSetText()
            //  to declare a new line.
        }
 
        //  When we have all the information collected, we can display it
        //  above the object using llSetText()
        llSetText(output, g_TextColor, TRUE);
    }
}