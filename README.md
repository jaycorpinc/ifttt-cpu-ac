# ifttt-cpu-ac
Keep your servers cool. Use a IFTTT wifi power outlet to control a window air conditioner unit from linux cpu temperature sensors.

It scans my laptops CPUs internal temp sensor, if my laptop is running hot, turns on the AC in my office. If its not, turns it makes sure it is off.

If the air conditioner is turned on, it checks the core temperatures every 30s to see if it is ready to turn the air conditioner off. If the AC is off, it only checks the cores to see if it needs to be turned on every five minutes.

#$ ruby app.rb start
#    proctemp.rb: process with pid 31939 started.
#$ ruby app.rb restart
#    (...)
#$ ruby app.rb stop