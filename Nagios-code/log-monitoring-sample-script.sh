 #!/bin/bash
 tail -1 /path/to/file.log > /some/dir/after
 if cmp -s /some/dir/after /some/dire/before
 then
     cat /some/dir/after | mail -s "restart" admin@exemple.com
     cp /some/dir/after /some/dir/before
 fi
