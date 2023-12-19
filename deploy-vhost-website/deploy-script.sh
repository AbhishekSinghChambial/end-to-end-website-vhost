#!/bin/bash

echo "checking diff"
for i in $(cat env-setups-details.txt); do 
    setupcompleted=$(grep ^$i completed-setup.db) 
    echo "---test $setupcompleted test---"
    if [ -z "$setupcompleted" ]; then
        success=true  # Flag to track the success of the setup

        # print msg
        echo "creating new host for $i"

        ## Create apache vhost conf file for each customer
        cp template-vhost.conf_tmp $i.conf

        # Update conf file and define servername
        echo "create conf file"
        sed -i "s/SERVERNAME/$i/" $i.conf
        # create html
        echo "create html file"
        echo "<h1>Hello $i  "  > $i.html   

        # deploy setup
        echo "deployment started..."
        ## copy conf files
        echo "copy files to server"
        scp -r -o StrictHostKeyChecking=no $i.* ubuntu@54.197.66.70:/tmp/
        ## create document root directory
        echo "create doc root dir on server"
        ssh -T -o StrictHostKeyChecking=no ubuntu@54.197.66.70 sudo mkdir /var/www/html/$i
        ## move conf and web file to their location

        echo "move conf and html file"
        ssh -T -o StrictHostKeyChecking=no ubuntu@54.197.66.70 sudo mv /tmp/$i.conf /etc/apache2/sites-enabled/$i.conf
        ssh StrictHostKeyChecking=no  ubuntu@54.197.66.70 sudo mv /tmp/$i.html /var/www/html/$i/index.html
        ## restart apache 
        echo "reload apache"
        ssh -T -o StrictHostKeyChecking=no ubuntu@54.197.66.70 sudo systemctl reload apache2
        # If any of the setup steps fail, set the success flag to false
        # Example: Add additional error checks as needed
        # if [ $? -ne 0 ]; then
        #     success=false
        # fi

        if [ "$success" = true ]; then
            echo "$i" >> completed-setup.db
        fi
    fi
    echo -e "\n deployment completed"
done

