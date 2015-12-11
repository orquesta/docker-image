A docker image to run scrapers written using [Scrapy Framework](http://scrapy.org/). 
It includes supervisord, so that you can mount the volume for supervisor's config dir, in order to monitor and control your scrapers or any other process in your app.

## Usage
docker run -v /PATH/TO/YOUR/SUPERVISOR/CONFIG_DIR:/etc/supervisord/conf.d matiasmm/orquesta

## Build the image yourself

```
git clone https://github.com/orquesta/docker-image.git
cd docker-image
docker build -t matiasmm/orquesta .
```

