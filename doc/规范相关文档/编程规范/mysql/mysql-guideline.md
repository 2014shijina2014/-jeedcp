# MySQL 使用规范

以下规范适用在线交易（OLTP）系统的数据库。数据仓库与分析系统也可以参考。

## 命名规范

- 表名、字段名、索引名使用小写字母、数字，采用下划线分割
- 表名采用`模块名3个缩小字符_`前缀，之后顺序为表名,最后`_分表后缀`
- 表名、字段名不超过 32 个字符
- 存储实体数据的表，名称使用名词，单数
- 索引名称采用 `idx_` 前缀，之后顺序跟随索引的字段名，字段名直接以下划线分割
- 不使用保留字
- 存储实体表间多对多对应关系的表，名称建议采用 `noun_verb_noun` 这样的模式。例如：
  `member_like_property`、`property_has_tag`。

SQL 语句中，

- 保留字使用全大写
- 字符串使用单引号（`'`）

```
sql
-- 正确
SELECT id, title FROM xiaoqu WHERE id = 1
SELECT id, title FROM xiaoqu WHERE areacode = '000100010001'

-- 错误
select ID, title from XiaoQu where id = 1
SELECT id, title FROM xiaoqu WHERE areacode = "000100010001"

```

## 表的设计

### MySQL 存储引擎使用 InnoDB

> 不用纠结，没有特殊原因的情况下，作为 OLTP 的 MySQL 使用 InnoDB 引擎。

### 字符集使用 UTF-8

> Charset 为 `utf8`；Collation 为 `utf8_general_ci`。

### 平衡是门艺术

> 效率优先，提升性能
> 
> 没有绝对的对与错
> 
> 适当牺牲范式，加入冗余
> 
> 会增加代码复杂度

### 正确使用时间类型

> MySQL 应当正确设置 `time_zone`。
>
> - 精确到秒的时间采用 `TIMESTAMP`
> - 精确到日期使用 `DATE`
> - 一般不使用 `DATETIME` 类型
> - 每个表都含有`ins_time`、`edt_time`
> - **不允许使用字符串类型存储时间**

### 字段定义为 NOT NULL

> 真的需要 `NULL` 值吗？如果不确定，就将字段设置为 `NOT NULL`。

### 避免使用NULL字段

> 很难进行查询优化
> NULL列加索引，需要额外空间
> 含NULL复合索引无效

### 字段设置 DEFAULT 值

> 设置为 `NOT NULL` 的字段，需要设置一个缺省值。

### 优先使用ENUM或SET

> 字符串
> 可能值已知且有限
> ENUM占用1字节，转为数值运算
> SET视节点定，最多8字节
> 比较时需要加‘ 单引号（即使是数值）

### 用好数值类型

> 原则：适用就好，越小越好
> 
> TINYINT< SMALLINT < MEDIUMINT < INT < BIGINT
> 
> 1 Byte/2 Bytes/3 Bytes/4 Bytes/8 Bytes
> 
> FLOAT（4B）/DOUBLE（8B）
> 
> DECIMAL（M,D） (M+2 B)

### 不使用浮点类型（FLOAT、DOUBLE）

> 没有充分的理由，不要使用浮点数。

> 例如金额可以用分为单位，然后采用 `INT`。如果依然要以元为单位，可以采用 `DECIMAL`。

### 数值类型VS字符串类型

> 更高效
> 查询更快
> 占用空间更小

### 使用 INT UNSIGNED 来存储 IPv4 地址

> 使用 `INET_ATON` 将 IP 地址的字符串形式转换成数字形式；使用 `INET_NTOA` 将 IP 地址数字形式转换成字符串形式，以便查看。
>
> 当要查询某段的 IP 时，请参考以下示例：

```
sql
 SELECT user_id FROM user_ip
 WHERE ip > INET_ATON('192.168.0.0') AND ip < INET_ATON('192.168.255.255')
 
 ```
>
> 当程序使用自带的函数进行 IP 地址的字符串形式与数字形式之间的转换时，需要注意数字的存储类型至少应为 32 位的无符号整型（如 `uint32_t`)，并注意字节顺。

### 不直接存储图片、音频、视频等大容量内容

> 请使用分布式文件系统来存储图片、音频、视频等内容。数据库里只存储文件的位置。

### 少用并拆分TEXT/BLOB

> TEXT类型处理性能远低于VARCHAR
> 
> - 强制生成硬盘临时表
> - 浪费更多空间
> - VARCHAR(65535)=> 64K
> 尽量不用TEXT/BLOB
> 如需使用则拆分到独立的表存放

### 字段个数不超过 32 个

> 一个表有很多很多字段，是坏设计的味道。请再认真考虑设计是否正确。
> IO高效/表修复快/Alter快/高并发
> 以1G Size 500W Rows来评估
> 
> - 顺序读取需N秒
> - 单行不超过200Byte
> - 单表不超50个INT字段，不超20个CHAR（10）字段
> - 单表字段数上限控制在20-50个

### 控制单表数据量

> 单表年数据量预估
> 
> - 纯INT单表<1000W Rows
> - 含CHAR单表<500W Rows
> - 合理分表不超载

## 索引

### 谨慎合理添加索引

> 改善查询
> 减慢更新
> 索引并非越多越好
> 能不加的索引就不加
> - 综合评估数据密度和数据分布
> - 最好不要超过字段数20%
> 结合核心SQL优先考虑覆盖索引

### 使用数字主键

> 存储实体数据的表，其主键应该是数字类型。

### 不使用联合主键

> 存储实体数据的表，不使用联合主键。
> 存储实体表间多对多对应关系的表（仅有两个字段）允许例外。

### 不使用外键

> 所有的表不建立外键约束。

### 联合索引字段数不超过 5 个

> 一个联合索引的字段数太多，很可能是设计得不好，还很难符合命名的规范。

### 前缀索引长度不超过 8 个字符

> 对字符串类型的字段建立索引，采用前缀索引，且长度不超过 8 个字符。

### 字符类添加前缀索引

> 区分度
> - 单字母区分度：26
> - 4字母区分度：26^4=456,976
> - 5字母区分度：26^5=11,881,376
> - 8字母区分度：26^8=…

```
举例：字符型字段建前缀索引
Picdesc varchar(255) NOT NULL DEFAULT ‘’
Key `idx_1` (`picdesc`(8)),

```

## SQL 语句

### 不使用联表查询

> OLTP 不使用 `JOIN` 联合查询。

### 不使用子查询

> 没有特别好的理由，OLTP 不允许使用子查询。

### 不使用负向查询

> 负向查询是指，如果查询条件描述的是不要什么数据，其余的都要。例如 `!=`、`<>`、`NOT EXISTS`、`NOT IN` 以及 `NOT LIKE` 等就是负向查询，它们利用索引将会很辛苦。

### 一次查询的结果集不超过 100 行

> 必要时使用 `LIMIT 100`

### LIMIT m, n，其中 m 应当小于 500

> 使用 `SELECT ... LIMIT offset, row_count` 或者 `SELECT ... LIMIT row_count OFFSET offset` 时，当 offset 小于 500 时，允许使用。
>

 ```
 sql
-- 允许
 SELECT ... FROM property WHERE broker_id=? ORDER BY update_time LIMIT 40, 20
 -- 不允许
 SELECT ... FROM property WHERE areacode=? ORDER BY update_time LIMIT 4000, 20

 ```
>
> 能够不使用 offset 的情况应当避免，如下面的例子（其中 id 是主键），
>

```
sql
-- 建议
SELECT ... FROM property WHERE broker_id=? AND id>? ORDER BY id LIMIT 20
-- 避免
SELECT ... FROM property WHERE broker_id=? ORDER BY id LIMIT 40, 20

 ```

### 避免使用 COUNT() 函数

> 能不使用就不使用，尽量用其他方法来解决。
>
> 例如判断经纪人是否有房源，可以不使用 `COUNT()` 函数，
>

```
 -- 正确
 SELECT 1 FROM propertys WHERE broker_id=? LIMIT 1

 -- 错误
 SELECT COUNT(*) FROM propertys WHERE broker_id=?

 ```

### 一次 COUNT() 可能扫描的行数应当确保小于 500 行

> `COUNT()` 函数需要扫描所有的结果集之后才能得出结果。而结果集的大小需要业务知识来判断（`EXPLAIN` 方法只能来来检验某一个条件下的当前情况）。因此需要使用 `COUNT()` 查询的代码应当经过审阅。

```
 sql
 
 -- 允许。审阅。经纪人的房源数不允许超过 200 套
 
 SELECT COUNT(*) FROM property WHERE broker_id=?
 
 -- 不允许。一个区域板块下的房源数量不定，可能非常多
 
 SELECT COUNT(*) FROM property WHERE areacode=?

 ```
 
> 其他聚合函数，例如 `SUM()`、`AVG()`、`MAX()` 等，同样适用。

### 统一使用 COUNT(*) 而不是 COUNT(1)

> 当统计行数时，
>
> - 统一使用 `COUNT(*)` 而不是 `COUNT(1)`。
> - 不使用 `COUNT(PK)` 或 `COUNT(column)`，除非真的是想统计 Nullable 字段的行数。

### 不在索引列做运算
> 不在索引列进行数学运算或函数运算
> - 无法使用索引
> - 导致全表扫描

```
举例：
root:xxx_db> select BrokerId from ajk_propertys where proid-100=101960636; 
1 row in set (5.11 sec)

root:xxx_db> select BrokerId from ajk_propertys where proid=101960736;
1 row in set (0.00 sec)

```

### 尽量不在数据库做运算

> 尽量不在数据库做运算
> 复杂的运算移到程序端CPU
> 尽可能简单的来使用Mysql

### 同数据类型的列值比较
> 原则：数字对数字，字符对字符
> 字符列与数值类型比较
> 数值列于字符列比较
> - 同时转换为双精度进行比较
> 字符列于数值列比较
> - 字符列整列转数值，不会使用索引

```
举例：字段UserMobile varchar(15)
root:xxx_db> select BrokerId from ajk_brokerextend where UserMobile = 15863194010 limit 1;           
1 row in set (2.07 sec)
root:xxx_db> select BrokerId from ajk_brokerextend where UserMobile = '18213821864' limit 1;              
1 row in set (0.00 sec)
```

### 禁止在查询条件中对字段进行数学运算、函数调用、隐式类型转换

> 这类查询语句在使用索引时将非常困难。

```
sql

 -- 禁止
 
 SELECT id FROM property WHERE NOW() - update_time < 3600
 
 SELECT id FROM property WHERE update_time + 3600 > NOW()

 -- 改为
 
 SELECT id FROM property WHERE update_time > NOW() - 3600

 sql
 
  -- 禁止
  
 SELECT id FROM property WHERE CHAR_LENGTH(title) > 20

 sql
 
 -- 假设字段 property.status 的类型为 TINYINT
 
 -- 禁止
 
 SELECT id FROM property WHERE status = '1'

 -- 改为
 
 SELECT id FROM property WHERE status = 1
```

### 禁止隐式类型转换

> 不仅在查询条件中禁止隐示类型转换，`INSERT`，`UPDATE` 也不允许隐式类型转换。

```
 sql
 -- 假设字段 property.status 的类型为 TINYINT
 -- 禁止
 INSERT INTO property (..., status) VALUES (..., '1')
 UPDATE property SET status = '1' WHERE id = '43'

 -- 改为
 INSERT INTO property (..., status) VALUES (..., 1)
 UPDATE property SET status = 1 WHERE id = 43
```

### 禁止使用 % 前导查询

> 尽量不使用 `LIKE` 查询，不得不用的情况下也禁止使用 `%` 前导查询。
> - 使用不了索引
> - 导致全表扫描


```
sql
 -- 禁止
 SELECT id FROM property WHERE title LIKE '%最%'
```

### 禁止SQL语句拼接
> 应用程序不能有拼接语句出现

### 禁止使用DELETE语句使用
> 应用程序不能有DELETE语句出现

### 禁止全表更新语句使用
> 应用程序不能执行全表更新语句出现

### 拒绝3B

> BIG SQL (大SQL)
> 
> BIG Transactions （大事务）
> 
> BIG Batch （大批量）

### SQL语句尽可能简单

> 大SQL VS 多个简单SQL
>
> - 传统设计思想，BUT Mysql NOT
> - 一条SQL只能在一个CPU运算
> - 1000+ QPS的高并发中，1秒大SQL可能把数据库都堵死

> 拒绝大SQL，拆解成多条简单SQL
> - 简单SQL缓存命中率更高
> - 减少锁表时间，特别是MYISAM
> - 用上多CPU

### 改写OR为IN/UNION
> 同一字段，将OR改写为IN（）
> - OR效率：O（n）
> - IN效率：O（Log n）
> - 当n很大时，OR会慢很多 
> - 注意控制IN的个数，建议n小于200

> 不同字段，将or改为union
> - 减少对不同字段进行 or 查询
> - Merge index 往往很弱智

### 保持事务（连接）短小
> 保持事务/DB连接短小精悍
> - 事务/连接使用原则：即开即用，用完即关
> - 与事务无关操作放到事务外面，减少锁资源的占用
> - 不破坏一致性前提下，使用多个短事务代替长事务

## 约定规范

### 约定类规范（一）

> 隔离线上线下
> 构建数据库生态环境
> - 开发无线上DB权限
> - 原则：线上连线上，线下连线下

> 统一字符集为UTF8
> 禁用子查询
> - 大部分情况优化较差
> - 特别是Where中使用IN id的子查询
> - 一般可用JOIN改写

### 约定类规范（二）
> 永远不在程序端显示加锁
> - 永远不在程序端对数据库显式加锁
> - 外部锁对数据库不可控
> - 高并发是灾难
> - 极难调试和排查
> 可采用事务操作

```
举例：
Select GET_LOCK(‘str’)
```
### 约定类规范（三）
> 请不要使用存储过程
> 请不要使用trigger