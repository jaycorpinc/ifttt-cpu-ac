# ifttt-cpu-ac
Keep your servers cool. Use a IFTTT wifi power outlet to control a window air conditioner unit from linux cpu temperature sensors.

If the air conditioner is turned on, it checks the core temperatures every 30s to see if it is ready to turn the air conditioner off. If the AC is off, it only checks the cores to see if it needs to be turned on every five minutes.

On https://ifttt.com/my_services, create a new applet.
For 'this', select webhooks. Create a web request trigger 'office_cold' to turn the ac off, 'office_hot' to turn the ac on.
For 'that', Have it trigger your IFTTT compatible device for an appropriate scene/setting.

Usage:
`ruby app.rb start`
`ruby app.rb restart`
`ruby app.rb stop`