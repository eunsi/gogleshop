FROM openjdk:18-jdk-alpine AS gogle
ADD gogleshop.tar .
WORKDIR gogleshop
RUN chmod +x mvnw
RUN ./mvnw clean install -DskipTests=true

FROM openjdk:18-jdk-alpine
COPY --from=gogle /gogleshop/target/SpringShoppingCart2-0.0.1-SNAPSHOT.jar /
CMD ["java", "-jar", "-Dspring.profiles.active=mysql", "/SpringShoppingCart2-0.0.1-SNAPSHOT.jar"]
