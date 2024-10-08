#Область ПрограммныйИнтерфейс

Процедура Д_ДополнитьФорму(Форма) Экспорт 
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		Д_ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		Д_ПодборКонтактныхлицДляКонтрагентов(Форма);
		Д_ДобавитьПолеСогласованнаяСкидкаНаФорму(Форма);
		Д_ДобавитьКомандуПересчитатьТаблицуНаФорму(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		Д_ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		Д_ПодборКонтактныхлицДляКонтрагентов(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		Д_ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		Д_ПодборКонтактныхлицДляКонтрагентов(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		Д_ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
		Д_ПодборКонтактныхлицДляКонтрагентов(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		Д_ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
		Д_ПодборКонтактныхлицДляКонтрагентов(Форма);
	КонецЕсли;
	
КонецПроцедуры 

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

Процедура Д_ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода; 
	ПолеВвода.ПутьКДанным = "Объект.Д_КонтактноеЛицо";
	
КонецПроцедуры 

Процедура Д_ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма)
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода; 
	ПолеВвода.ПутьКДанным = "Объект.Д_КонтактноеЛицо";
	
КонецПроцедуры

Процедура Д_ДобавитьПолеСогласованнаяСкидкаНаФорму(Форма)
	
	ГруппаШапкаЛево = Форма.Элементы.ГруппаШапкаЛево;
	ГруппаШапкаЛево.РастягиватьПоГоризонтали = Ложь; 
	ГруппаСкидка = Форма.Элементы.Добавить("ГруппаСкидка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	ГруппаСкидка.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаСкидка);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.РастягиватьПоГоризонтали = Истина;
	ПолеВвода.ПутьКДанным = "Объект.Д_СогласованнаяСкидка";
	ПолеВвода.УстановитьДействие("ПриИзменении", "Д_СогласованнаяСкидкаПриИзменении");
	
КонецПроцедуры 

Процедура Д_ДобавитьКомандуПересчитатьТаблицуНаФорму(Форма) Экспорт  
	
	КомандаПеречсчитатьТаблицы = Форма.Команды.Добавить("ПересчитатьТаблицы");
	КомандаПеречсчитатьТаблицы.Заголовок = "Пересчитать таблицы";
	КомандаПеречсчитатьТаблицы.Действие = "Д_ДобавитьКомандуПересчитатьТаблицуНаФорму";
	
	КнопкаКоманды = Форма.Элементы.Добавить("ПересчитатьТаблицы", Тип("КнопкаФормы"), Форма.Элементы.ГруппаСкидка);
	КнопкаКоманды.ИмяКоманды = "ПересчитатьТаблицы";
	КнопкаКоманды.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	КнопкаКоманды.РастягиватьПоГоризонтали = Истина;
	КнопкаКоманды.Отображение = ОтображениеКнопки.КартинкаИТекст;
	КнопкаКоманды.Картинка = БиблиотекаКартинок.Обновить;
	
КонецПроцедуры 

#КонецОбласти 

#Область СлужебныеПроцедурыИФункции

Процедура Д_ПодборКонтактныхлицДляКонтрагентов(Форма)
	
	Форма.Элементы.КонтактноеЛицо.СвязиПараметровВыбора = Новый ФиксированныйМассив(Новый массив);
	
	НоваяСвязь = Новый СвязьПараметраВыбора("Отбор.Владелец", "Объект.Контрагент");
	НовыйМассив = Новый Массив();
	НовыйМассив.Добавить(НоваяСвязь);
	
	Форма.Элементы.КонтактноеЛицо.СвязиПараметровВыбора = Новый ФиксированныйМассив(НовыйМассив);
	
КонецПроцедуры 

#КонецОбласти 


