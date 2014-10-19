docker couchpotato
================

This is a Dockerfile to set up "CouchPotato" - (https://couchpota.to/)

Build from docker file

```
git clone https://github.com/timhaak/docker-coachpotato.git
cd docker-coachpotato
docker build -t coachpotato .
```

docker run -d -h *your_host_name* -v /*your_config_location*:/config  -v /*your_videos_location*:/data -p 5050:5050 --name couchpotato couchpotato

