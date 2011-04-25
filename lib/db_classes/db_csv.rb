# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

require 'csv'

class DB_CSV < DB

	@@db_type = :csv

#	Добавляемся в хэш родительского класса.
	DB[@@db_type] = self

	def initialize
#		В этой переменной хранится путь к файлу БД.
		@db_path = File.join(APP_ROOT, Conf[:db_name] + ".csv")
	end

	def db_accessible?
		return true if @db_path &&
				File.exists?(@db_path) &&
				File.readable?(@db_path) &&
				File.writable?(@db_path)
		# Конец if
	end

	def db_init
		File.open(@db_path, 'w').close unless db_accessible?
		return db_accessible?
	end

	def add (arr)
	    CSV.open(@db_path, 'a:UTF-8') do |writer|
			writer << arr
		end
	end
end
