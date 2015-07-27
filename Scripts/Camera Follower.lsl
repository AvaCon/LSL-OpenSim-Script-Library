//  Purpose
//  --------------------------------------------------------------
//  This script shows you how you can make an object physical, and
//  have it follow your camera around.
 
//  Requirements
//  --------------------------------------------------------------
//  A single prim is all that is necessary for this example.
 
//  Usage
//  --------------------------------------------------------------
//  Permissions to track your camera are required for it to work
//  correctly.  Type "follow" to track the camera.  Type "stop" to
//  stop tracking the camera.  Touching the object will also start
//  tracking the camera.
 
//  GLOBALS
//  --------------------------------------------------------------
integer     g_ListenChannel = 0;        //  This is the listen channel
float       g_Timer         = 0.10;     //  This is the timer call rate
 
//  FUNCTIONS
//  --------------------------------------------------------------
permissions()
{
    //  Since this block of code is used more then once in the main
    //  loop, it's a good idea to make it a function.
 
    //  Get the permissions
    if(llGetPermissions() & PERMISSION_TRACK_CAMERA)
    {
        //  Permissions were passed, so we make the object physical
        //  and start the timer
        llSetStatus(STATUS_PHYSICS, TRUE);
        llSetTimerEvent(g_Timer);
    }
    else
    {
        //  Permissions were not passed, so we make the object static,
        //  set the timer to 0, and Request permissions.
        llSetStatus(STATUS_PHYSICS, FALSE);
        llSetTimerEvent(FALSE);
        llRequestPermissions(llGetOwner(), PERMISSION_TRACK_CAMERA);
    }
}
 
//  EVENTS
//  --------------------------------------------------------------
default
{
    state_entry()
    {
        //  Collision Sounds and Sprites can be replaced.  We make them
        //  empty strings so there are no sounds or sprites if the camera
        //  happens to knock up against a wall.
        llCollisionSound("", 0);
        llCollisionSprite("");
 
        //  Make a listener to listen for commands the owner may use.
        llListen(g_ListenChannel, "", llGetOwner(), "");
 
        //  Call the permissions() function block
        permissions();
    }
 
    on_rez(integer start_param)
    {
        //  The object was just rezzed out of inventory, so call up the
        //  permissions() function block
        permissions();
    }
 
    touch_start(integer num_detected)
    {
        //  The object was touched, so first we make sure that the owner
        //  touched the object, and if so... call the permissions()
        //  function block
        if(llDetectedKey(0) == llGetOwner()) permissions();
    }
 
    listen(integer channel, string name, key id, string message)
    {
        //  Turn all commands into lowercase using llToLower()
        message = llToLower(message);
        if(message == "stop")
        {
            //  The owner said "stop", so we'll turn off the object by
            //  making the object static, and setting the timer to 0
            llSetStatus(STATUS_PHYSICS, FALSE);
            llSetTimerEvent(FALSE);
        }
        else if(message == "follow")
        {
            //  The owner said "follow", so we call up the permissions()
            //  function block
            permissions();
        }
    }
 
    run_time_permissions(integer perm)
    {
        //  Permissions were requested through the permissions() function
        //  block.  Remember to use bitwise opperands when dealing with
        //  conditional statements for permissions.
        if(perm & PERMISSION_TRACK_CAMERA)
        {
            //  The owner granted permissions, so we set the object to
            //  physical, and fire up the timer.
            llSetStatus(STATUS_PHYSICS,TRUE);
            llSetTimerEvent(g_Timer);
        }
    }
 
    timer()
    {
        //  Here the timer uses llMoveToTarget() which simply moves the
        //  object to wherever the owner's camera is, and about 1 meter
        //  above (as to not obtruct the owner's view.  The owner will
        //  not be able to see the object under most circumstances, so if
        //  the owner wants to get rid of the object, they must first say
        //  "stop" in chat to make the object stop moving.  Then they can
        //  click on the object a lot easier to delete or take.
        llMoveToTarget(llGetCameraPos() + <0.0, 0.0, 1.0>, 0.20);
 
        //  Since the object looks a bit awkward only moving to position and
        //  not rotating properly, we call a simple sensor looking for the
        //  owner's current position.
        llSensor("", llGetOwner(), AGENT, 96, PI);
    }
 
    sensor(integer num_detected)
    {
        //  After we get the owner's position, we'll have the object just
        //  look at the owner using it's forward axis.  This gives a nice
        //  effect.  If you wanted to track the owners actual camera rotations
        //  then you would have to use llGetCameraRot() and make the correct
        //  calculations.  We do it this way for simplicity.
        llLookAt(llDetectedPos(0), 0.32, 0.32);
    }
}