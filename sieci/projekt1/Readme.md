### image optimzier
Aplikacja pozwalająca na wczytanie obrazu na serwer, wprowadzenie ścieki docelowej i zoptymalizowanie obrazu na potrzeby internetu. W zamyśle mająca słuzyć projektantom stron internetowych, twórcom treści do internetu czy programistom warstwy front-end.

Klient w trybie interaktywnym pyta uzytkowika o ściezkę obrazu, oraz ściekę docelową. Nic nie stoi na przeszkodzie, by przy niewielkich modyfikacjach jednym klientem wysłać folder obrazów, lub wczytać listę obrazów z argumentów.

### wymagania
##### W projekcie należy wykorzystać dwa różne narzędzia:
###### Interface gniazd BSD (język C, choć w szczególnych przypadkach, po uzgodnieniu z prowadzącym, mogą być wyjątki).
- klient jest napisany w C
###### Interface obiektowy (Java, C♯, C++ — np. biblioteka Qt).
- serwer jest stworzony w Javie i korzysta m.in z obiektowej wersji klienta API serwisu do optymalizacji obrazu
##### Jednym z elementów musi być przesyłanie większej ilości danych (np. zadanego przez użytkownika pliku).
- wysyłane są zdjęcia
##### Co najmniej jedna strona połączenia musi obsługiwać wiele klientów (lub serwerów) jednocześnie.
- serwer jest w stanie obsłzyc więcej niz 1 klienta
##### Co najmniej jedna strona musi zawierać elementy interaktywności (tzn. sterowanie aplikacją podczas wykonania).
- klient jest w stanie podać ściezki do pliku. Ich poprawnosć jest sprawdzana i w razie koniecznosci uzytkownik jest proszony o ponowne wpisane danych


### Uruchomienie klienta
`gcc -o main main c`
`./main`

### Uruchomienie serwera 
Instrukcje budowania i uruchomienia w pliku Readme w folderze `server`

### Wymagania
Testowane na systemie macOS, powinno działać takze na Linuksie.

### Przykład działania
```bash
➜  projekt1 git:(master) gcc -o main main.c && ./main
Connection established.
Please provide local file path (jpeg/png, up to 10MiB)://Users/q/p/IMG_1084.jpeg
file_path received.
Please provide remote file path://Users/q/p/destination.jpeg
file_path sent.
Sending /Users/q/p/IMG_1084.jpegFile sent.%                                                               
➜  projekt1 git:(master)
```

Rezultat: 
```bash
➜  p ls -lah
total 6800
drwxr-xr-x   5 q  staff   160B 14 Dec 14:14 .
drwxr-xr-x+ 65 q  staff   2.0K 14 Dec 14:14 ..
-rw-r--r--@  1 q  staff   6.0K 14 Dec 14:14 .DS_Store
-rw-r--r--@  1 q  staff   2.5M 10 Sep 20:29 IMG_1084.jpeg
-rw-r--r--   1 q  staff   813K 14 Dec 14:13 destination.jpeg
```

Obrazek stracił ponad 1.5MiB
