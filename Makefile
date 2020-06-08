.PHONY: build
build:
	sudo docker build -t zense_pywrapper_for_serial .

.PHONY: run
run:
	xhost + local:root
	sudo docker run -it \
    --network="host" \
	--env=DISPLAY=$(DISPLAY) \
	--env=QT_X11_NO_MITSHM=1 \
	--privileged \
	--mount type=bind,src=/dev,dst=/dev,readonly \
	--mount type=bind,src=`pwd`,dst=/app \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	 zense_pywrapper_for_serial /bin/bash -c '/usr/local/PicoZenseSDK/Tools/FrameViewer_DCAM710'