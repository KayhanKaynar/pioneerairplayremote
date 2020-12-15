# pioneerairplayremote
Pioneer amplifier turn on with airplay stream detection  

Hello everyone. 

With this project/simple bash script, you can detect your airplay stream and turn on/off your AV receiver automatically without standing on from your chair .
Basically script detects the stream and streamer by checking the airplay listening ports and powers on AV receiver with a simple LIRC configured electronical circuit combined with an IR blaster. Script checks the streamer every 1 second with a do - while infinite loop and creates a temporary streamer.txt file for streamer online/offline condition.
If stream has been closed , it powers off the receiver. 
All of the events has been logged in to syslog / messages of linux machine.
For this project to be run , the LIRC and shairplay daemons should be installed on the machine.

For all your questions please contact me from : kayhan.kaynar@hotmail.com

Thanks.
Kayhan
