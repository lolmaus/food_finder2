# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

# Для отступов используется табуляция шириной в четыре пробела.


#### Food Finder ####
#
# Запускайте этот файл из командной строки
# для работы с Food Finder.
#



# Константа APP_ROOT будет содержать текущую директорию
APP_ROOT = File.dirname(__FILE__)

# Добавляем текущий путь в список путей, где искать файлы
$:.unshift( File.join(APP_ROOT, 'lib') )
$:.unshift( File.join(APP_ROOT, 'conf') )

# Подключаем библиотеки

require 'conf'          # Конфигурация
require 'restaurant'    # Модель
Restaurant.init!


require 'guide' # Класс взаимодействия с пользователем

# Поехали!
Guide.launch!