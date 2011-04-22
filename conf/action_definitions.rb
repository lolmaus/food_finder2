# coding: utf-8
# «Магический комментарий», задающий кодировку содержимого.


#   Создаем новые действия. Экземпляры класса вызываются в никуда, но при инициализации они сохраняются в переменную
#   класса.

#############################
#   Вывод списка ресторанов #
#############################
Action.new(['list','read']) do
	putn "Перечисляем рестораны."
	resaurants = Restaurant.saved_restaurants
end

#####################
#   Поиск ресторана #
#####################
Action.new(['find','search'])

#################################
#   Добавление нового ресторана #
#################################
Action.new(['add','new']) do
	putn "Добавляем ресторан. Введите его данные."

	restaurant = Restaurant.build_with_wizard

	if restaurant
		if restaurant.save
			putn "Ресторан добавлен.n"
		else
			putn "Ошибка сохранения. :( Ресторан не добавлен."
		end
	end
end

#########
# Выход #
#########
Action.new(['quit','exit']) { :quit }