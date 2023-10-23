
# SQL Guidance
SQL入門手冊<br>
定義：指令基礎定義<br>
註解：SQL註解方式<br>
資料型態：SQL欄位常見型態<br>
語法練習<br>


## 定義 Definition
### Data Definition Language (DDL) 資料定義語言
用來定義資料庫、資料表、檢視表、索引、預存程序、觸發程序、函數等資料庫物件。
- CREATE: 建立資料庫的物件
- ALTER: 變更資料庫的物件
- DROP: 刪除資料庫的物件
- TRUNCATE: 清除資料庫表格內的資料

### Data Manipulation Language (DML) 資料操縱語言
用來處理資料表裡的資料。
- INSERT: 新增資料到資料表中
- UPDATE: 更改資料表中的資料
- DELETE: 刪除資料表中的資料

### Data Query Language (DQL) 資料查詢語言
用來查詢資料表裡的資料。
- SELECT: 選取資料庫中的資料

### (Optional) Data Control Language (DCL) 資料控制語言
用來控制資料表、檢視表的存取權限。
- GRANT: 賦予使用者使用權限
- REVOKE: 取消使用者的使用權限

### (Optional) Transaction Control Language (TCL) 交易語言
交易是單一工作單元。 如果交易成功，便會確定交易期間所修改的所有資料，且會成為資料庫中永久的內容。 如果交易發現錯誤，必須取消或回復，便會清除所有的資料修改。
- COMMIT: 完成交易作業
- ROLLBACK: 交易作業異常，將已變動的資料回復到交易開始的狀態


## 註解 Comment
~~~~SQL
-- SQL的單行註解方式為在開頭加上兩個短直線dash
/*
SQL的多行註解方式為在起始加上"斜線/星號*"，在結尾將上"星號*斜線/"
*/
~~~~


## 資料型態 Data Type
|Category|Data Type|Description|Example|
|:-------|:-------:|:----------|------:|
|Numeric Data|INT|整數，範圍從-2^31到2^31-1。|35|
|''|BIGINT|整數，範圍從-2^63到2^63-1。|9876543210|
|''|NUMERIC(p, s)|含小數點的數值，有效位數p包含小數點左右兩側的總數，最大值為38。s為小數位數，因此p>=s>=0。|NUMRIC(5, 2)<br>253.41|
|''|DECIMAL(p, s)|功能同NUMERIC。|DECIMAL(5, 2)<br>253.41|
||FLOAT(n)|浮點數，n為小數位數。|FLOAT(1)<br>30.0|
|Date Data|DATE|日期，預設以'YYYY-MM-DD'格式儲存，通常搭配CAST和CONVERT轉換格式。|2023-01-01|
|''|DATETIME|日期加上時間，預設以'YYYY-MM-DD hh:mm:ss.n*'格式儲存，n為毫秒，介於0至999。|2023-01-01 12:34:56.789|
|''|TIME|時間，預設以'hh:mm:ss.n*'格式儲存，n*是代表小數秒數的零至七位數，介於0至9999999。|12:34:56.789|
|String Data|CHAR(n)|UTF8編碼的字串，固定大小的字串資料，n介於1到8000。適用在英文數字資料儲存。|CHAR(3)<br>'abc'|
|''|VARCHAR(n)|UTF8編碼的字串，可變大小的字串資料，n介於1到8000，或使用max當n大於8000。適用在英文數字資料儲存。|VARCHAR(10)<br>'a1s2d3'|
|''|NCHAR(n)|Unicode編碼的字串，固定大小的字串資料，n介於1到4000。適用在多國語言資料儲存。|NCHAR(3)<br>'說中文'|
|''|NVARCHAR(n)|Unicode編碼的字串，可變大小的字串資料，n介於1到4000，或使用max當n大於4000。適用在多國語言資料儲存。|NVARCHAR(10)<br>'中英夾雜der字串'|
|Primary Key|UNIQUEIDENTIFIER|全域唯一識別碼(GUID)使用的16位元組二進位值的資料類型，目的是識別資料。|SELECT NEWID()<br>SELECT NEWSEQUENTIALID()|


## 語法練習Syntax Exercise
- **增刪查改(CRUD)**在SQL中分別對應到**INSERT**、**DELETE**、**SELECT**、**UPDATE**
- SQL語法指令有一定順序
- SQL有些指令可以略過不寫，例如：給資料表別名時，**AS**可以不寫
- **空白**、**縮排**和**換行**不影響程式執行
- 原則上不分英文大小寫(**Case-Insensitive**)
- 一般情況下，為維持語法美觀，內建指令會以全大寫書寫，其他如表名、欄位名等則保持原樣
- 可透過SQL Formatter線上網站迅速校正語法
- 代表語法結束的**分號';'**可加可不加
- **星號'*'**代表一個資料表全部的欄位


### Create Table
製作資料表，並指定欄位名稱與資料型態。

#### Syntax
~~~~SQL
CREATE TABLE table_1
(
    column_1 data_type_1,
    column_2 data_type_2,
    column_3 data_type_3
);
~~~~

#### Example
製作一個資料表名為**customers**，欄位按以下順序：**C_Id**為**INT**，**Name**為**VARCHAR(50)**，**City**為**VARCHAR(50)**，**Address**為**VARCHAR(255)**，**Phone**為**VARCHAR(20)**。
~~~~SQL
CREATE TABLE customers
(
    C_Id INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    Address VARCHAR(255),
    Phone VARCHAR(20)
);
~~~~


### DROP Table
刪除資料表。

#### Syntax
~~~~SQL
DROP TABLE table_1;
~~~~

#### Example
刪除**customers**資料表。
~~~~SQL
DROP TABLE customers;
~~~~


### Insert Data
當資料表存在時，插入資料。

#### Syntax
- 指定插入的資料表與欄位名稱，並給予對應欄位的值
~~~~SQL
INSERT INTO table_1 (column_1, column_2, column_3, column_4)
VALUES (value1_1, value1_2, value1_3, value1_4),
(value2_1, value2_2, value2_3, value2_4),
(value3_1, value3_2, value3_3, value3_4);
~~~~

- 指定插入的資料表，按順序給予資料表所有欄位的值
~~~~SQL
INSERT INTO table_1
VALUES (value1, value2, value3, value4);
~~~~

#### Example
給予資料表customers資料，分別為：
|C_Id|Name|City|Address|Phone|
|----|----|----|-------|-----|
|1|張一|台北市|XX路100號|02-12345678|
|2|王二|新竹縣|YY路200號|03-12345678|
|3|李三|高雄縣|ZZ路300號|07-12345678|
|4|陳四|台北市|AA路400號|02-87654321|

~~~~SQL
INSERT INTO customers (C_Id, Name, City, Address, Phone)
VALUES (1, '張一', '台北市', 'XX路100號', '02-12345678'),
(2, '王二', '新竹縣', 'YY路200號', '03-12345678');

INSERT INTO customers
VALUES (3, '李三', '高雄縣', 'ZZ路300號', '07-12345678');

INSERT INTO customers (C_Id, Name, City, Address, Phone)
VALUES (4, '陳四', '台北市', 'AA路400號', '02-87654321');
~~~~


### Select Data
選取資料表中的資料，常搭配以下指令：
- SELECT：選取欄位
- DISTINCT：將所選取的欄位進行清除重複資料的操作
- FROM：從特定資料表中選取資料
- WHERE：從資料表中篩選符合特定條件的資料
- AND：同時符合多個特定條件時，使用AND連接
- OR：只需符合多個特定條件的其中之一時，使用OR連接
- ORDER BY：將所選取出來的資料，按照特定欄位的順序排列，通常會搭配ASC或DESC指定升序或降序排列

若有**聚合函數Aggregate Function**運算時，常搭配以下指令：
- COUNT(column_1)：計算分組後，所選取欄位的數量
- SUM(column_1)：計算分組後，所選取欄位的總和，該欄位必須為可做相加之資料型態
- GROUP BY：依照所選取的欄位做分組計算
- HAVING：在分組計算完後，篩選符合特定條件的資料

#### Syntax
- 從資料表選取資料，篩選出符合條件一，或是同時滿足條件二和條件三的資料，選取所有的欄位並清除重複，最後以欄位一座降序排序
~~~~SQL
SELECT DISTINCT *
FROM table_1
WHERE condition_1
OR (condition_2 AND condition_3)
ORDER BY column_1 DESC;
~~~~

- 從資料表選取資料，篩選出符合條件一的資料，以欄位一和欄位二的值來進行分組，選取欄位一、欄位二、每個分組的數量、每個分組中欄位三的總和，並篩選出總和大於0的資料
~~~~SQL
SELECT column_1, column_2, COUNT(*) AS CNT, SUM(column_3) AS SUM_col3
FROM table_1
WHERE condition_1
GROUP BY column_1, column_2
HAVING SUM(*) > 0;
~~~~

#### Example
- 從資料表customers中選取所有欄位，並以C_Id做降序排序
~~~~SQL
SELECT *
FROM customers
ORDER BY C_Id DESC;
~~~~

- 從資料表customers中選取C_Id、Name、City，篩選出C_Id是3，或是符合City為台北市或高雄市且Name是張一的資料
~~~~SQL
SELECT C_Id, Name, City
FROM customers
WHERE C_Id = 3
OR (City IN ('台北市', '高雄縣') AND Name = '張一');
~~~~

- 從資料表customers中選取City欄位，並移除重複
~~~~SQL
SELECT DISTINCT City
FROM customers;
~~~~

- 以City為組別，從資料表customers中選取City，並計算每組的數量
~~~~SQL
SELECT City, COUNT(*) AS CNT
FROM customers
GORUP BY City;
~~~~


### Alter TABLE
針對已存在的資料表做結構更改，例如：新增欄位、修改原欄位的資料型態、刪除欄位。

#### Syntax
- 新增欄位
~~~~SQL
ALTER TABLE table_1 ADD column_new data_type_new;
~~~~

- 修改原欄位的資料型態
~~~~SQL
ALTER TABLE table_1 ALTER COLUMN column_1 data_type_new;
~~~~

- 刪除欄位
~~~~SQL
ALTER TABLE table_1 DROP COLUMN column_1;
~~~~

#### Example
- 新增欄位discount，資料型態為VARCHAR(10)，至資料表customers
~~~~SQL
ALTER TABLE customers ADD discount VARCHAR(10);
~~~~

- 修改資料表customers中，欄位discount的資料型態為DECIMAL(18, 2)
~~~~SQL
ALTER TABLE customers ALTER COLUMN discount DECIMAL(18, 2);
~~~~

- 刪除資料表customers的欄位discount
~~~~SQL
ALTER TABLE customers DROP COLUMN discount;
~~~~


### Update Data
修改資料表中的資料。

#### Syntax
- 最後必須加入WHERE針對想修改的資料進行更新，若不加入條件，則會將整張資料表更新。
~~~~SQL
UPDATE table_1
SET column_1 = value_1, column_2 = value_2, column_3 = value_3
WHERE condition_1;
~~~~

#### Example
- 修改資料表customers中，Name是王二的Phone為03-87654321
~~~~SQL
UPDATE customers
SET Phone = '03-87654321'
WHERE Name = '王二';
~~~~

- 修改資料表customers中，discount的值

|C_Id|discount|
|----|-------:|
|1|15.00|
|2|2.80|
|3|-11.30|
|4|5.40|

~~~~SQL
UPDATE customers
SET Phone = 15.00
WHERE C_Id = 1;

UPDATE customers
SET Phone = 2.80
WHERE C_Id = 2;

UPDATE customers
SET Phone = -11.30
WHERE C_Id = 3;

UPDATE customers
SET Phone = 5.40
WHERE C_Id = 4;
~~~~


### Delete Data
刪除資料表中的資料，但不會刪除資料表。

#### Syntax
- DELETE在結尾加上WHERE condition可以控制要刪除對象的條件，若不加WHERE則會清空資料表的全部資料，效果等同於TRUNCATE
~~~~SQL
DELETE *
FROM table_1
WHERE condition_1;
~~~~

- TRUNCATE會清空資料表的全部資料
~~~~SQL
TRUNCATE TABLE table_1;
~~~~

#### Example
- 刪除資料表customers中C_Id為3的資料
~~~~SQL
DELETE *
FROM customers
WHERE C_Id = 3;
~~~~

- 清空資料表customers的全部資料
~~~~SQL
TRUNCATE TABLE customers;
~~~~


### 主鍵Primary Key
主鍵用來保證欄位在資料表中的唯一性，主鍵欄位中的每一筆資料在資料表中都必須是獨一無二的，而且一個資料表只能有一個主鍵。

#### Syntax
- 建立資料表時，在指定資料型態後，再加上**NOT NULL PRIMARY KEY**
~~~~SQL
CREATE TABLE table_1 (
    column_1 data_type_1 NOT NULL PRIMARY KEY,
    column_2 data_type_2,
    column_3 data_type_3
);
~~~~

#### Example
- 製作一個資料表名為**customers**，欄位按以下順序：**C_Id**為**INT**並且為**主鍵**，**Name**為**VARCHAR(50)**，**City**為**VARCHAR(50)**，**Address**為**VARCHAR(255)**，**Phone**為**VARCHAR(20)**。
~~~~SQL
CREATE TABLE customers (
    C_Id INT NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    Address VARCHAR(255),
    Phone VARCHAR(20)
);
~~~~

- 修改資料表customers的資料型態為主鍵
~~~~SQL
ALTER TABLE customers ALTER COLUMN C_Id INT NOT NULL;
ALTER TABLE customers ADD PRIMARY KEY (C_Id);
~~~~

- (Optional) 主鍵包含多個欄位稱為組合鍵Composite Primary Keys
~~~~SQL
ALTER TABLE customers ALTER COLUMN C_Id INT NOT NULL;
ALTER TABLE customers ALTER COLUMN Name VARCHAR(50) NOT NULL;
ALTER TABLE customers ADD CONSTRAINT u_Customer_Id PRIMARY KEY (C_Id, Name);
ALTER TABLE customers DROP CONSTRAINT u_Customer_Id;
~~~~

- 透過系統的資訊尋找主鍵
~~~~SQL
SELECT *  
FROM sys.key_constraints  
WHERE type = 'PK';
~~~~


### Join
JOIN是利用不同表之間欄位的關聯性，組合成的多資料表查詢。





### 日期操作
GETDATE()
DATEPART()
DATEADD()
DATEDIFF()
CONVERT()
https://learn.microsoft.com/zh-tw/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver16#j-use-convert-with-datetime-data-in-different-formats

