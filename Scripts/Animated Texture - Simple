//Animated Texture - Simple
 
// SCRIPT_NAME = "animated texture-simple";
// DESCRIPTION = "animated the texture my offseting the texture at intervals";
 
//by bUTTONpUSHER Jones
//Mod by BuhBuhCuh Fairchild
//v 1.0
 
// global variables
integer gCellsAcross = 72;
integer gCellsDown  = 1;
// seconds between cells
float gSwitchTime  = 0.000;
float gOffsetU;
float gOffsetV;
float gScaleU;
float gScaleV;
 
key gKey;
vector gScale;
 
 
// all scripts start in the default state
default
{
    //this state will allow colors to be set
    state_entry()
    {
 
        gScaleU = 1/(float)gCellsAcross;
        gScaleV = 1/(float)gCellsDown;
        // U range is -0.5 to 0.5 left to right
        // V range is 0.5 to -0.5 top to bottom
        // divided by 2 to put focus at the center of the cell
        gOffsetU = -0.5 + gScaleU / 2;
        gOffsetV = 0.5 - gScaleV / 2;
// next line automatically scales the texture
//        llScaleTexture(gScaleU, gScaleV, -1);
 
// next line focuses the texture on the last cell - for use if this is a click-started animation
//        llOffsetTexture(0.5-gScaleU/2, -0.5+gScaleV/2, -1);
 
        state Movie;
    }
 
}
 
state Movie
{
    state_entry()
    {
    integer i;
    integer j;
    integer k;
    float OffsetU;
    float OffsetV;
    @Loophere;
    // set local offset variables equal to global offset constants
    OffsetU = gOffsetU;
    OffsetV = gOffsetV;
 
    for (i=0; i<gCellsDown; i++)
    {
 
        for (j=0; j<gCellsAcross; j++)
        {
 
            llOffsetTexture(OffsetU, OffsetV, -1);
            llSleep(gSwitchTime);
            OffsetU = OffsetU + gScaleU;
        }
        OffsetU = OffsetU - 1.0;
        OffsetV = OffsetV - gScaleV;
 
    }
 
    jump Loophere;
}
 
}
