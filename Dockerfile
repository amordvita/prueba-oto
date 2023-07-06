FROM otohits/app:latest

ENV APPLICATION_KEY=f3e00368-ab46-4773-a1e7-f319acee02f4

RUN pwd

RUN ls

RUN apt-get update && apt-get install -y apache2 

EXPOSE 80

COPY index.html /var/www/html/index.html

COPY run.sh /otohits/run.sh

RUN chmod +x /otohits/run.sh

RUN cat /otohits/run.sh


