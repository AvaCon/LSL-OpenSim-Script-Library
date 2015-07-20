// This script keeps a list of messages.
// The owner can play the messages back and erase them.
 
// Global variables
list message_list;
integer listen_id = -1;  // Lets us turn off listening when we need to
string current_speaker_name = "";  // Who is currently recording a message
 
readList()
{
    integer i;
 
    integer count = llGetListLength( message_list );
    llSay( 0, "You have " + (string) count + " messages:" );
    for( i = 0; i < count; i++ )
    {
        llSay( 0, (string)(i+1) + ": " + llList2String(message_list, i) );
    }
}
 
resetList()
{
    message_list = llDeleteSubList(message_list, 0, llGetListLength(message_list));
    llSay( 0, "Erased all messages.");
}
 
addMessage( string name, string message )
{
    string full_message = name + " said, '" + message + "'";
    message_list += full_message;
}
 
default
{
    on_rez( integer start_param )
    {
        // re-initialize
        message_list = llDeleteSubList(message_list, 0, llGetListLength(message_list));
        listen_id = -1;
        current_speaker_name = "";
    }
 
    // Listen to a single line, spoken by the person who pressed
    // the "Leave Message" button.
    listen( integer channel, string name, key id, string message )
    {
        if( (channel == 0) && (current_speaker_name == name ) )
        {
            addMessage( current_speaker_name, message );
            llListenRemove( listen_id );
            current_speaker_name = "";
            listen_id = -1;
            llSay(0, "Message recorded: " + message );
        }
    }
 
    // Process messages from buttons
    link_message(integer sender_num, integer num, string message, key id)
    {
        // Uses a standard button message format:
        // "Button Message, <button name>, key=<user key>, <user name>"
 
        // Convert comma-separated-values into a list
        list msg_list = llCSV2List( message );
        if( llList2String( msg_list, 0) == "Button Message" )
        {
 
            string sender_name = llList2String( msg_list, 1);
            key user_key = llList2Key( msg_list, 2);
            string user_name = llList2String( msg_list, 3);
 
            if( sender_name == "leave_message_btn" )
            {
                current_speaker_name = user_name;
                if( listen_id != -1 )
                {
                    llListenRemove( listen_id );
                }
 
                listen_id = llListen( 0, user_name, "", "" );
                llSay(0, "Leave a one-line message after the beep...BEEP!" );
            }
            else
            if( sender_name == "play_messages_btn" )
            {
                if( user_key == llGetOwner() )
                {
                    readList();
                }
            }
            else
            if( sender_name == "erase_messages_btn" )
            {
                if( user_key == llGetOwner() )
                {
                    resetList();
                }
            }
        }
   }
}