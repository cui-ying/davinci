FROM openjdk:8-jre-alpine

LABEL MAINTAINER="Cui Ying<tsuiying@126.com>"

ENV TZ=Asia/Shanghai

ENV DAVINCI3_HOME /opt/davinci

WORKDIR /opt/davinci

USER root

ARG DAVINCI_ZIP_PATH=/tmp/davinci.zip
COPY assembly/target/*.zip $DAVINCI_ZIP_PATH
COPY webapp/build davinci-ui

#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN unzip $DAVINCI_ZIP_PATH -d /opt/davinci
#  && cp config/application.yml.example config/application.yml

#CMD ["top"]
CMD ["sh", "./bin/start-server.sh"]
#ENTRYPOINT ["bin/start-server.sh"]

EXPOSE 8080
