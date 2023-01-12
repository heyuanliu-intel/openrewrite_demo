# OpenRewrite Demo

The purpose of this project is to show how to use EMT4J and OpenRewrite to do JDK version upgrade from v8 to v11.

- Use EMT4J to scan the source code to generate the report.
- Use OpenRewrite to do code change according to the recipe config

## Use SDKMAN to manage jdk version

```
curl -s "https://get.sdkman.io" | bash
source "/root/.sdkman/bin/sdkman-init.sh"

sdk install java 8.0.352-albba
sdk install java 11.0.17-albba
sdk use java 8.0.352-albba
sdk use java 11.0.17-albba

```

## Run the following command directly without modifying pom.xml

```
cd spring-petclinic
sdk use java 8.0.352-albba
mvn process-test-classes org.eclipse.emt4j:emt4j-maven-plugin:0.7.0:check
```

## Run OpenRewrite to do code change

```
./mvnw org.openrewrite.maven:rewrite-maven-plugin:4.22.1:init -Ddependencies=org.openrewrite.recipe:rewrite-testing-frameworks:1.20.1 -DactiveRecipes=org.openrewrite.java.testing.junit5.JUnit5BestPractices

./mvnw rewrite:configure -Ddependencies=org.openrewrite.recipe:rewrite-spring:4.19.2 -DactiveRecipes=org.openrewrite.java.spring.boot2.SpringBoot1To2Migration

./mvnw rewrite:run

./mvnw rewrite:configure -Ddependencies=org.openrewrite.recipe:rewrite-migrate-java:1.4.2 -DactiveRecipes=org.openrewrite.java.migrate.Java8toJava11

./mvnw rewrite:run

sdk use java 11.0.17-albba

./mvnw verify

```
