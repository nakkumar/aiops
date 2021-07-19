#!/bin/sh
# mkdir /home/$(whoami)/log
#  touch /tmp/data_after1
#  touch /tmp/data_before1
 sudo  tail  /var/ossec/logs/alerts/alerts.log > /tmp/data_after1
 msg=$(tail  /tmp/data_after1)
 error=$(tail  /tmp/data_after1 | grep   'Win.Test.EICAR_HDB-1' | wc -l)
 virus=$(tail  /tmp/data_after1 | grep   'Win.Test.EICAR_HDB-1')
 if  cmp -s /tmp/data_after1 /tmp/data_before1
 then
         {
             echo "NO NEW LOGS"
             exit 0
     }
else
        {

        if (( $error>=1 ));then

           {
             echo "VIRUS FOUND"
              cp /tmp/data_after1 /tmp/data_before1
              echo "virus Alert --> $virus" | mail -s "windows machine virus Alert" admin@zippyops.in
             exit 2
     }

    else
            {

             echo "NO VIRUS"
              cp /tmp/data_after1 /tmp/data_before1

             exit 1

            }
    fi
        }
fi
