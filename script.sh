
#!/bin/bash
echo "Starting web page deployment..."

cd /var/www/html/num
sudo rm -f index.html
cd /var/lib/jenkins/workspace/new
sudo cp -R * /var/www/html/num/

echo "Web page deployment completed successfully."

