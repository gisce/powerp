FROM python:2.7
MAINTAINER GISCE-TI, S.L <devel@gisce.net>

RUN apt-get update && apt-get install -y postgresql-client libgdal-dev

RUN ln -s /usr/local/src/powerp/powerp-manager /usr/local/bin/powerp-manager

ENTRYPOINT ["/usr/local/src/powerp/entrypoint.sh"]
CMD ["sleep"]
