// Script Name: Put_a_number_on_all_faces_of_a_prim.lsl
//This script is used to put a number of the prims face on each prim.  Then you can use the prim number in scripts to texture any single face.
 
// Downloaded from : http://www.free-lsl-scripts.com/cgi/freescripts.plx?ID=1446
 
// This program is free software; you can redistribute it and/or modify it.
// Additional Licenes may apply that prevent you from selling this code
// and these licenses may require you to publish any changes you make on request.
//
// There are literally thousands of hours of work in these scripts. Please respect
// the creators wishes and follow their license requirements.
//
// Any License information included herein must be included in any script you give out or use.
// Licenses are included in the script or comments by the original author, in which case
// the authors license must be followed.
 
// A GNU license, if attached by the author, means the original code must be FREE.
// Modifications can be made and products sold with the scripts in them.
// You cannot attach a license to make this GNU License
// more or less restrictive.  see http://www.gnu.org/copyleft/gpl.html
 
// Creative Commons licenses apply to all scripts from the Second Life
// wiki and script library and are Copyrighted by Linden Lab. See
// http://creativecommons.org/licenses/
 
// Please leave any author credits and headers intact in any script you use or publish.
// If you don't like these restrictions, then don't use these scripts.
//////////////////////// ORIGINAL AUTHORS CODE BEGINS ////////////////////////////////////////////
display( integer value, integer face )
{
    float cell_width = 0.25;    // in this example the width
    float cell_height = 0.25;   // and height are the same
 
    llSetTexture("9e59ddf7-d7c3-5248-0894-00ce2154ee8e", face );
    llScaleTexture( cell_width, cell_height, face );
    if ( value == 0 )
        llOffsetTexture( -1.5 * cell_width, 1.5 * cell_height, face );
    else if ( value == 1 )
        llOffsetTexture( -0.5 * cell_width, 1.5 * cell_height, face );
    else if ( value == 2 )
        llOffsetTexture( 0.5 * cell_width, 1.5 * cell_height, face );
    else if ( value == 3 )
        llOffsetTexture( 1.5 * cell_width, 1.5 * cell_height, face );
    else if ( value == 4 )
        llOffsetTexture( -1.5 * cell_width, 0.5 * cell_height, face );
    else if ( value == 5 )
        llOffsetTexture( -0.5 * cell_width, 0.5 * cell_height, face );
    else if ( value == 6 )
        llOffsetTexture( 0.5 * cell_width, 0.5 * cell_height, face );
    else if ( value == 7 )
        llOffsetTexture( 1.5 * cell_width, 0.5 * cell_height, face );
    else if ( value == 8 )
        llOffsetTexture( -1.5 * cell_width, -0.5 * cell_height, face );
    else if ( value == 9 )
        llOffsetTexture( -0.5 * cell_width, -0.5 * cell_height, face );
    else if ( value == 10 )
        llOffsetTexture( 0.5 * cell_width, -0.5 * cell_height, face );
    else if ( value == 11 )
        llOffsetTexture( 1.5 * cell_width, -0.5 * cell_height, face );
    else if ( value == 12 )
        llOffsetTexture( -1.5 * cell_width, -1.5 * cell_height, face );
    else if ( value == 13 )
        llOffsetTexture( -0.5 * cell_width, -1.5 * cell_height, face );
    else if ( value == 14 )
        llOffsetTexture( 0.5 * cell_width, -1.5 * cell_height, face );
    else if ( value == 15 )
        llOffsetTexture( 1.5 * cell_width, -1.5 * cell_height, face );
}
 
default
{
    state_entry()
    {
        integer i;
 
        for ( i = 0; i < llGetNumberOfSides(); i++ )
            display( i, i );
    }
 
    changed( integer changed_flag )
    {
        if ( (changed_flag == CHANGED_SHAPE) ||
             (changed_flag == CHANGED_SCALE)    )
            llResetScript();
    }
}