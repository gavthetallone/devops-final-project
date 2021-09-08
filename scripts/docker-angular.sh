cd spring-petclinic-angular
docker build -t spring-petclinic-angular:latest .
docker run --rm -p 8080:8080 spring-petclinic-angular:latest
cd ..
