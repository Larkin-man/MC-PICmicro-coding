# MC PICmicro coding
 Учебные программы для микропроцессоров серии PIC16F84 фирмы Microchip Technology Incorporated.

Файлы, формируемые линкером:
• Файл (.cod), файл отладки используемый MPLAB IDE;
• Файл листинга программы (.lst), первоначальный исходный текст совмещенный с кодом программы.
• ASM исходный файл на ассемблере
• ERR список ошибок при компиляции
• HEX код для микроконтроллера PICmicro
• PJT файл проекта
 

# LAB 1
«РАБОТА С ПОРТОМ “В”»
ЦЕЛЬ: Вывод числа на порт “B”.

# LAB 2
«РАБОТА С ПОРТОМ “А”»
ЦЕЛЬ:  Ввести число в микроконтроллер через порт  “А”  и отобразить его на порте «В». Число задается путем пе-реключения соответствующих тумблеров на учебном стенде “СУ PIC16F84 – 1”.

# LAB 3
«СЛОЖЕНИЕ ЧИСЕЛ»
ЦЕЛЬ: Сложить два числа и вывести результат на порт “В”.

# LAB 4
«УМНОЖЕНИЕ ЧИСЕЛ»
ЦЕЛЬ: Умножить два числа и вывести результат на порт “В”.

# LAB 5
«ДЕЛЕНИЕ ЧИСЕЛ»
ЦЕЛЬ: Разделить одно число на другое и вывести полученное значение на порт “В”.

# LAB 6
«ВЫЗОВ ПОДПРОГРАММ»
ЦЕЛЬ: Совместить воедино работы  программ использованных в лабораторных работах №№ 1,3,4,5. Вызов каждой из программ осуществляется аппаратно, путем подачи на порт «А» соответствующего кода.

# LAB 7
«БЕГУЩИЕ ОГНИ»
ЦЕЛЬ:  Организация управления портом “B”. Бегущий огонь начиная сверху по два светодиода вниз.

# LAB 8
«МОДЕЛЬ ОСВЕТИТЕЛЬНЫХ ПРИБОРОВ АВТОМОБИЛЯ»
ЦЕЛЬ:  Построение и реализация модели внешних световых приборов автомобиля. 

# LAB 9
«КОДОВЫЙ ЗАМОК»
ЦЕЛЬ: Совместить воедино работы  программ использованных в лабораторных работах №№ 2,7.
Описание: 
Суть лабораторной работы заключается в закреплении навыков  организации циклов и работы с командами перехода ветвления.
Для выполнения лабораторной работы необходимо в один файл поместить тексты программ лабораторных работ №№ 2,7. Организовать цикл опроса порта «А». При наличии на порте «А» этого кода - «Замок» открыт (все светодиоды порта «В»горят). При наличии на порте «А» любого другого кода - «Замок» закрыт (светодиоды порта «В» «мигают» в соответствии заданием лабораторной работы № 7).

# LAB 10
«СВЕТОДИОДНАЯ ЛИНЕЙКА»
ЦЕЛЬ: Точная установка временных задержек в работе программы.
Примечание:
Перед началом выполнения работы необходимо выяснить, сколько тактов занимают команды микроконтроллера, и на какой тактовой частоте он работает.

# LAB 11
«СВЕТОФОР»
ЦЕЛЬ: Создание системы управления уличным светофором.
Описание: 
Суть лабораторной работы заключается в закреплении навыков работы с командами микроконтроллера, организации циклов, работы с командами ветвления и установки точных временных задержек. Результат  выводится на порт «В».
Алгоритм работы светофора:
Зададимся тремя фиксированными временными задержками: А – 10 секунд, В – 4 секунды, С – 1 секунда. Теперь алгоритм работы светофора можно представить следующим образом:
«Красный» - А – «Красный + Желтый» - В – «Зеленый» - А – «Все погашено» - С – «Зеленый» - С – «Все погашено» - С – «Зеленый» - С– «Все погашено» - С – «Зеленый» - С– «Все погашено» - С – «Зеленый» - С– «Все погашено» - С – «Зеленый» - С – «Желтый» - В – «Красный». И так далее – в цикле.

# LAB 12
«ЛИФТ»
ЦЕЛЬ:  Создание действующей модели движения пассажирского лифта.
Описание: 
Суть лабораторной работы заключается в закреплении навыков работы с командами микроконтроллера, организации циклов, работы с командами перехода и установления точных временных задержек. Результат  выводится на порт «В».  
Построение модели:
Лифт обслуживает пять этажей. На этаж вызывается кратковременным включением соответствующего тумблера порта «А» (после включения тумблер должен быть немедленно возвращен в положение «отключено»). Светодиоды порта «В» имитируютсостояние и положение кабины лифта. Тумблеры порта «А» имитируют кнопки вызова кабины на этажах.
Распределить светодиода порта «В» следующим образом:
Номер светодиода	1	2	3	4	5	6	7	8
Назначение	Первый этаж	Второй этаж	Третий этаж	Четвертый этаж	Пятый этаж	Двери кабины открыты	Двери кабины закрыты	Лифт занят (свободен)

Свечение светодиодов №№ 1,2,3,4,5 отображают нахождение кабины на соответствующем этаже; свечение светодиода № 6 имитирует открытое состояние дверей кабины; свечение светодиода № 7 имитирует закрытое состояние дверей кабины; свечение светодиода № 8 означает, что лифт свободен и может быть вызван на любой этаж. Если светодиод № 8 погашен - значит лифт занят. Во время занятого состояния лифта кнопки вызова (порт «А») должны быть заблокированы, и не позволять произвести вызов кабины.

Пример алгоритма работы:
Пусть кабина лифта находится на четвертом этаже и готова к вызову (горят светодиоды № 4, 7, 8). Произведем вызов кабины на первый этаж, путем кратковременного переведения нижнего тумблера порта «А» в положение «включено» с последующим возвратом в положение «отключено». При этом гаснет светодиод № 8, и через одну секунду лифт начинает двигаться вниз (режим бегущего огня от третьего светодиода к первому). На первом этаже лифт останавливается и открывает двери (горят светодиоды №№ 1, 6; светодиод № 7 гаснет). Через пять секунд лифт закрывает двери (светодиод № 6 гаснет, а № 7 загорается). Через две секунды лифт готов к вызову (горят светодиоды №№ 1, 7, 8).
