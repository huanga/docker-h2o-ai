ARG version=3.26.0.3

FROM alpine:latest
ARG version
WORKDIR /build/
RUN apk --no-cache add ca-certificates wget unzip
RUN wget http://h2o-release.s3.amazonaws.com/h2o/rel-yau/3/h2o-${version}.zip && unzip h2o-${version}.zip

FROM openjdk:12
ARG version
WORKDIR /root/
COPY --from=0 /build/h2o-${version}/ /root/
CMD ["java", "-jar", "./h2o.jar"]
