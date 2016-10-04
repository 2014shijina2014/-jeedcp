# api 文档
## api规范
### REST

```
	REST是英文Representational State Transfer的缩写，中文翻译为“表述性状态转移”，他是由Roy Thomas Fielding博士在他的论文 《Architectural Styles and the Design of Network-based Software Architectures》中提出的一个术语。REST本身只是为分布式超媒体系统设计的一种架构风格，而不是标准。基于Web的架构，实际上就是各种规范的集合，这些规范共同组成了Web架构。比如Http协议，比如客户端服务器模式，这些都是规范。每当我们在原有规范的基础上增加新的规范，就会形成新的架构。而REST正是这样一种架构，他结合了一系列的规范，而形成了一种新的基于Web的架构风格。REST通过URL来进行Web Service的 调用，最大限度的减少了开发人员在配置方面的工作量，这也是我们采用REST风格的接口的初衷。
	
```
### 地址格式

```
	http(s)://EndpointURL/path/{version}/{domain}/{rest-convention}
	
	{version}代表api的版本信息
		{domain}是一个你可以用来定义任何技术的区域(例如：安全-允许指定的用户可以访问这个区域。)或者业务上的原因。(例如：同样的功能在同一个前缀之下。)
		{rest-convention} 代表这个域(domain)下，约定的rest接口集合
```
### 请求方式

```
	HTTP 定义了与服务器交互的不同方法，最基本的方法是 GET 和POST。事实上HTTP协议里还定义了其他很多请求方式，如下：	1. GET(SELECT)： 从服务器取出资源（一项或多项）。	2. HEAD： 获取资源的元数据。	3. POST(CREATE)：在服务器新建一个资源	4. PUT(UPDATE)： 在服务器更新资源（客户端提供改变后的完整资源）	5. DELETE(DELETE)： 从服务器删除资源。	6. OPTIONS： 获取信息，关于资源的哪些属性是客户端可以改变的。	7. TRACE： 请求服务器在响应中的实体主体部分返回所得到的内容。	8. PATCH(UPDATE)： 在服务器更新资源（客户端提供改变的属性）
```
### 样例
+ GET /zoos：列出所有车辆信息
+ POST /zoos：新建一个车辆信息
+ GET /zoos/ID：获取某个指定车辆信息的信息
+ PUT /zoos/ID：更新某个指定车辆信息的信息（提供该车辆信息的全部信息）
+ PATCH /zoos/ID：更新某个指定车辆信息的信息（提供该车辆信息的部分信息）
+ DELETE /zoos/ID：删除某个车辆信息
+ GET /zoos/ID/animals：列出某个指定车辆信息的所有司机
+ DELETE /zoos/ID/animals/ID：删除某个指定车辆信息的指定司机

### 过滤信息
+ ?limit=10：指定返回记录的数量
+ ?offset=10：指定返回记录的开始位置。
+ ?page=2&per_page=100：指定第几页，以及每页的记录数。
+ ?sortby=name&order=asc：指定返回结果按照哪个属性排序，以及排序顺序。
+ ?animal_type_id=1：指定筛选条件

### 状态码
+ 200 OK - [GET]：服务器成功返回用户请求的数据，该操作是幂等的（Idempotent）。
+ 201 CREATED - [POST/PUT/PATCH]：用户新建或修改数据成功。
+ 202 Accepted - [*]：表示一个请求已经进入后台排队（异步任务）
+ 204 NO CONTENT - [DELETE]：用户删除数据成功。
+ 400 INVALID REQUEST - [POST/PUT/PATCH]：用户发出的请求有错误，服务器没有进行新建或修+ 改数据的操作，该操作是幂等的。
+ 401 Unauthorized - [*]：表示用户没有权限（令牌、用户名、密码错误）。
+ 403 Forbidden - [*] 表示用户得到授权（与401错误相对），但是访问是被禁止的。
+ 404 NOT FOUND - [*]：用户发出的请求针对的是不存在的记录，服务器没有进行操作，该操作是幂等的。
+ 406 Not Acceptable - [GET]：用户请求的格式不可得（比如用户请求JSON格式，但是只有XML格式）。
+ 410 Gone -[GET]：用户请求的资源被永久删除，且不会再得到的。
+ 422 Unprocesable entity - [POST/PUT/PATCH] 当创建一个对象时，发生一个验证错误。
+ 500 INTERNAL SERVER ERROR - [*]：服务器发生错误，用户将无法判断发出的请求是否成功

### 返回结果
+ GET /zoos：返回资源对象的列表（数组）
+ GET /zoos/ID：返回单个资源对象
+ POST /zoos：返回新生成的资源对象
+ PUT /zoos/ID：返回完整的资源对象
+ PATCH /zoos/ID：返回完整的资源对象
+ DELETE /zoos/ID：返回一个空文档

### 安全机制
+ 只针对外部api
+ 所有输入参数都按照参数名（升序）排序方式拼接参数字符串
+ 通过密钥对机制进行签名(apikey+sharekey+)
+ 密钥对（apikey及sharekey）通过邮件申请
+ 签名算法md5(apikey＋sharekey＋EndpointURL＋sort(params{key1=valuex&key2=valueb,...,keyn=valued}))
### 接口规则
+ 接口数据类型定义要求：接口数据类型请勿用java的原始数据类型：如short->Short;float->Float;int->Integer;long->Long;double->Double;boolean->Boolean

### 返回结果规则

	
```
正确
{	"status" : 200,	"message" : "ok",	"data" : {		"totla":20000,
		"xxx":"fdfdafd"	}}

错误
{
	"status":403,
	"message":"invalid appid"
}
```

### Demo

#### 	车辆详情api

##### 接口调用请求说明
+ 请求方式
	+ GET
+ 请求协议
	+ HTTP
+ 请求地址
	+ /zoos/ID
##### 输入参数说明

| 参数        	| 是否必输       | 说明           | 
| ------------- |:-------------:|:-------------:|
| ID      		| 是            | 	车牌号id |


##### 输出参数说明

| 参数       	 | 是否为空       | 说明           | 
| ---------------|:-------------:|:-------------:|
| id      		 | 否         	 | 	车牌号id 	  |
| name   		 | 否      		 |   	车牌号 	  |
| address		 | 否      		 |    地址     |
| phone   		 | 否      		 |    联系电话     |

### 样例

```
 请求代码:
 
 	http://api.dcyun.com/getvec/1234
 	
 响应结果:
 
{
	"status" : 0,	"message" : "ok",	"data" : {		"id":20000,
		"name":"79050",
		"address":"上海。。。。。",
		"phone":"021-8838399432"	}
}
 
```
### api列表
