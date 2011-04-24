# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.

require 'custom_io'             # Мы тут используем собственные команды ввода-вывода
require 'db'

# Этот класс хранит все возможные команды, которые может ввести пользователь, и соответствующие им процедуры.

class Action

#	В этом массиве будем хранить экземпляры Action
	@@actions = []

#	Возвращаем команды по умолчанию
	def self.return_default_actions
		@@actions.collect {|action| action.aliases.first}
	end

#	Проверяем, верна ли команда
	def self.find_action (user_action)
		@@actions.find do |action|
			action.action_exists?(user_action)
		end
	end


	def initialize(aliases=[], &block)
#		Добавляем новый экземпляр массив класса
		@@actions << self

#		Присваиваем значения
		@aliases = aliases
		@action = block

#		Ругаемся при отсутствии аргументов
		raise(ArgumentError,"Отсутствуют алиасы при создании экземпляра Action") if @aliases.count < 1
#		raise(ArgumentError,"Отсутствует процедура при создании экземпляра Action") unless @action
	end


	attr_reader(:aliases)

#	Содержит ли данный инстанс Action такое-то действие?
	def action_exists?(action)
		@aliases.include?(action)
	end

#	Выполняем действие
	def do!
		putn "Выполняю команду #{@aliases.first}"
		@action.call
	end
end

require 'action_definitions'    # Загружаем инстансы действий