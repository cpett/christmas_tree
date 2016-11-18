<?php
        $pid = exec("pgrep -u root python");
        $len = strlen($pid);
        if ($len < "1") {
		shell_exec('sudo /var/www/html/cgi-bin/treeon.sh');
	}
?>
