docker container stop gcdev
docker container rm gcdev
docker build -t gcdev . --no-cache
docker run -d -p 8081:80 -p 443:443 --name gcdev gcdev
docker ps -a