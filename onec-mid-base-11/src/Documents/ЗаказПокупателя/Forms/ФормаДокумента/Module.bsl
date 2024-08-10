
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)

	// ++ Бобренок С.В. Задача Заказчика, Дата 10.08.24
	//КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
	ТекущиеДанные.Сумма = ТекущиеДанные.Количество * (ТекущиеДанные.Цена - ТекущиеДанные.Цена * Объект.Д_СогласованнаяСкидка/100);
		
	РассчитатьСуммуДокумента();
	// --
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти

#Область Доработки

&НаКлиенте
Процедура Д_ДобавитьКомандуПересчитатьТаблицуНаФорму(Команда)
	// ++ Бобренок С.В. Задача Заказчика, Дата 10.08.24
	Если ЗначениеЗаполнено(Объект.Товары) Тогда
		Д_ЗадатьВопросПриНажатииКнопкиПересчитатьТаблицу();
	ИначеЕсли ЗначениеЗаполнено(Объект.Услуги) Тогда
		Д_ЗадатьВопросПриНажатииКнопкиПересчитатьТаблицу();
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура Д_ПересчитатьТаблицу()
	// ++ Бобренок С.В. Задача Заказчика, Дата 10.08.24
	Для Каждого СтрокаТовары Из Объект.Товары Цикл 
		РассчитатьСуммуСтроки(СтрокаТовары);
	КонецЦикла;
	
	Для Каждого СтрокаУслуги Из Объект.Услуги Цикл 
		РассчитатьСуммуСтроки(СтрокаУслуги);
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура Д_СогласованнаяСкидкаПриИзменении(Элемент)
	// ++ Бобренок С.В. Задача Заказчика, Дата 10.08.24
	Если ЗначениеЗаполнено(Объект.Товары) Тогда
		Д_ЗадатьВопросПриИзмененииСкидки();
	ИначеЕсли ЗначениеЗаполнено(Объект.Услуги) Тогда
		Д_ЗадатьВопросПриИзмененииСкидки();
	КонецЕсли;
	
КонецПроцедуры 

&НаКлиенте
Процедура Д_ЗадатьВопросПриИзмененииСкидки()
	// ++ Бобренок С.В. Задача Заказчика, Дата 10.08.24
	Оповещение = Новый ОписаниеОповещения("Д_ПослеОтветаНаВопросПриИзмененииСкидки", ЭтотОбъект); 
	
	ПоказатьВопрос(Оповещение, "Изменен процент скидки! Пересчитать таблицы товаров и услуг?", 
	РежимДиалогаВопрос.ДаНетОтмена, 0, КодВозвратаДиалога.Да, "Внимание!");
	
КонецПроцедуры

&НаКлиенте
Процедура Д_ПослеОтветаНаВопросПриИзмененииСкидки(Результат, Параметры) Экспорт
	// ++ Бобренок С.В. Задача Заказчика, Дата 10.08.24
	Если Результат = КодВозвратаДиалога.Да Тогда
		Д_ПересчитатьТаблицу();
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура Д_ЗадатьВопросПриНажатииКнопкиПересчитатьТаблицу()
	// ++ Бобренок С.В. Задача Заказчика, Дата 10.08.24
	Оповещение = Новый ОписаниеОповещения("Д_ПослеОтветаНаВопросПриНажатииКнопкиПересчитатьТаблицу", ЭтотОбъект); 
	
	ПоказатьВопрос(Оповещение, "Вы хотите пересчитать таблицы товаров и услуг?", 
	РежимДиалогаВопрос.ДаНетОтмена, 0, КодВозвратаДиалога.Да, "Внимание!");
	
КонецПроцедуры

&НаКлиенте
Процедура Д_ПослеОтветаНаВопросПриНажатииКнопкиПересчитатьТаблицу(Результат, Параметры) Экспорт
	// ++ Бобренок С.В. Задача Заказчика, Дата 10.08.24
	Если Результат = КодВозвратаДиалога.Да Тогда
		Д_ПересчитатьТаблицу();
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти
