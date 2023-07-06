FROM otohits/app:latest

ENV APPLICATION_KEY=31005816-9090-4eec-a74c-4237706545b9

RUN pwd

RUN ls

RUN apt-get update && apt-get install -y apache2 

EXPOSE 80

COPY index.html /var/www/html/index.html

COPY run.sh /otohits/run.sh

RUN chmod +x /otohits/run.sh

RUN cat /otohits/run.sh


