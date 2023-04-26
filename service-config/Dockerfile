FROM openjdk:20-ea-35-slim AS init-stage
LABEL jts_config_img__stage=init
WORKDIR /jars
COPY ./target/*.jar ./serv.jar
COPY ./jts_rsa ./jts_rsa
COPY ./init.sh ./init.sh
RUN chmod +x ./init.sh


FROM openjdk:20-ea-35-slim
ENV PORT=8080
WORKDIR /jars
COPY --from=init-stage /jars/ ./
ENTRYPOINT [ "./init.sh" ]
EXPOSE 8080