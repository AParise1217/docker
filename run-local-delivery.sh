DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PIDFILE=$DIR/pid-delivery
if [ -f $PIDFILE ];
then
	echo "PID file found, is the container already running? Otherwise please remove the pid file"
else
	echo "Starting instance..."
	sudo docker run -itt  --name CrafterDelivery  -p 443:443 -p 80:80 -p 9191:9191 \
	-v $DIR/CrafterDelivery/data:/home/crafter/craftercms/data \
	-v $DIR/CrafterDelivery/deployer/conf:/home/crafter/craftercms/deployer/conf \
	-v $DIR/CrafterDelivery/deployer/target:/home/crafter/craftercms/deployer/target \
		craftercms/delivery /bin/bash >> $DIR/pid-delivery
fi
