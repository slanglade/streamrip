sudo docker image rm streamrip:latest sylvainlanglade/streamrip:latest
sudo docker build -t streamrip:latest .
sudo docker tag streamrip:latest sylvainlanglade/streamrip:latest
echo $DOCKERHUB_TOKEN | sudo docker login -u sylvainlanglade --password-stdin
sudo docker push sylvainlanglade/streamrip:latest