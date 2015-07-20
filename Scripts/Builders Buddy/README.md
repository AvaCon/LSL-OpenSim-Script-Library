Information from http://forums.osgrid.org/viewtopic.php?f=5&t=1364

01. PRODUCT SUMMARY

Builder's Buddy lets ordinary SL users rez a set of unlinked items in their proper places in relation to each other, without needing any building skills. The "Set" is usually a building, but there is no reason it can't also be a statue, a furniture set, etc.

You prepare the unlinked items according to the easy steps below, then for distribution put them in a Packing Box.

05. USAGE SUMMARY

The base script you only use once in an item. It goes in a "base" prim, which is the piece that is moved/rotated/etc. The component script goes into each part or each linked part that makes up the rest of the large build. In short, only one base script, many component scripts. You do not put a component script in the same item where you put a base script.

1. Drop the base script in the Base.
2. Drop the "Component" Script in each building part.
3. Touch your Base, and choose RECORD
4. Take all building parts into inventory except for the base prim
5. Drag building parts from inventory into Base Prim
6. Touch your base and choose BUILD

OTHER COMMANDS from the Touch menu

To reposition, move or rotate the Base Prim choose POSITION
To adjust where the house has rezzed after choosing BUILD, you can just edit - arrow move the base prim around, and the Rest of the build will follow;
To lock into position (removes all scripts, helping to reduce work on the sim server) choose DONE
To delete building pieces: choose CLEAN


Alan Webb contributed a patch that enables script state persistence when taking objects into inventory, when saving OpenSim Archives (OARs) and when using attachments (r9265).