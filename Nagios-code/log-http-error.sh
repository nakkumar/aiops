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
