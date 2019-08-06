string animation = "name of your anim";

default{

  attach(key id){
      if (id){     // is a valid key and not NULL_KEY
        llRequestPermissions(id, PERMISSION_TRIGGER_ANIMATION);
      }else{
        llStopAnimation(animation); // stop the started animation
        llResetScript(); // release the avatar animation permissions
      }
   }
   
   run_time_permissions(integer perm){
      if (perm & PERMISSION_TRIGGER_ANIMATION){
          llStartAnimation(animation);
      }
   }
}
