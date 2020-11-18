cp -r source/* /home/mpata/config/slate/source
docker build -t slatedocs/slate .
docker stop slate
docker rm slate
docker run -d --rm --name slate -p 4567:4567 -v /home/mpata/config/slate/source:/srv/slate/source slatedocs/slate serve