integer Vector_Sender = FALSE;
integer ACTIVE_TAB = 0;
string OPTION;
integer FOUND = FALSE;
 
list Background_Textures = [
"OSCC-overall map main",
"OSCC-overall map conference",
"OSCC-overall map sponsors",
"OSCC-overall map link regions"
];
 
list Navigation = [
<0.00000, 1.00000 ,0.000000>, //Button 1 - Top Left
<0.289270,0.955127,0.000000>, //Button 1 - Bottom Right
<0.289270,1.00000, 0.000000>, //Button 2 - Top Left
<0.594942,0.955127,0.000000>, //Button 2 - Bottom Right
<0.594942,1.00000, 0.000000>, //Button 3 - Top Left
<0.771346,0.955127,0.000000>, //Button 3 - Bottom Right
<0.771346,1.000000,0.000000>, //Button 4 - Top Left
<1.000000,0.955127,0.000000>  //Button 4 - Bottom Right
];
 
list Tab0 = [
//Tab0-0 - Expo3
<0.074775,0.931695,0.000000>, //Button 1 - Top Left
<0.131575,0.875367,0.000000>, //Button 1 - Bottom Right
//Tab0-1 - Expo4
<0.138204,0.931414,0.000000>, //Button 2 - Top Left
<0.191118,0.876002,0.000000>, //Button 2 - Bottom Right
//Tab0-2 - Expo5
<0.197340,0.929869,0.000000>, //Button 3 - Top Left
<0.250998,0.874223,0.000000>, //Button 3 - Bottom Right
//Tab0-3 - Expo6
<0.258295,0.931916,0.000000>, //Button 4 - Top Left
<0.312614,0.873658,0.000000>,  //Button 4 - Bottom Right
//Tab0-4 - Expo7
<0.319610,0.931580,0.000000>, 
<0.373570,0.875512,0.000000>,  
//Tab0-5 - Expo8
<0.380187,0.931223,0.000000>, 
<0.433674,0.874922,0.000000>,
//Tab0-6 - B1
<0.074895,0.811773,0.000000>, 
<0.131933,0.753744,0.000000>,
//Tab0-7 - Expo1
<0.258115,0.811152,0.000000>, 
<0.314883,0.755261,0.000000>,
//Tab0-8 - B2
<0.379609,0.811067,0.000000>, 
<0.435310,0.752770,0.000000>,
//Tab0-9 - L3
<0.076064,0.688914,0.000000>, 
<0.131063,0.632068,0.000000>,
//Tab0-10 - L4
<0.380103,0.689392,0.000000>, 
<0.436921,0.631703,0.000000>,
//Tab0-11 - K3
<0.197157,0.629104,0.000000>, 
<0.254769,0.571830,0.000000>,
//Tab0-12 - K4
<0.258390,0.629618,0.000000>, 
<0.315305,0.571782,0.000000>,
//Tab0-13 - K1
<0.196869,0.568586,0.000000>, 
<0.254838,0.510576,0.000000>,
//Tab0-14 - K2
<0.259009,0.568535,0.000000>, 
<0.315208,0.510508,0.000000>,
//Tab0-15 - L1
<0.074961,0.506719,0.000000>, 
<0.132396,0.449413,0.000000>,
//Tab0-16 - L2
<0.379234,0.505753,0.000000>, 
<0.437635,0.449036,0.000000>,
//Tab0-17 - B3
<0.016057,0.385509,0.000000>, 
<0.070838,0.329028,0.000000>,
//Tab0-18 - B4
<0.136197,0.385477,0.000000>, 
<0.192451,0.330101,0.000000>,
//Tab0-19 - B5
<0.320057,0.385751,0.000000>, 
<0.376191,0.328911,0.000000>,
//Tab0-20 - B6
<0.441501,0.386054,0.000000>, 
<0.497798,0.329602,0.000000>,
//Tab0-21 - Sponsor Link Regions
<0.136307,0.263636,0.000000>, 
<0.375447,0.026254,0.000000>,
 
// -----LEGEND------
 
//Tab0-22 - Landing Zone 1
<0.530559,0.849864,0.000000>, 
<0.724278,0.829706,0.000000>,  
//Tab0-23 - Landing Zone 2
<0.530085,0.820052,0.000000>, 
<0.727954,0.800934,0.000000>,
//Tab0-24 - Landing Zone 3
<0.529586,0.788875,0.000000>, 
<0.728009,0.770803,0.000000>,
//Tab0-25 - Landing Zone 4
<0.530295,0.757523,0.000000>, 
<0.728070,0.738077,0.000000>,
//Tab0-26 - Keynote 1
<0.529309,0.695507,0.000000>, 
<0.668245,0.679470,0.000000>,
//Tab0-27 - Keynote 2
<0.531284,0.666081,0.000000>, 
<0.669360,0.647456,0.000000>,
//Tab0-28 - Keynote 3
<0.530820,0.636502,0.000000>, 
<0.670489,0.617740,0.000000>,
//Tab0-29 - Keynote 4
<0.531562,0.605523,0.000000>, 
<0.669158,0.587870,0.000000>,
//Tab0-30 - Breakout Zone 1
<0.531100,0.545200,0.000000>, 
<0.919221,0.527349,0.000000>,
//Tab0-31 - Breakout Zone 2
<0.531975,0.514508,0.000000>, 
<0.970748,0.495125,0.000000>,
//Tab0-32 - Breakout Zone 3
<0.532115,0.483421,0.000000>, 
<0.953723,0.465168,0.000000>,
//Tab0-33 - Breakout Zone 4
<0.531605,0.453530,0.000000>, 
<0.859198,0.433837,0.000000>,
//Tab0-34 - Breakout Zone 5
<0.531094,0.423486,0.000000>, 
<0.847269,0.404983,0.000000>,
//Tab0-35 - Breakout Zone 6
<0.530580,0.393288,0.000000>, 
<0.979399,0.373556,0.000000>,
//Tab0-36 - Expo Zone 1
<0.531591,0.333111,0.000000>, 
<0.910630,0.310995,0.000000>,
//Tab0-37 - Expo zone 3 to 8
<0.530304,0.301269,0.000000>, 
<0.750932,0.283804,0.000000>,
//Tab0-38 - Sponor Link Regions
<0.531229,0.270915,0.000000>, 
<0.788874,0.252318,0.000000>
];
 
list Tab1 = [
//Tab1-0 B1
<0.193679,0.927067,0.000000>, //Button 1 - Top Left
 <0.325505,0.793956,0.000000>, //Button 1 - Bottom Right
//Tab1-1 Expo1
<0.496632,0.927582,0.000000>, //Button 2 - Top Left
<0.630583,0.792862,0.000000>, //Button 2 - Bottom Right
//Tab1-2 B2
<0.665842,0.927868,0.000000>, //Button 3 - Top Left
<0.799592,0.794408,0.000000>, //Button 3 - Bottom Right
//Tab1-3 L3
<0.192746,0.760635,0.000000>, //Button 4 - Top Left
<0.324110,0.626943,0.000000>,  //Button 4 - Bottom Right 
//Tab1-4 L4
<0.665391,0.760998,0.000000>,
<0.800065,0.626957,0.000000>, 
//Tab1-5 K3
<0.356216,0.619934,0.000000>,
<0.489499,0.484451,0.000000>, 
//Tab1-6 K4
<0.496445,0.619933,0.000000>,
<0.630722,0.485764,0.000000>,
//Tab1-7 K1
<0.355459,0.478879,0.000000>,
<0.489541,0.344585,0.000000>,
//Tab1-8 K2
<0.496500,0.478768,0.000000>,
<0.630138,0.342933,0.000000>,
//Tab1-9 L1
<0.190442,0.337875,0.000000>,
<0.324124,0.200593,0.000000>,
//Tab1-10 L2
<0.665657,0.334254,0.000000>,
<0.798404,0.200945,0.000000>,
//Tab1-11 B3
<0.051516,0.169315,0.000000>,
<0.183800,0.034536,0.000000>,
//Tab1-12 B4
<0.335014,0.168606,0.000000>,
<0.466382,0.033619,0.000000>,
//Tab1-13 B5
<0.526413,0.168127,0.000000>,
<0.659108,0.035939,0.000000>, 
//Tab1-13 B6
<0.806535,0.167729,0.000000>,
<0.937862,0.032844,0.000000> 
];
 
list Tab2 = [
//Tab2-0 Expo 3
<0.009669,0.943258,0.000000>, //Button 1 - Top Left
<0.164482,0.786741,0.000000>, //Button 1 - Bottom Right
//Tab2-1 Expo 4
<0.174469,0.942163,0.000000>, //Button 2 - Top Left
<0.328051,0.787991,0.000000>, //Button 2 - Bottom Right
//Tab2-2 Expo 5
<0.337041,0.943442,0.000000>, //Button 3 - Top Left
<0.494398,0.787909,0.000000>, //Button 3 - Bottom Right
//Tab2-3 Expo 6
<0.502172,0.943335,0.000000>, //Button 4 - Top Left
<0.656953,0.787820,0.000000>,  //Button 4 - Bottom Right
//Tab2-4 Expo 7
<0.664653,0.943177,0.000000>, 
<0.820710,0.785294,0.000000>, 
//Tab2-5 Expo 8
<0.829161,0.942861,0.000000>, 
<0.986349,0.785142,0.000000>,
//Tab2-6 32 - Expo 4
<0.010952,0.737783,0.000000>, 
<0.286384,0.688621,0.000000>, 
//Tab2-7 33 -  Expo 6
<0.010335,0.463034,0.000000>, 
<0.144029,0.444213,0.000000>, 
//Tab2-8 34 - Expo 3
<0.010558,0.433682,0.000000>, 
<0.148690,0.412541,0.000000>, 
//Tab2-9 21 - expo 8
<0.009742,0.341521,0.000000>, 
<0.452996,0.321949,0.000000>, 
//Tab2-10 27 = expo 4
<0.010317,0.311441,0.000000>, 
<0.291718,0.291823,0.000000>, 
//Tab2-11 11 - expo 7
<0.010263,0.219900,0.000000>, 
<0.262194,0.199633,0.000000>, 
//Tab2-12 4 - expo 5
<0.010322,0.189176,0.000000>, 
<0.287346,0.170542,0.000000>, 
//Tab2-13 22 - expo 8
<0.010403,0.159052,0.000000>, 
<0.117058,0.138925,0.000000>, 
//Tab2-14 2, 3, 1 - expo 5
<0.010485,0.128793,0.000000>, 
<0.292348,0.045848,0.000000>, 
//Tab2-15 16 to 18 - expo 7
<0.503704,0.737678,0.000000>, 
<0.734677,0.566350,0.000000>, 
//Tab2-16 28 to 30 - expo 4
<0.503622,0.554511,0.000000>, 
<0.801047,0.471866,0.000000>, 
//Tab2-17 7 - expo 7
<0.503971,0.463825,0.000000>, 
<0.642905,0.444254,0.000000>, 
//Tab2-18 29 - expo 4
<0.502674,0.433364,0.000000>, 
<0.625851,0.412096,0.000000>, 
//Tab2-19 6,8,12 - expo 7
<0.503072,0.402782,0.000000>, 
<0.717719,0.323472,0.000000>, 
//Tab2-20 24 - expo 8
<0.503398,0.312046,0.000000>, 
<0.958908,0.292112,0.000000>, 
//Tab2-21 19, 14, -- expo 7
<0.503800,0.280993,0.000000>, 
<0.738937,0.230466,0.000000>, 
//Tab2-22 -- 
<0.502640,0.219261,0.000000>, 
<0.747658,0.198461,0.000000>, 
//Tab2-23 25, 23 - expo 8
<0.504133,0.188850,0.000000>, 
<0.980569,0.139110,0.000000>, 
//Tab2-24  5,15,10 - expo 7
<0.503174,0.129172,0.000000>, 
<0.887515,0.050799,0.000000>, 
//Tab2-25 26 - expo 8
<0.502615,0.037035,0.000000>, 
<0.732705,0.017948,0.000000>
];
 
list Tab3 = [
//Tab3-0 franco
<0.183365,0.927905,0.000000>, //Button 1 - Top Left
<0.335553,0.775921,0.000000>, //Button 1 - Bottom Right
//Tab3-1 Soboceanna
<0.341360,0.929626,0.000000>, //Button 2 - Top Left
<0.494552,0.774855,0.000000>, //Button 2 - Bottom Right
//Tab3-2 Fleepgrid
<0.498060,0.929437,0.000000>, //Button 3 - Top Left
<0.653349,0.773790,0.000000>, //Button 3 - Bottom Right
//Tab3-3 lfgrid
<0.657461,0.930196,0.000000>, //Button 4 - Top Left
<0.812799,0.775701,0.000000>,  //Button 4 - Bottom Right
//Tab3-4 Awesimworlds
<0.182214,0.770022,0.000000>, 
<0.337790,0.616642,0.000000>, 
//Tab3-5 hypergrid.org Metropolis
<0.341493,0.769052,0.000000>, 
<0.494449,0.617190,0.000000>, 
//Tab3-6 opensim-creations
<0.500475,0.768990,0.000000>, 
<0.652024,0.617240,0.000000>, 
//Tab3-7 3dles.com
<0.658108,0.770993,0.000000>, 
<0.814769,0.616218,0.000000>, 
//Tab3-8 Mechanicdreams
<0.181696,0.612784,0.000000>, 
<0.338157,0.458042,0.000000>, 
//Tab3-9 futurelab
<0.341967,0.612838,0.000000>, 
<0.495860,0.457091,0.000000>, 
//Tab3-10 2world2go
<0.500926,0.612891,0.000000>, 
<0.653313,0.458376,0.000000>, 
//Tab3-11 meetinstantly
<0.657538,0.611868,0.000000>, 
<0.813870,0.457429,0.000000>, 
//Tab3-12 old wild west
<0.182291,0.453395,0.000000>, 
<0.337573,0.299402,0.000000>, 
//Tab3-13 beta tech
<0.341399,0.453566,0.000000>, 
<0.496143,0.298523,0.000000>, 
//Tab3-14 Commonwealth
 <0.500280,0.452618,0.000000>, 
<0.653377,0.298807,0.000000>, 
//Tab3-15 Osgrid
<0.657812,0.453907,0.000000>, 
<0.813718,0.299095,0.000000>,
//Tab3-16 Bottom left 
<0.180878,0.294459,0.000000>, 
<0.337028,0.140448,0.000000>, 
//Tab3-17 Bottom second left
 <0.341972,0.292421,0.000000>, 
<0.494090,0.142054,0.000000>, 
//Tab3-18 Bottom third left
<0.499544,0.292710,0.000000>, 
<0.654316,0.142461,0.000000>, 
//Tab3-19 Bottom right
<0.659081,0.294165,0.000000>, 
<0.812090,0.141654,0.000000>
 
];
 
find_clicked_area(list buttons, string tabname, vector v){
    integer j = 0;
    integer length = llGetListLength(buttons)/2;
    for(j;j< length;j++){
        vector tl = llList2Vector(buttons, j * 2);
        vector br = llList2Vector(buttons, (j * 2) + 1);
        if(v.x > tl.x && v.x < br.x  && v.y < tl.y && v.y > br.y){
            OPTION = tabname + "-" + (string)j;
            FOUND = TRUE;
            j = length;
        }
    } 
}
 
default
{
    state_entry()
    {
       // llSay(0, "Script running");
    }
 
    touch_start(integer UV_detected){
 
 
        integer i=0;
        vector v=llDetectedTouchUV(i);
        if(Vector_Sender == TRUE){
        llOwnerSay("Touch UV Vector: "+(string)llDetectedTouchUV(i));}        
 
        for(i; i<UV_detected; ++i){
            FOUND = FALSE;
            OPTION = "";
            find_clicked_area(Navigation, "NAV", v);
 
            if((!FOUND) && (ACTIVE_TAB == 0)){
                find_clicked_area(Tab0, "Tab0" , v);
            }else if((!FOUND) && (ACTIVE_TAB == 1)){
                find_clicked_area(Tab1, "Tab1" , v);
            }else if((!FOUND) && (ACTIVE_TAB == 2)){
                find_clicked_area(Tab2, "Tab2" , v);
            }else if((!FOUND) && (ACTIVE_TAB == 3)){
                find_clicked_area(Tab3, "Tab3" , v);
            }
 
 
 
        if(FOUND){
            if(OPTION == "NAV-0"){
                ACTIVE_TAB = 0;
                llSetTexture(llList2String(Background_Textures, ACTIVE_TAB), 4);
 
            }else if(OPTION == "NAV-1"){
                ACTIVE_TAB = 1;
                llSetTexture(llList2String(Background_Textures, ACTIVE_TAB), 4);
 
            }else if(OPTION == "NAV-2"){
                ACTIVE_TAB = 2;
                llSetTexture(llList2String(Background_Textures, ACTIVE_TAB), 4);
 
            }else if(OPTION == "NAV-3"){
                ACTIVE_TAB = 3;
                llSetTexture(llList2String(Background_Textures, ACTIVE_TAB), 4);
 
            }else if((OPTION == "Tab0-0") || (OPTION == "Tab2-0") || (OPTION == "Tab2-8")){                
                llMapDestination("Expo Zone 3", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-1") || (OPTION == "Tab2-1") || (OPTION == "Tab2-6") || (OPTION == "Tab2-10") || (OPTION == "Tab2-16") || (OPTION == "Tab2-18")){
                llMapDestination("Expo Zone 4", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-2") || (OPTION == "Tab2-2") || (OPTION == "Tab2-12") || (OPTION == "Tab2-14")){
                llMapDestination("Expo Zone 5", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-3") || (OPTION == "Tab2-3") || (OPTION == "Tab2-7")){                
                llMapDestination("Expo Zone 6", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-4") || (OPTION == "Tab2-4") || (OPTION == "Tab2-11") || (OPTION == "Tab2-15") || (OPTION == "Tab2-17")  || (OPTION == "Tab2-19")  || (OPTION == "Tab2-21")  || (OPTION == "Tab2-24") ){
                llMapDestination("Expo Zone 7", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-5") || (OPTION == "Tab2-5")  || (OPTION == "Tab2-9")  || (OPTION == "Tab2-13")  || (OPTION == "Tab2-20")  || (OPTION == "Tab2-23")  || (OPTION == "Tab2-25")){
                llMapDestination("Expo Zone 8", <126, 126, 40>, ZERO_VECTOR);
                //http://hg.francogrid.org:80:OSCC13-FrancoGrid
                //llMapDestination("http://fleepgrid.com:8002/ FleepGrid Plaza", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-6") || (OPTION == "Tab0-30") || (OPTION == "Tab1-0")){
                llMapDestination("Breakout Zone 1", <134, 124, 26>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-7") || (OPTION == "Tab0-36")  || (OPTION == "Tab1-1")) {
                llMapDestination("Expo Zone 1", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-8") || (OPTION == "Tab0-31")  || (OPTION == "Tab1-2")){
                llMapDestination("Breakout Zone 2", <134, 124, 26>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-9") || (OPTION == "Tab0-24")  || (OPTION == "Tab1-3")){
                llMapDestination("Landing Zone 3", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-10") || (OPTION == "Tab0-25")  || (OPTION == "Tab1-4")){
                llMapDestination("Landing Zone 4", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-11") || (OPTION == "Tab0-28")  || (OPTION == "Tab1-5")){
                llMapDestination("Keynote 3", <235, 20, 22>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-12") || (OPTION == "Tab0-29")  || (OPTION == "Tab1-6")){
                llMapDestination("Keynote 4", <21, 20, 22>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-13") || (OPTION == "Tab0-26") || (OPTION == "Tab1-7")){
                llMapDestination("Keynote 1", <250, 252, 22>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-14") || (OPTION == "Tab0-27") || (OPTION == "Tab1-8")){
                llMapDestination("Keynote 2", <21, 234, 22>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-15") || (OPTION == "Tab0-22") || (OPTION == "Tab1-9")){
                llMapDestination("Landing Zone 1", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-16") || (OPTION == "Tab0-23") || (OPTION == "Tab1-10")){
                llMapDestination("Landing Zone 2", <126, 126, 40>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-17") || (OPTION == "Tab0-32")  || (OPTION == "Tab1-11")){
                llMapDestination("Breakout Zone 3", <134, 124, 26>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-18") || (OPTION == "Tab0-33")  || (OPTION == "Tab1-12")){
                llMapDestination("Breakout Zone 4", <134, 124, 26>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-19") || (OPTION == "Tab0-34")  || (OPTION == "Tab1-13")){
                llMapDestination("Breakout Zone 5", <134, 124, 26>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-20") || (OPTION == "Tab0-35")  || (OPTION == "Tab1-14")){
                llMapDestination("Breakout Zone 6", <134, 124, 26>, ZERO_VECTOR);
 
            }else if((OPTION == "Tab0-21") || (OPTION == "Tab0-38")){
                ACTIVE_TAB = 3;
                llSetTexture(llList2String(Background_Textures, ACTIVE_TAB), 4);
 
            }else if(OPTION == "Tab0-37"){
                llRegionSayTo(llDetectedKey(i),0, "Click on one of the Expo Zones on the map.");
 
            }else if(OPTION == "Tab2-22"){
                llRegionSayTo(llDetectedKey(i),0, "This Sponsor has no Region.");
 
            }else if(OPTION == "Tab3-0"){
                llMapDestination("http://hg.francogrid.org:80/", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-1"){
                llMapDestination("http://grid.suboceana.fr:8002/ SV3D", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-2"){
                llMapDestination("http://fleepgrid.com:8002/ FleepGrid Plaza", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-3"){
                llMapDestination("http://lfgrid.com:8002/ Littlefield Welcome", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-4"){
                llMapDestination("http://Awesimworlds.com:8002/ AweSim", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-5"){
                llMapDestination("http://hypergrid.org:8002/", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-6"){
                llMapDestination("http://opensim-creations.com:9000/ Palmhouse", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-7"){
                llMapDestination("http://opensim.3dles.com:8002/", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-8"){
                llMapDestination("http://hypergrid.org:8002/ MechanicDreams", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-9"){
                llMapDestination("http://hypergrid.org:8002/ Futurelab", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-10"){
                llMapDestination("http://hg.osgrid.org:80/ 2worlds2go", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-11"){
                llMapDestination("http://hg.meetinstantly.com:80/ Welcome Center", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-12"){
                llMapDestination("http://hg.osgrid.org:80/ Old Wild West", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-13"){
                llMapDestination("http://opensim.betatechnologies.info:8002/", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-14"){
                llMapDestination("http://hg.osgrid.org:80/ Commonwealth Central", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-15"){
                llMapDestination("http://hg.osgrid.org:80/", <126, 126, 40>, ZERO_VECTOR);
 
 
                //Fleep add the last 4 link regions under here. from left to right 
            }else if(OPTION == "Tab3-16"){
                //llMapDestination("http://hg.francogrid.org:80/", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-17"){
                //llMapDestination("http://hg.francogrid.org:80/", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-18"){
                //llMapDestination("http://hg.francogrid.org:80/", <126, 126, 40>, ZERO_VECTOR);
 
            }else if(OPTION == "Tab3-19"){
                //llMapDestination("http://hg.francogrid.org:80/", <126, 126, 40>, ZERO_VECTOR);
 
            }
 
        }
        }
 
    }
}