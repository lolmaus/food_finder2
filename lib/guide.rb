# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

# Класс Guide — синглтон, реализующий цикл взаимодействия с пользователем.

require 'custom_io' # Мы тут используем собственные команды ввода-вывода
require 'action'    # Работаем с действиями

class Guide

	#   Запуск процесса
	def self.launch!

		# Приветствуем пользователя
		self.introduction

		#################
		# Основной цикл #
		#################

		# В цикле запрашиваем действие, пытаемся его выполнить. Действие возвращает значение.

		result = nil
		until result == :quit # Завершаем цикл, если пользователь ввел "quit"

			# Запарашиваем, что пользователь хочет сделать.
			action = self.get_action

			# Выполнить это действие, сохранить результат в result
			#result = Action.perform(action)

			result = :quit if action == "quit"
		end

		# Завершение
		self.conclusion
	end

	def self.introduction
		putn "<<< Добро пожаловать в Food Finder>>>"
		putn "Это интерактивный каталог, который поможет вам выбрать ресторан по вкусу."
	end

	def self.conclusion
		putn "<<< До свидания и приятного аппетита! >>>"
	end

	#   Метод спрашивает у класса action возможные команды и выводит пользователю.
	#   Затем запрашивает у пользователя команду, проверяет ее валидность и возвращает или ругается.
	def self.get_action

		userinput = nil

		# Спрашиваем пользователя, что он хочет, пока он не введет валидную команду.
		loop do

			# Получаем команду пользователя
			putn "Введите одну из команд: " + Action.return_default_actions.join(", ")
			pri "> "
			userinput = get.downcase.strip

#			Берем действие, соответствующее команде
			action = Action.find_action(userinput)

#			Начинаем сначала, если такой команды нету
			unless action
				putn "Команда не распознана"
				next
			end

#			Момент истины
			action_result = action.do!

			break if action_result == :quit
		end

		# Возвращаем верную команду
		return userinput
	end

end