<?php
        $pid = exec("pgrep -u root python");
        $len = strlen($pid);
        if ($len < "1") {
		exec('/var/www/html/cgi-bin/treeoff.sh');
	}
?>
