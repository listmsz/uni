### image optimzier

Aplikacja pozwalająca na wczytanie obrazu na serwer, wprowadzenie ścieki docelowej i zoptymalizowanie obrazu na potrzeby internetu. W zamyśle mająca słuzyć projektantom stron internetowych, twórcom treści do internetu czy programistom warstwy front-end.

Klient w trybie interaktywnym pyta uzytkowika o ściezkę obrazu, oraz ściekę docelową. Nic nie stoi na przeszkodzie, by przy niewielkich modyfikacjach jednym klientem wysłać folder obrazów, lub wczytać listę obrazów z argumentów.

### wymagania
##### W projekcie należy wykorzystać dwa różne narzędzia:
###### Interface gniazd BSD (język C, choć w szczególnych przypadkach, po uzgodnieniu z prowadzącym, mogą być wyjątki).
- klient jest pisany w C
###### Interface obiektowy (Java, C♯, C++ — np. biblioteka Qt).
- serwer jest stworzony w Javie i korzysta m.in z obiektowej wersji klienta API serwisu do optymalizacji obrazu
##### Jednym z elementów musi być przesyłanie większej ilości danych (np. zadanego przez użytkownika pliku).
- wysyłane są zdjęcia
##### Co najmniej jedna strona połączenia musi obsługiwać wiele klientów (lub serwerów) jednocześnie.
- serwer jest w stanie obsłzyc więcej niz 1 klienta
##### Co najmniej jedna strona musi zawierać elementy interaktywności (tzn. sterowanie aplikacją podczas wykonania).
- klient jest w stanie podać ściezki do pliku. Ich poprawnosć jest sprawdzana i w razie koniecznosci uzytkownik jest proszony o ponowne wpisane danych
