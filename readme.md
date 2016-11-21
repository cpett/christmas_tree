======RasPi Christmas

####BYU Festival of Trees Repository
######This is a quick and dirty guide for how to get the raspi up and running

##Install LAMP stack on the raspi

  1. Create folder cgi-bin in /var/www/html/

  2. edit /etc/sudoers/ with:
	www-data ALL=(ALL) NOPASSWD:ALL
        (below pi user)
  
    *Should look like this:
    ```bash
       # User alias specification
       pi ALL=(ALL) NOPASSWD:ALL
       www-data ALL=(ALL) NOPASSWD:ALL
    ```
  3. Edit Permissions
    *`sudo chown -R pi /var/www/html`
    *`sudo chmod +x -R /var/www/html`
	^^Not good practice, don't do in real life

  4. Edit the file /etc/apache2/apache2.conf
    *`ScriptAlias /cgi-bin/ /var/www/html/cgi-bin/`

## Setup Files to call via web
  1. Put .py files in /var/ww/html/cgi-bin

  2. Call the file from index.php with
     **Note:** This is just calling a sample file, not the xmas.py used in the project.
    ```php
	<?php
  		exec('sudo -u pi python /var/www/html/cgi-bin/pyfile.py')
  	?>
    ```
  3. Add the necessary buttons and AJAX calls to trigger the php script.

## Access the raspi on the web/ssh with only the hostname:
  1. Make sure avahi-daemon is installed
    *```sudo apt-get install avahi-daemon```
  2. Start avahi-daemon
    *```sudo service avahi-daemon start```
  3. Enable avahi-daemon
    *```sudo systemctl enable avahi-daemon ```
  4. Check that you have access
    *You should now be able to access the raspi by:
      *Web: http://raspberrypi.local
      *ssh: ssh pi@raspberrypi.local	
  **Note:** you may have to do some configuring to get avahi-daemon to run on startup
	
###Some RasPi3s have been having problems with randomly dropping wifi connections. Here's a work-around I found:
  1. Run: ```# sudo iwconfig wlan0 power off```
    * Some RasPi3s use: # sudo iw dev wlan0 set power_save off
  2. Add this to /etc/rc.local (below the IP print if statement)
    *```# sudo vim /etc/rc.local```
    *```sudo iwconfig wlan0 power off```
  3. Your machine should now turn off power management settings on boot
  4. Test by running: ```# iwconfig```
    *Power Management should say that it's off
  **NOTE:** If your machine uses iw dev wlan0... then that will be the command you add to /etc/rc.local


	
