integer expires;
 
// This function takes 8 arguments, the first six are the date and time.
// GMToffset is adjust it based on the timezome. Use -8 for the SL clock.
// DST should be TRUE or FALSE depending on daylight savings time.
integer MakeUNIXTime( integer year, integer month, integer day, integer hour, integer minute, integer second, integer GMToffset, integer DST ) {
    list month_days = [ 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334 ];
    integer time = ( year - 1970 ) * 31536000;
    time += ( day + llList2Integer( month_days, month - 1 ) - 1 ) * 86400;
    time += ( hour - GMToffset ) * 3600 + minute * 60 + second;
    if ( DST == TRUE ) {
        time += -3600;
    }
    if ( year > 1972 ) {
        integer past_leap_years = (integer)( ( year - 1969 ) / 4 );
        time += past_leap_years * 86400;
    }
    if ( year % 4 == 0 && month > 2 ) {
        time += 86400;
    }
    return time;
}
 
default {
    state_entry() {
        // July 1, 2006, 12:15:00 PST/SL Time (see the function above for filling the values for this)
        expires = MakeUNIXTime( 2006, 7, 1, 12, 15, 0, -8, TRUE );
        llSetTimerEvent( 1.0 );
    }
    timer() {
        integer seconds = expires - llGetUnixTime();
        if( seconds > 0 ) {
            integer days = seconds / 86400;
            integer hours = ( seconds - ( days * 86400 ) ) / 3600;
            integer minutes = ( seconds - ( days * 86400 ) - ( hours * 3600 ) ) / 60;
            seconds = ( seconds - ( days * 86400 ) - ( hours * 3600 ) - ( minutes * 60 ) );
            string s1 = " days, ";
            if( days == 1 ) {
                s1 = " day, ";
            }
            string s2 = " hours, ";
            if ( hours == 1 ) {
                s2 = " hour, ";
            }
            string s3 = " minutes, and ";
            if ( minutes == 1 ) {
                s3 = " minute, and ";
            }
            string s4 = " seconds left";
            if ( seconds == 1 ) {
                s4 = " second left";
            }
            llSetText( (string)days + s1 + (string)hours + s2 + (string)minutes + s3 + (string)seconds + s4, <1.0,1.0,1.0>, 1.0 );
        }
        else {
            state expired;
        }
    }
}
 
state expired {
    state_entry() {
        llSetText( "Expired", <1.0,1.0,1.0>, 1.0 );
    }
}