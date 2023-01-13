./mvnw process-test-classes -Dfiles=/home/heyuan/openrewrite_demo/spring-petclinic/target/classes

./mvnw org.openrewrite.maven:rewrite-maven-plugin:4.22.1:init -Ddependencies=org.openrewrite.recipe:rewrite-testing-frameworks:1.20.1 -DactiveRecipes=org.openrewrite.java.testing.junit5.JUnit5BestPractices

./mvnw rewrite:configure -Ddependencies=org.openrewrite.recipe:rewrite-spring:4.19.2 -DactiveRecipes=org.openrewrite.java.spring.boot2.SpringBoot1To2Migration

./mvnw rewrite:run

./mvnw rewrite:configure -Ddependencies=org.openrewrite.recipe:rewrite-migrate-java:1.4.2 -DactiveRecipes=org.openrewrite.java.migrate.Java8toJava11

./mvnw rewrite:run

sdk use java 11.0.17-albba

./mvnw verify