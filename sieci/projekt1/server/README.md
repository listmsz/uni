# Serwer aplikacji
Bazuje na szkielecie aplikacji mavenowej: `https://github.com/mstane/maven-java-seed`

Wymaga:
- Java 8+
- Maven

### Budowanie
```mvn install```
```mvn clean compile``

### Uruchomienie
```mvn exec:java -Dexec.mainClass="imageoptimizer.server.App"```


### Przykład działania
```➜  projekt1 git:(master) gcc -o main main.c && ./main
Connection established.
Please provide local file path (jpeg/png, up to 10MiB)://Users/q/p/IMG_1084.jpeg
file_path received.
Please provide remote file path://Users/q/p/destination.jpeg
file_path sent.
Sending /Users/q/p/IMG_1084.jpegFile sent.%                                                               
➜  projekt1 git:(master) ```

Rezultat: 
```
➜  p ls -lah
total 6800
drwxr-xr-x   5 q  staff   160B 14 Dec 14:14 .
drwxr-xr-x+ 65 q  staff   2.0K 14 Dec 14:14 ..
-rw-r--r--@  1 q  staff   6.0K 14 Dec 14:14 .DS_Store
-rw-r--r--@  1 q  staff   2.5M 10 Sep 20:29 IMG_1084.jpeg
-rw-r--r--   1 q  staff   813K 14 Dec 14:13 destination.jpeg
```

Obrazek stracił ponad 1.5MiB