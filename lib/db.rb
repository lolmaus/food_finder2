# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

#Этот класс — заглушка. В нем декларируются пустые методы работы с БД. Эти методы должны быть реализованы
#в дочернем классе.
#
#DB грузит все дочерние классы. Каждый дочерний класс добавляет в хэш DB.db_types элемент, ключом которого является
#символ, аналогичный символу в конфиге, а значением ? константа самого класса.
#
#Потом перебираем case'ом все элементы DB.db_types и создаем инстанс соответствующего класса.

require 'custom_io'

class DB

#	В этом хэше храним типы баз данных. Ключ — символ, который берется из конфига. Значение — константа класса.
	@@database_types = {}
	def self.[]=(key,value)
		@@database_types[key] = value
	end
	def self.[](key)
		@@database_types[key]
	end

	def self.return_new_db_instance
#   	Грузим все классы из поддиректории.
		Dir[File.dirname(__FILE__) + '/db_classes/*.rb'].each {|file| require file }

#   	Проверяем, имеется ли тип БД того типа, который прописан в конфиге
		unless Conf[:db_type]
			putn "В конфиге не указан тип БД. Программа прервана."
			exit!
		end
		if @@database_types.has_key?(Conf[:db_type])
			return @@database_types[Conf[:db_type]].new

		else
			putn "Не обнаружен тип БД, прописанный в конфиге. Программа прервана."
			exit!
		end
	end


#	Заглушки методов, которые должны быть реализованы в дочернем классе.

	def add
	end

	def db_accessible?
	end

	def db_init
	end

end
