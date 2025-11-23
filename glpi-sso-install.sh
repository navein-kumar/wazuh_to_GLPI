# Enter the GLPI container
   docker exec -it glpi bash
   
   # Navigate to plugins directory
   cd /var/www/html/glpi/plugins
   
   # Download the plugin
   wget https://github.com/RaulPastorClemente/glpi-singlesignon/archive/refs/heads/master.zip
   
   # Install unzip if not available
   apt-get update && apt-get install -y unzip wget
   
   # Extract the plugin
   unzip master.zip
   
   # Rename to proper directory name
   mv glpi-singlesignon-master singlesignon
   
   # Fix permissions
   chown -R www-data:www-data singlesignon
   chmod -R 755 singlesignon
   
   # Clean up
   rm master.zip
   
   # Exit container
   exit
