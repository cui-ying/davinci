FROM openjdk:8-jre-alpine

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV DAVINCI3_HOME=/opt/davinci
WORKDIR $DAVINCI3_HOME

COPY server/target/davinci-server.jar app.jar
COPY webapp/build/ davinci-ui/
COPY config/logback.xml config/
COPY config/application.yml.example config/additional.yml

ENTRYPOINT ["java", "-jar", "app.jar", "--spring.config.additional-location=/opt/davinci/config/additional.yml"]
