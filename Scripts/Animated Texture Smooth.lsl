//Animation Smooth
 
// anim SMOOTH Script
// By Doug Linden (I think)

// The double slash means these lines are comments
// and ignored by the computer.
 
// All scripts have a default state, this will be
// the first code executed.
default
{
    // state_entry() is an event handler, it executes
    // whenever a state is entered.
    state_entry()
    {
        // llSetTextureAnim() is a function that animates a texture on a face.
        llSetTextureAnim(ANIM_ON | SMOOTH | LOOP, ALL_SIDES,1,1,1.0, 1,0.25);
                            // animate the script to scroll across all the faces.
    }
 
 
}