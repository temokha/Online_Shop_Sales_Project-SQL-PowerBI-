# Onlines_Shop_Sales_Project-SQL-PowerBI-

![image](https://github.com/user-attachments/assets/d99b874f-03c5-4ce7-b31e-0c48553d0bb0)
![image](https://github.com/user-attachments/assets/b5a5dd28-203f-4581-ac1d-70d98e8d31c1)

## [RUS]

## О проекте

Проект был посвящен анализу продаж онлайн-магазина и включал несколько ключевых этапов, которые обеспечили успешное выполнение поставленных задач.

Начало проекта состояло в подготовке файла необработанных данных, где собранная информация о продажах была объединена в единый файл. После этого была создана база данных, которая служила основой для хранения и обработки данных. Импорт данных из исходного файла в базу данных позволил эффективно управлять и анализировать информацию.

Следующим важным шагом стала очистка импортированных данных. Это включало удаление дубликатов, исправление ошибок и приведение данных к единому формату. Также были изменены типы данных для обеспечения корректной работы с информацией и выполнения различных аналитических операций.

Выполнение SQL-запросов в соответствии с бизнес-требованиями позволило получить ключевые выводы и результаты, которые были сохранены для дальнейшего использования. Для обеспечения прозрачности и воспроизводимости процесса был подготовлен SQL-документ, подробно описывающий выполненные операции.

Завершающим этапом проекта стала загрузка базы данных в Power BI, где была создана серия визуализаций для представления данных. Были посчитаны различные меры и построены диаграммы, которые наглядно показывали ключевые тренды в продажах. Интерфейс Power BI позволил пользователям интерактивно взаимодействовать с данными, фильтровать информацию по различным критериям и углубляться в детали.

Проект успешно достиг своих целей, обеспечив удобный и эффективный способ анализа продаж онлайн-магазина, что поспособствует принятию более обоснованных решений и разработке стратегий, основанных на данных.

## Бизнес-запросы

### 1. KPI требования
Анализ продаж:
- Рассчитать объем продаж за весь отчетный период.
- Рассчитать объем продаж для каждого соответствующего месяца.
-	Рассчитать в процентном соотношении разницу в продажах между выбранным месяцем и предыдущим.

Анализ заказов:

-	Рассчитать количество заказов за весь отчетный период.
-	Рассчитать количество заказов за каждый соответствующий месяц.
-	Рассчитать в процентном соотношении разницу в количестве заказов между выбранным месяцем и предыдущим.

Анализ проданных товаров:

-	Рассчитать количество проданных товаров за весь отчетный период.
- Рассчитать количество проданных товаров за каждый соответствующий месяц.
-	Рассчитать в процентном соотношении разницу в количестве проданных товаров продажах между выбранным месяцем и предыдущим.

### 2. Требования по визуализации
-	Ежедневный тренд по общему количеству заказов: создать чарт, который отображает ежедневную тенденцию общего количества заказов.

-	Ежемесячный тренд по общему количеству заказов: создать чарт, который позволяет анализировать динамику числа заказов на протяжении месяцев. Этот чарт поможет выявить паттерны и изменения в объеме заказов в различные периоды времени, что является ключевым аспектом для планирования и прогнозирования бизнес-активностей.

-	Анализ продаж по категориям товаров: проанализировать показатели продаж в различных категориях товаров, а также предоставить информацию о том, какие категории товаров вносят наибольший вклад в общий объем продаж.

-	Топ 5 товаров по объему продаж: определить и отобразить 5 лучших продуктов по объему продаж.
  
-	Географический анализ продаж: создать чарт, который визуализирует географическое распределение продаж. Этот чарт позволит исследовать, какие регионы вносят наибольший вклад в общий объем продаж. Выявление географических паттернов поможет оптимизировать логистику, адаптировать маркетинговые стратегии и управлять поставками на основе региональных данных о продажах.
  
-	Влияние пола покупателя на продажи: провести сравнительный анализ продаж в разрезе пола покупателя. Создать чарты или диаграммы, которые отображают долю покупок, сделанных мужчинами и женщинами.
  
-	Анализ продаж будни/входные: для анализа продаж в будние и выходные дни создайте визуализацию, которая показывает объем продаж, сгруппированный по типу дня недели. 

## Стек
- MySql
- PowerBI

## [ENG]

## About the Project

The project focused on analyzing online store sales and included several key stages that ensured successful completion of the tasks.

The project began with the preparation of a raw data file, where the collected sales information was consolidated into a single file. Following this, a database was created to serve as the foundation for storing and processing the data. Importing data from the source file into the database enabled effective management and analysis of the information.

The next important step was cleaning the imported data. This involved removing duplicates, correcting errors, and standardizing the data format. Additionally, data types were modified to ensure accurate handling and performance of various analytical operations.

Executing SQL queries according to business requirements allowed for obtaining key findings and results, which were then saved for further use. To ensure transparency and reproducibility of the process, an SQL document was prepared detailing the operations performed.

The final stage of the project was loading the database into Power BI, where a series of visualizations were created to represent the data. Various measures were calculated and charts were built to clearly display key sales trends. The Power BI interface allowed users to interact with the data, filter information based on various criteria, and delve into details.

The project successfully achieved its goals, providing a convenient and efficient way to analyze online store sales, which will contribute to making more informed decisions and developing data-driven strategies.

## Business Requirements

### 1. KPI Requirements
**Sales Analysis:**
- Calculate total sales volume for the entire reporting period.
- Calculate sales volume for each respective month.
- Calculate the percentage difference in sales between the selected month and the previous month.

**Order Analysis:**
- Calculate the total number of orders for the entire reporting period.
- Calculate the number of orders for each respective month.
- Calculate the percentage difference in the number of orders between the selected month and the previous month.

**Sold Products Analysis:**
- Calculate the total number of sold products for the entire reporting period.
- Calculate the number of sold products for each respective month.
- Calculate the percentage difference in the number of sold products between the selected month and the previous month.

### 2. Visualization Requirements
- **Daily Order Trend**: Create a chart that displays the daily trend of the total number of orders.

- **Monthly Order Trend**: Create a chart that allows for analyzing the dynamics of the number of orders over the months. This chart will help identify patterns and changes in order volume over different periods, which is a key aspect for planning and forecasting business activities.

- **Sales Analysis by Product Categories**: Analyze sales figures across various product categories and provide information on which categories contribute the most to the total sales volume.

- **Top 5 Products by Sales Volume**: Identify and display the top 5 products by sales volume.

- **Geographic Sales Analysis**: Create a chart that visualizes the geographic distribution of sales. This chart will help explore which regions contribute the most to the total sales volume. Identifying geographic patterns will aid in optimizing logistics, adapting marketing strategies, and managing supplies based on regional sales data.

- **Impact of Customer Gender on Sales**: Conduct a comparative analysis of sales based on customer gender. Create charts or diagrams that display the share of purchases made by men and women.

- **Weekday/Weekend Sales Analysis**: To analyze sales on weekdays and weekends, create a visualization that shows the sales volume grouped by the type of day of the week.

## Stack
- MySQL
- Power BI










