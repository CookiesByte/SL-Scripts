// Declare an integer 'chan' initialized to -583958345
integer chan = -583958345; // Channel number aka port.
// Define key variables for future use (placeholders as LSL keys)
key toucher; 
key owner;
key teller;

// Starts a new default state block where the majority of the script's behavior is defined
default
{
    // Event handler for when certain properties of the object change
    changed(integer change)
    {
        // Check if the owner of the object has changed
        if(change & CHANGED_OWNER)
        {
            // Reset the script if the owner changes
            llResetScript();    
        }    
    }

    // Event handler that is called when the script starts or the object containing the script is rezzed
    state_entry()
    {
        // Preload a specific sound identified by UUID to minimize delay on first play
        llPreloadSound("6db8117c-14a8-1868-6e12-994e8a7e16f4");
        // Send a message "boop" on the channel specified by 'chan'
        llRegionSay(chan,"boop");
        // Start listening for messages on the specified channel, with no filters applied
        llListen(chan,"","","");
        // Store the key of the object's owner in the 'owner' variable
        owner=llGetOwner();
    }

    // Event handler that is called when the object is rezzed
    on_rez(integer start_param)
    {
        // Reset the script every time the object is rezzed
        llResetScript();
    }
    
    // Event handler for listening to communications on the specified channel
    listen(integer channel,string name,key id,string text)
    {
        // Play the sound previously preloaded when a message is received
        llPlaySound("6db8117c-14a8-1868-6e12-994e8a7e16f4",1);
    }

    // Event handler for detecting touch events on the object
    touch(integer total_number)
    {
        // Play the preloaded sound when the object is touched
        llPlaySound("6db8117c-14a8-1868-6e12-994e8a7e16f4",1);
        // Send a message "boop" on the channel specified by 'chan'
        llRegionSay(chan,"boop");
    }
}
