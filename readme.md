#RasPi Christmas

####BYU Festival of Trees Repository
######Quick'n'Dirty guide for how to get the raspi up and running
[Link to original Instructables](http://www.instructables.com/id/Raspberry-Pi-Christmas-Tree-Light-Show/)
Sample 1: [Carol of the Bells](https://youtu.be/ZdeD2sktkPs)
Sample 2: [BYU Fight Song (2016)](https://youtu.be/uy9q6Hy3UpQ)
Sample 3: [BYU Fight Song (2015)](https://youtu.be/C3xfx6bzrG8)

##Install LAMP stack on the raspi

  1. Create folder cgi-bin in /var/www/html/

  2. edit /etc/sudoers/ with:
	www-data ALL=(ALL) NOPASSWD:ALL
        (below pi user)
  
    Should look like this:
    ```bash
       # User alias specification
       pi ALL=(ALL) NOPASSWD:ALL
       www-data ALL=(ALL) NOPASSWD:ALL
    ```
  3. Edit Permissions
    ```sudo chown -R pi /var/www/html```
    ```sudo chmod +x -R /var/www/html```
	^^Not good practice, don't do in real life

  4. Edit the file /etc/apache2/apache2.conf
    ```ScriptAlias /cgi-bin/ /var/www/html/cgi-bin/```

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
    ```sudo apt-get install avahi-daemon```
  2. Start avahi-daemon
    ```sudo service avahi-daemon start```
  3. Enable avahi-daemon
    ```sudo systemctl enable avahi-daemon ```
  4. Check that you have access
    You should now be able to access the raspi by:
      Web: http://raspberrypi.local
      ssh: ssh pi@raspberrypi.local	
  **Note:** you may have to do some configuring to get avahi-daemon to run on startup
	
### Work-Arounds for WiFi Problems:
#### Work-Around #1: Power Management
  1. Run: ```# sudo iwconfig wlan0 power off```
     Some RasPi3s use: # sudo iw dev wlan0 set power_save off
  2. Add this to /etc/rc.local (below the IP print if statement)
    ```# sudo vim /etc/rc.local```
    ```sudo iwconfig wlan0 power off```
  3. Your machine should now turn off power management settings on boot
  4. Test by running: ```# iwconfig```
     Power Management should say that it's off
  **NOTE:** If your machine uses iw dev wlan0... then that will be the command you add to /etc/rc.local
#### Work-Around #2: Cron Job
  1. Make sure that the file located in ```/var/www/html/cgi-bin``` is executable
    ```sudo chmod +x /var/www/html/cgi-bin/wifi_rebooter.sh```
  2. Edit /etc/crontab
    ```sudo vim /etc/crontab```
  3. Add the following line:
    ```*/1 *	* * *	root	/var/www/html/cgi-bin/wifi-rebooter.sh```
  4. The ```/1``` means that it will run the script every minute. Change it as appropriate	
