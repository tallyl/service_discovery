docker run -d  --name=registrator  --net=host  volume=/var/run/docker.sock:/tmp/docker.sock  gliderlabs/regtstrator:latest  consul://localhost:8500

