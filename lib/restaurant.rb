# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

require 'db'

class Restaurant
	
#	Запрашиваем инстанс по работе с моделью.
	@@db = DB.return_new_db_instance
	
	def self.database
		@@db 
	end
	
	
	def self.init!
		#		Проверяем базу данных.
		if @@db.db_accessible?
			putn "База данных обнаружена."
		elsif @@db.db_init
			putn "Cоздана пустая база данных."
		else
			putn "База данных недоступна. Программа прервана."
			exit!
		end
	end
	
	
	
	def self.build_with_wizard
		putn "Добавляем ресторан. Введите его данные."
		
		args = {}

		pri "Название ресторана: "
		args[:name] = get.strip

		unless args[:name] && args[:name].length > 1
			putn "Вы не ввели название ресторана. Добавление ресторана прервано."
			return nil
		end

		pri "Кухня: "
		args[:cuisine] = get.strip

		pri "Средний счет (в рублях): "
		args[:price] = get.strip

		return self.new(args)
	end
	
	
	def initialize(hash)
		raise ArgumentError, "Не указано имя ресторана." unless
			@name   = hash[:name]
		
		@price      = hash[:price]   || ""
		@cuisine    = hash[:cuisine] || ""
	end
	
	
	def save
		return false unless @@db.db_accessible?

		output_array = [@name, @cuisine, @price]

		@@db.add(output_array)
	end
end