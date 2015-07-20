default //Pushes anything that collides with it straight up
{
    collision_start(integer num_detected)
    {
        llPushObject(llDetectedKey(num_detected - 1), <0,0,5000>, ZERO_VECTOR, FALSE);
    }
}