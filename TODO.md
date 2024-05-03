# Учебная практика: проектно-конструкторская практика

## Магистры, 2 семестр

### Работа в GNU Linux

TODO:
- [ ] Скрипты bash
  - [ ]  Переменные окружения ($PATH, $USER)
- [ ] Скрипты TCL
  - [ ] прошивка ПЛИС через терминал Linux
- [ ] Скрипты make
  - [ ] Сборка проекта от выбора отладочной платы до её прошивки

### Командные оболочки

### Bash (в разработке)

Bournje again shell.

### Tcl

Tool-command language [уроки по Tcl](https://tclstudy.narod.ru/tcl/index.html).

#### Работа с переменными

Переменные в Tcl не объявляются. Чтобы создать переменную, необходимо присвоить ей значение. Переменные имеют только один тип данных - строка.

Команда для __присвоения__ значения переменной `set`

```Tcl
% set a 9
9
```

Вывод значения переменной или строки осуществляется командой `puts`

```Tcl
% puts $a
9
```

Запись `$a` приводит к возврату значение переменной `a`.

Запись `"Hello, World!"` группирует аргументы _с подстановкой_ в них значения переменных.
Запись `{Hello, World!}` группирует аргументы _без подстановки_ значения в них.
Последнее значит, что результатом выполнения команд
  
  ```Tcl
  % set a 7
  7
  % puts "Hello, $a World!"
  Hello, 7 World!
  % puts {Hello, $a World!}
  Hello, $a World!
  ```
  
в первом случае будет `Hello, 7 World!`, а во втором - `Hello, $a World!`

Запись

```Tcl
% set a 8
8
% puts ${a}43
843
```

приведёт к выводу результата `843`. На запись `$a43` интерпретатор выдаст ошибку об отсутствии переменной с таким именем. Таким образом, если имя одной переменной 

Задавать переменные можно запросом ввода информации из терминала. Например,

```Tcl
% puts "В какой аудитории Вы находитесь?"
% set Locale [gets stdin]
% puts "Да, именно в $Locale Вы находитесь"
```

Команда `gets` считывает строку из [входного потока](https://ru.wikipedia.org/wiki/Стандартные_потоки) stdin. Результат выполнения команды передаётся команде `set`, которая записывает его в переменную `Locate`. Квадратные скобки означают возврат результата выполнения команды.

Отдельно команда `gets` используется как

```Tcl
% gets stdin name
% puts $name
```

___Задание___

Сформируйте запрос своих имени, фамилии и отчества, записывая их в отдельные переменные `firstname`, `middlename` и `lastname`. Выведите в терминал свои ФИО одной переменной.

#### Работа с выражениями

Для проведения расчётов с переменными используется команда `expr`.

```Tcl
% expr 2+2
4
% set a 3
3
% set b 0.13
0.13
% expr $a * $b
0.39
% puts [expr $a/$b]
23.076923076923077
```

В ряде команд `for`, `while`, `if` один из аргументов трактуется также как выражение. Запись для циклов:

```Tcl
% for {set i 0} {$i < 10} {

}
```

___Задание___

1. Произведите расчёт следующих выражений, задав `a` - номер по журналу, `b` - день рождения, `c` - месяц рождания, `d` - сумма цифр года рождения:

```Tcl
w = b - c
z = w * d
f = a / z
```

Выведите итоговый результат расчёта.

#### Работа со списками и ассоциативными массивами

Для удаления элементов из списка можно использовать команду `lreplace` без указания того, на что заменяются элементы.

```Tcl
% lreplace {1 2 3 4 5 6} 2 2
1 2 4 5 6
% set l1 {a b c d e f}
a b c d e f
% lreplace $a 2 4
a b f
% lreplace $a end-2 end
a b c
```
___Задание___

1. Сформируйте список из 10 элементов со случайными значениями от 0 до 9. Отсортируйте список и выведите его элементы по отдельности. Отсортируйте список в обратном порядке.
2. Сформируйте два списка: в одном находится перечисление типов промежуточной аттестации, пройденными Вами в бакалавриате, а в другом - их количество в соответствие с порядком элемента в первом списке.
3. Сделайте ассоциативный массив из этих списков вида "ключ - значение" ("тип - количество"). Выведите в терминал значение каждого элемента массива.
4. Отсортируйте массив по алфавиту.

#### Работа с текстовыми файлами

___Задание___

1. Сформируйте текстовый файл с набором случайных чисел в количестве равном утроеннму значению номера года поступления без номера по журналу. Прочитайте файл в переменную, отсортируйте значения и запишите в другой файл.

#### Работа с процедурами

Процедура для удаления конкретного элемента из списка
```Tcl
proc lremove {listVariable value} {
    upvar 1 $listVariable var
    set idx [lsearch -exact $var $value]
    set var [lreplace $var $idx $idx]
}
```

___Задание___

1. Сформируйте процедуру записи в файл значения в виде `write_to_file("my_file.txt", $a)`.
2. Сформируйте процедуру создания N папок и их удаления. Для этого используйте команды bash для создания `mkdir` и удаления папок `rm -r`.