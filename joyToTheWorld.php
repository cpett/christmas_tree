<?php
        $pid = exec("pgrep -u root python");
        $len = strlen($pid);
        if ($len < "1") {
		exec('sudo python /var/www/html/cgi-bin/xmas.py /var/www/html/cgi-bin/joy_to_the_world.txt /var/www/html/cgi-bin/joy_to_the_world.mp3');
	}
?>
