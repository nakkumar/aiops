Ubuntu
*******
## path -->  /var/log/syslog
#!/bin/bash

# mkdir /home/$(whoami)/log
 touch /home/$(whoami)/log/data_after1
 touch /home/$(whoami)/log/data_before1

sudo tail -1 /var/log/syslog > /home/$(whoami)/log/data_after1
 msg=$(tail -1 /home/$(whoami)/log/data_after1)
 if cmp -s /home/$(whoami)/log/data_after1 /home/$(whoami)/log/data_before1
 then
         {
             echo "ok --> NO new logs"
             exit 0
     }
else
        {
             echo "WARNING --> $msg"
             cp /home/$(whoami)/log/data_after1 /home/$(whoami)/log/data_before1
             exit 1
        }


 fi

Centos
******

#!/bin/bash

# mkdir /home/$(whoami)/log
 touch /home/$(whoami)/log/data_after1
 touch /home/$(whoami)/log/data_before1

sudo  tail -1 /var/log/secure > /home/$(whoami)/log/data_after1
 msg=$( tail -1 /home/$(whoami)/log/data_after1)
 if cmp -s /home/$(whoami)/log/data_after1  /home/$(whoami)/log/data_before1
 then
         {
            echo "ok --> NO new logs"
            exit 0

     }
else
        {
             echo "WARNING --> $msg"
             cp /home/$(whoami)/log/data_after1 /home/$(whoami)/log/data_before1
             exit 1

        }


 fi
