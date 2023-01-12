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
