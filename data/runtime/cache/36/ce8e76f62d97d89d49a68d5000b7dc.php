<?php
//000000000000
 exit();?>
s:255:"SELECT `b`.*,`a`.* FROM `ey_archives` `a` LEFT JOIN `ey_arctype` `b` ON `b`.`id`=`a`.`typeid` WHERE  (  a.typeid IN (14,14) AND a.channel IN (1) AND a.arcrank > -1 AND a.status = 1 AND a.is_del = 0 )  AND `a`.`lang` = 'cn' ORDER BY a.add_time desc LIMIT 8";