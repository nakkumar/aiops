ubuntu-v2
**********
 #!/bin/bash

# mkdir /home/$(whoami)/log
 touch /home/$(whoami)/log/data_after
 touch /home/$(whoami)/log/data_before

 tail -1 /var/log/apache2/error.log > /home/$(whoami)/log/data_after
 msg=$(tail -1 /home/$(whoami)/log/data_after)
 error=$(tail -1 /home/$(whoami)/log/data_after | grep -w down | wc -l)
 if cmp -s /home/$(whoami)/log/data_after /home/$(whoami)/log/data_before
 then
         {
             echo "ok --> NO new logs"
             exit 0
         }
else
        {
                if (( $error>=1 ));then
                        {
             echo "CRIRICAL-ERROR  --> $msg"
             cp /home/$(whoami)/log/data_after /home/$(whoami)/log/data_before
             exit 2
                        }
                else
                        {
             echo "WARNING --> $msg"
             cp /home/$(whoami)/log/data_after /home/$(whoami)/log/data_before
             exit 1
                        }
                fi
        }


 fi

centos-v2
*********






##################################################################################################################################################################

ubuntu
******

#!/bin/bash

# mkdir /home/$(whoami)/log
 touch /home/$(whoami)/log/data_after
 touch /home/$(whoami)/log/data_before

 tail -1 /var/log/apache2/error.log > /home/$(whoami)/log/data_after
 msg=$(tail -1 /home/$(whoami)/log/data_after)
 if cmp -s /home/$(whoami)/log/data_after /home/$(whoami)/log/data_before
 then
         {
             echo "ok --> NO new logs"
             exit 0
     }
else
        {
             echo "WARNING --> $msg"
             cp /home/$(whoami)/log/data_after /home/$(whoami)/log/data_before
             exit 1
        }


 fi


Centos
*******

#!/bin/bash

# mkdir /home/$(whoami)/log
 touch /home/$(whoami)/log/data_after
 touch /home/$(whoami)/log/data_before

 tail -1 /var/log/httpd/error_log > /home/$(whoami)/log/data_after
 msg=$(tail -1 /home/$(whoami)/log/data_after)
 if cmp -s /home/$(whoami)/log/data_after /home/$(whoami)/log/data_before
 then
         {
             echo "ok --> NO new logs"
             exit 0
     }
else
        {
             echo "WARNING --> $msg"
             cp /home/$(whoami)/log/data_after /home/$(whoami)/log/data_before
             exit 1
        }


 fi




#############################################################################################################################################################################


centos and ubuntu log file name and path diff
**********************************************

centos
******
#!/bin/bash

msg=$(tail -n 1 /var/log/httpd/error_log | grep -w down)

down=$(tail -n 1 /var/log/httpd/error_log | grep -w down | wc -l)

#echo "$down"

if (( $down>=1 ));then

        {

        echo "WARNING $msg "
        exit 1
        }
else
        {
        echo "ok "
        exit 0
        }
fi




ubuntu
******

#!/bin/bash

msg=$(tail -n 1 /var/log/apache2/error.log | grep -w down)

down=$(tail -n 1 /var/log/apache2/error.log | grep -w down | wc -l)

#echo "$down"

if (( $down>=1 ));then

        {

        echo "WARNING $msg "
        exit 1
        }
else
        {
        echo "ok "
        exit 0
        }
fi
