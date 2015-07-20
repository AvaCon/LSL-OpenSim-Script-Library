//
//
// Touch UV Made Easy Script
// Created By: Joshewa Daniels
// Join Group: College Of Scripting
// Show Your Appreciation Make A Donation.
// Description:
// This script will allow you to create a multiple button
// positions on a prims, will help to reduce prim counts
// and reduce the need for multiple scripts to do what one can
// Will allow you to make more dynamic creation that reduce lag
// Setup Instructions:
// •Step 1• Set The Vector Sender To TRUE to say the vector.
// •Step 2• For each button you setup you need to get the vector
// For the top Left Corner and also the bottom Right
// this is done by just clicking on the prim to have it say
// the vector position of the part you touched.
// •Step 3• Paste the vector for each position by replacing
// the ones setup for the example.
 
// into your script for your button positions
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
// Vector Sender Will Tell You The Vector Position On Touch
// TRUE = On, FALSE = Off
 integer Vector_Sender = FALSE;// Set To TRUE To Say Vector
// integer Vector_Sender = TRUE;// Set To TRUE To Say Vector
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
// Button Setup Below Change Vector For Your Buttons
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
//
//  Start of Row 1
//
// Button 1 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_1_TL = <0.01907, 0.80846, 0.00000>;// Top Left
vector BV_1_BR = <0.67159, 0.65658, 0.00000>;// Bottom Right
// Button 2 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_2_TL = <0.00348, 0.61155, 0.00000>;// Top Left
vector BV_2_BR = <0.66824, 0.47629, 0.00000>;// Bottom Right
// Button 3 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_3_TL = <0.00667, 0.43364, 0.00000>;// Top Left
vector BV_3_BR = <0.66870, 0.29234, 0.00000>;// Bottom Right
// Button 4 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_4_TL = <0.00764, 0.25534, 0.00000>;// Top Left
vector BV_4_BR = <0.65918, 0.06151, 0.00000>;// Bottom Right
//
//  End of Row 1
//
//  Start of Row 2
//
// Button 5 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_5_TL = <0.76224, 0.71665, 0.00000>;// Top Left
vector BV_5_BR = <0.97554, 0.58480, 0.00000>;// Bottom Right
// Button 6 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_6_TL = <0.76463, 0.56813, 0.00000>;// Top Left
vector BV_6_BR = <0.97494, 0.44000, 0.00000>;// Bottom Right
// Button 7 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_7_TL = <0.77367, 0.41422, 0.00000>;// Top Left
vector BV_7_BR = <0.96873, 0.29705, 0.00000>;// Bottom Right
// Button 8 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_8_TL = <0.77622, 0.25989, 0.00000>;// Top Left
vector BV_8_BR = <0.97104, 0.13855, 0.00000>;// Bottom Right
//
//  End of Row 2
//
//  Start of Row 3
//
// Button 9 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_9_TL = <0.00000, 0.00000, 0.00000>;// Top Left
vector BV_9_BR = <0.00000, 0.00000, 0.00000>;// Bottom Right
// Button 10 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_10_TL = <0.00000, 0.00000, 0.00000>;// Top Left
vector BV_10_BR = <0.00000, 0.00000, 0.00000>;// Bottom Right
// Button 11 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_11_TL = <0.00000, 0.00000, 0.00000>;// Top Left
vector BV_11_BR = <0.00000, 0.00000, 0.00000>;// Bottom Right
// Button 12 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_12_TL = <0.00000, 0.00000, 0.00000>;// Top Left
vector BV_12_BR = <0.00000, 0.00000, 0.00000>;// Bottom Right
//
//  End of Row 3
//
//  Start of Row 4
//
// Button 13 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_13_TL = <0.00000, 0.00000, 0.00000>;// Top Left
vector BV_13_BR = <0.00000, 0.00000, 0.00000>;// Bottom Right
// Button 14 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_14_TL = <0.00000, 0.00000, 0.00000>;// Top Left
vector BV_14_BR = <0.00000, 0.00000, 0.00000>;// Bottom Right
// Button 15 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_15_TL = <0.00000, 0.00000, 0.00000>;// Top Left
vector BV_15_BR = <0.00000, 0.00000, 0.00000>;// Bottom Right
// Button 16 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_16_TL = <0.00000, 0.00000, 0.00000>;// Top Left
vector BV_16_BR = <0.00000, 0.00000, 0.00000>;// Bottom Right
//
//  End of Row 4
//
//  Start of Row 5
//
// Button 17 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_17_TL = <0.08016, 0.49438, 0.00000>;// Top Left
vector BV_17_BR = <0.23949, 0.43205, 0.00000>;// Bottom Right
// Button 18 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_18_TL = <0.30239, 0.49438, 0.00000>;// Top Left
vector BV_18_BR = <0.46172, 0.43205, 0.00000>;// Bottom Right
// Button 19 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_19_TL = <0.53301, 0.49249, 0.00000>;// Top Left
vector BV_19_BR = <0.69653, 0.43583, 0.00000>;// Bottom Right
// Button 20 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_20_TL = <0.75524, 0.49438, 0.00000>;// Top Left
vector BV_20_BR = <0.91877, 0.43016, 0.00000>;// Bottom Right
//
//  End of Row 5
//
//  Start of Row 6
//
// Button 21 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_21_TL = <0.08016, 0.38861, 0.00000>;// Top Left
vector BV_21_BR = <0.24369, 0.33384, 0.00000>;// Bottom Right
// Button 22 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_22_TL = <0.30658, 0.39050, 0.00000>;// Top Left
vector BV_22_BR = <0.46592, 0.33573, 0.00000>;// Bottom Right
// Button 23 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_23_TL = <0.53301, 0.38861, 0.00000>;// Top Left
vector BV_23_BR = <0.69234, 0.33006, 0.00000>;// Bottom Right
// Button 24 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_24_TL = <0.75943, 0.38861, 0.00000>;// Top Left
vector BV_24_BR = <0.91457, 0.33195, 0.00000>;// Bottom Right
//
//  End of Row 6
//
//  Start of Row 7
//
// Button 25 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_25_TL = <0.07177, 0.28662, 0.00000>;// Top Left
vector BV_25_BR = <0.25207, 0.23185, 0.00000>;// Bottom Right
// Button 26 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_26_TL = <0.30239, 0.29229, 0.00000>;// Top Left
vector BV_26_BR = <0.45753, 0.23563, 0.00000>;// Bottom Right
// Button 27 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_27_TL = <0.53301, 0.28851, 0.00000>;// Top Left
vector BV_27_BR = <0.69653, 0.23374, 0.00000>;// Bottom Right
// Button 28 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_28_TL = <0.75524, 0.29040, 0.00000>;// Top Left
vector BV_28_BR = <0.91877, 0.22807, 0.00000>;// Bottom Right
//
//  End of Row 7
//
//  Start of Row 8
//
// Button 29 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_29_TL = <0.06758, 0.18841, 0.00000>;// Top Left
vector BV_29_BR = <0.24369, 0.12986, 0.00000>;// Bottom Right
// Button 30 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_30_TL = <0.30239, 0.19407, 0.00000>;// Top Left
vector BV_30_BR = <0.47850, 0.13364, 0.00000>;// Bottom Right
// Button 31 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_31_TL = <0.52881, 0.19030, 0.00000>;// Top Left
vector BV_31_BR = <0.70073, 0.12986, 0.00000>;// Bottom Right
// Button 32 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_32_TL = <0.74685, 0.18463, 0.00000>;// Top Left
vector BV_32_BR = <0.91038, 0.13175, 0.00000>;// Bottom Right
//
//  End of Row 8
//
//  Start of Row 9
//
// Button 33 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_33_TL = <0.07596, 0.09397, 0.00000>;// Top Left
vector BV_33_BR = <0.23530, 0.02976, 0.00000>;// Bottom Right
// Button 34 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_34_TL = <0.29820, 0.09397, 0.00000>;// Top Left
vector BV_34_BR = <0.49108, 0.02787, 0.00000>;// Bottom Right
// Button 35 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_35_TL = <0.53301, 0.08831, 0.00000>;// Top Left
vector BV_35_BR = <0.70492, 0.03731, 0.00000>;// Bottom Right
// Button 36 ••••••••••••••••••••••••••••••••••••••••••••••••
vector BV_36_TL = <0.74685, 0.09209, 0.00000>;// Top Left
vector BV_36_BR = <0.92296, 0.03165, 0.00000>;// Bottom Right
//
//  End of Row 9
//
///_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
integer i;vector  v;
default{
state_entry(){
llSetTexture("c934b40f-c52d-3fb0-8555-7c2d1583fc6d",4);     // face 4 Face's the user in Hud form
}
touch_start(integer UV_detected){
i=0;v=llDetectedTouchUV(i);
if(Vector_Sender == TRUE){
llOwnerSay("Touch UV Vector: "+(string)llDetectedTouchUV(i));}
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
for(; i<UV_detected; ++i){//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
// Buttons & Functions  //_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
//
//  Start of Row 1
//
// BUTTON 1  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
if(v.x > BV_1_TL.x && v.x < BV_1_BR.x  && v.y < BV_1_TL.y && v.y > BV_1_BR.y){
llMapDestination("University of Cincinnati", <126, 48, 52>, ZERO_VECTOR);}
// BUTTON 2  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
if(v.x > BV_2_TL.x && v.x < BV_2_BR.x  && v.y < BV_2_TL.y && v.y > BV_2_BR.y){
llMapDestination("University of Cincinnati", <126, 48, 42>, ZERO_VECTOR);}
// BUTTON 3  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
if(v.x > BV_3_TL.x && v.x < BV_3_BR.x  && v.y < BV_3_TL.y && v.y > BV_3_BR.y){
llMapDestination("University of Cincinnati", <126, 48, 32>, ZERO_VECTOR);}
// BUTTON 4  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
if(v.x > BV_4_TL.x && v.x < BV_4_BR.x  && v.y < BV_4_TL.y && v.y > BV_4_BR.y){
llMapDestination("University of Cincinnati", <117, 65, 23>, ZERO_VECTOR);}
//
//  End of Row 1
//
//  Start of Row 2
if(v.x > BV_5_TL.x && v.x < BV_5_BR.x  && v.y < BV_5_TL.y && v.y > BV_5_BR.y){
llMapDestination("University of Cincinnati", <126, 48, 52>, ZERO_VECTOR);}
// BUTTON 6  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
if(v.x > BV_2_TL.x && v.x < BV_6_BR.x  && v.y < BV_6_TL.y && v.y > BV_6_BR.y){
llMapDestination("University of Cincinnati", <126, 48, 42>, ZERO_VECTOR);}
// BUTTON 7  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
if(v.x > BV_7_TL.x && v.x < BV_7_BR.x  && v.y < BV_7_TL.y && v.y > BV_7_BR.y){
llMapDestination("University of Cincinnati", <126, 48, 32>, ZERO_VECTOR);}
// BUTTON 8  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
if(v.x > BV_8_TL.x && v.x < BV_8_BR.x  && v.y < BV_8_TL.y && v.y > BV_8_BR.y){
llMapDestination("University of Cincinnati", <117, 65, 23>, ZERO_VECTOR);}
//
//  End of Row 2
//
//  Start of Row 3
//if(v.x > BV_9_TL.x && v.x < BV_9_BR.x  && v.y < BV_9_TL.y && v.y > BV_9_BR.y){
//llSay(0," ");}
// BUTTON 10  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_10_TL.x && v.x < BV_10_BR.x  && v.y < BV_10_TL.y && v.y > BV_10_BR.y){
//llSay(0," ");}
// BUTTON 11  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_11_TL.x && v.x < BV_11_BR.x  && v.y < BV_11_TL.y && v.y > BV_11_BR.y){
//llSay(0," ");}
// BUTTON 12  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_12_TL.x && v.x < BV_12_BR.x  && v.y < BV_12_TL.y && v.y > BV_12_BR.y){
//llSay(0," ");}
//
//  End of Row 3
//
//  Start of Row 4
//if(v.x > BV_13_TL.x && v.x < BV_13_BR.x  && v.y < BV_13_TL.y && v.y > BV_13_BR.y){
//llSay(0," ");}
// BUTTON 14  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_14_TL.x && v.x < BV_14_BR.x  && v.y < BV_14_TL.y && v.y > BV_14_BR.y){
//llSay(0," ");}
// BUTTON 15  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_15_TL.x && v.x < BV_15_BR.x  && v.y < BV_15_TL.y && v.y > BV_15_BR.y){
//llSay(0," ");}
// BUTTON 16  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_16_TL.x && v.x < BV_16_BR.x  && v.y < BV_16_TL.y && v.y > BV_16_BR.y){
//llSay(0," ");}
//
//  End of Row 4
//
//  Start of Row 5
//if(v.x > BV_17_TL.x && v.x < BV_17_BR.x  && v.y < BV_17_TL.y && v.y > BV_17_BR.y){
//llSay(0," ");}
// BUTTON 18  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_18_TL.x && v.x < BV_18_BR.x  && v.y < BV_18_TL.y && v.y > BV_18_BR.y){
//llSay(0," ");}
// BUTTON 19  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_19_TL.x && v.x < BV_19_BR.x  && v.y < BV_19_TL.y && v.y > BV_19_BR.y){
//llSay(0," ");}
// BUTTON 20  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_20_TL.x && v.x < BV_20_BR.x  && v.y < BV_20_TL.y && v.y > BV_20_BR.y){
//llSay(0," ");}
//
//  End of Row 5
//
//  Start of Row 6
//if(v.x > BV_21_TL.x && v.x < BV_21_BR.x  && v.y < BV_21_TL.y && v.y > BV_21_BR.y){
//llSay(0," ");}
// BUTTON 22  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_22_TL.x && v.x < BV_22_BR.x  && v.y < BV_22_TL.y && v.y > BV_22_BR.y){
//llSay(0," ");}
// BUTTON 23  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_23_TL.x && v.x < BV_23_BR.x  && v.y < BV_23_TL.y && v.y > BV_23_BR.y){
//llSay(0," ");}
// BUTTON 24  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_24_TL.x && v.x < BV_24_BR.x  && v.y < BV_24_TL.y && v.y > BV_24_BR.y){
//llSay(0," ");}
//
//  End of Row 6
//
//  Start of Row 7
//if(v.x > BV_25_TL.x && v.x < BV_25_BR.x  && v.y < BV_25_TL.y && v.y > BV_25_BR.y){
//llSay(0," ");}
// BUTTON 26  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_26_TL.x && v.x < BV_26_BR.x  && v.y < BV_26_TL.y && v.y > BV_26_BR.y){
//llSay(0," ");}
// BUTTON 27  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_27_TL.x && v.x < BV_27_BR.x  && v.y < BV_27_TL.y && v.y > BV_27_BR.y){
//llSay(0," ");}
// BUTTON 28  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_28_TL.x && v.x < BV_28_BR.x  && v.y < BV_28_TL.y && v.y > BV_28_BR.y){
//llSay(0," ");}
//
//  End of Row 7
//
//  Start of Row 8
//if(v.x > BV_29_TL.x && v.x < BV_29_BR.x  && v.y < BV_29_TL.y && v.y > BV_29_BR.y){
//llSay(0," ");}
// BUTTON 30  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_30_TL.x && v.x < BV_30_BR.x  && v.y < BV_30_TL.y && v.y > BV_30_BR.y){
//llSay(0," ");}
// BUTTON 31  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_31_TL.x && v.x < BV_31_BR.x  && v.y < BV_31_TL.y && v.y > BV_31_BR.y){
//llSay(0," ");}
// BUTTON 32  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_32_TL.x && v.x < BV_32_BR.x  && v.y < BV_32_TL.y && v.y > BV_32_BR.y){
//llSay(0," ");}
//
//  End of Row 8
//
//  Start of Row 9
//if(v.x > BV_33_TL.x && v.x < BV_33_BR.x  && v.y < BV_33_TL.y && v.y > BV_33_BR.y){
//llSay(0," ");}
// BUTTON 34  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_34_TL.x && v.x < BV_34_BR.x  && v.y < BV_34_TL.y && v.y > BV_34_BR.y){
//llSay(0," ");}
// BUTTON 35  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_35_TL.x && v.x < BV_35_BR.x  && v.y < BV_35_TL.y && v.y > BV_35_BR.y){
//llSay(0," ");}
// BUTTON 36  •••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••••
//if(v.x > BV_36_TL.x && v.x < BV_36_BR.x  && v.y < BV_36_TL.y && v.y > BV_36_BR.y){
//llSay(0," ");}
//
//  End of Row 9
//
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
}}}///_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/