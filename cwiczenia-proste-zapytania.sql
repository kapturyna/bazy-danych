%-- 1. Wybrać nazwiska pracowników, numery departamentów i numery pracownicze ich szefów z tabeli EMPLOYEES
SELECT LAST_NAME, DEPARTMENT_ID, MANAGER_ID FROM EMPLOYEES;

%-- 2. Wybrać wszystkie kolumny z tabeli EMPLOYEES
SELECT * FROM EMPLOYEES;

%-- 3. Wyliczyć maksymalną roczną pensję dla stanowiska programmer
SELECT MAX_SALARY * 12 FROM JOBS WHERE JOB_ID = 'IT_PROG';

%-- 4. Wyliczyć minimalną roczną pensję podstawową stanowiska Administration Assistant gdyby każdemu dać podwyżkę o 300
SELECT (MIN_SALARY + 300) * 12 FROM JOBS WHERE JOB_ID = 'AD_ASST';

%-- 5. Wybrać nazwiska i pensje pracowników z nagłówkami NAZWISKO i PENSJA
SELECT LAST_NAME AS NAZWISKO, SALARY AS PENSJA FROM EMPLOYEES;

%-- 6. Połączyć imię i nazwisko, z nagłówkiem PRACOWNIK
SELECT FIRST_NAME || ' ' || LAST_NAME AS PRACOWNIK FROM EMPLOYEES;

%-- 7. Wypisać nazwiska pracowników z dopiskiem „pracuje na stanowisku” i podać kod stanowiska
SELECT LAST_NAME || ' pracuje na stanowisku ' || JOB_ID FROM EMPLOYEES;

%-- 8. Wyświetlić wszystkie numery departamentów występujące w tabeli EMPLOYEES
SELECT DEPARTMENT_ID FROM EMPLOYEES;

%-- 9. Wyświetlić wszystkie różne numery departamentów występujące w tabeli EMPLOYEES
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

%-- 10. Wybrać wszystkie wzajemnie różne kombinacje numerów departamentów i stanowisk w tabeli EMPLOYEES
SELECT DISTINCT DEPARTMENT_ID, JOB_ID FROM EMPLOYEES;

%-- 11.Posortować wszystkie dane z JOBS w kolejności alfabetycznej nazwy stanowiska
SELECT * FROM JOBS ORDER BY JOB_TITLE ASC

%-- 12.Posortować malejąco wszystkie dane pracowników zaczynając od najwięcej zarabiających
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC

%-- 13.Posortować dane pracowników zaczynając od najwięcej zarabiającej i w kolejności alfabetycznej nazwiska
SELECT LAST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC, LAST_NAME ASC

%-- 14.Wybrać id, nazwiska i wynagrodzenie pracowników, których zarobki są większe od 2000
SELECT EMPLOYEE_ID, LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY > 2000

%-- 15.Wybrać dane tych pracowników, których zarobki mieszczą się pomiędzy 3000 a 9000.
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY > 3000 AND SALARY < 9000

%-- 16.Wybrać pracowników, których managerowie to 100,120 lub 146
SELECT FIRST_NAME, LAST_NAME, MANAGER_ID FROM EMPLOYEES WHERE MANAGER_ID = 100 OR MANAGER_ID = 120 OR MANAGER_ID = 146;
SELECT FIRST_NAME, LAST_NAME, MANAGER_ID FROM EMPLOYEES WHERE MANAGER_ID IN (100, 120, 146);

%-- 17.Wybrać departamentów, których nazwy zaczynają się na C
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_NAME LIKE 'C%'

%-- 18.Wybrać kraje, których nazwy są pięcioliterowe
SELECT * FROM COUNTRIES WHERE LENGTH(COUNTRY_NAME) = 5

%-- 19.Wybrać dane tych pracowników, którzy mają współczynnik prowizji
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL

%-- 20.Wybrać departamentów, których nazwy nie zaczynają się na C
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_NAME NOT LIKE 'C%'

%-- 21.Wybrać dane tych pracowników, którzy nie mają współczynnika prowizji
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL

%-- 22.Wybrać dane tych pracowników zatrudnionych na stanowisku ST_MAN których
%--    zarobki są większe równe 7900 ale mniejsze niż 8200
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'ST_MAN' AND SALARY >= 7900 AND SALARY < 8200

%-- 23.Wybrać dane tych pracowników zatrudnionych na stanowisku ST_MAN których
%--    zarobki są większe równe 7900 ale mniejsze niż 8200 lub zatrudnionych na
%--    stanowisku IT_PROG
SELECT * FROM EMPLOYEES WHERE (JOB_ID = 'ST_MAN' AND SALARY >= 7900 AND SALARY < 8200) OR (JOB_ID = 'IT_PROG')

%-- 24.Wybrać wszystkich pracowników zatrudnionych na stanowisku IT_PROG oraz
%--    pracowników na stanowisku ST_CLERK, których przełożonym jest 121
SELECT * FROM EMPLOYEES WHERE (JOB_ID = 'IT_PROG') OR (JOB_ID = 'ST_CLERK' AND MANAGER_ID = 121)

%-- 25.Wybrać wszystkie lokalizacje
SELECT * FROM LOCATIONS

%-- 26.Wybrać numery i nazwy departamentów sortując według numerów departamentów
SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS ORDER BY DEPARTMENT_ID ASC

%-- 27.Wybrać wszystkie niepowtarzające się stanowiska pracy z tabeli EMPLOYEES
SELECT DISTINCT JOB_ID FROM EMPLOYEES

%-- 28.Wybrać dane pracowników zatrudnionych w departamentach 30 i 50 w kolejności
%--    numeru pracownika malejąco
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 50
ORDER BY EMPLOYEE_ID DESC

%-- 29.Wybrać nazwiska tych pracowników , w których nazwisku występuje ciąg „TH” lub „LL”
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE UPPER(LAST_NAME) LIKE '%TH%' OR UPPER(LAST_NAME) LIKE '%LL%'

%-- 30.Wybrać Imię, Nazwisko i datę zatrudnienia tych pracowników, którzy zostali
%--    zatrudnieni po 30 grudnia 2006
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE > TO_DATE('30/12/2006', 'DD/MM/YYYY')
