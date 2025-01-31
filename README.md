# plugin.SimpleClient

## English
This plugin allows the application to connect to a non-HTTP server.  
The current version of the plugin has only two functions: `init`, `send`.  

`init(host, port, response_listener, error_listener(optional))`  
Adjusts the plugin parameters. Does not connect to the server.  
The function has three required parameters:  
`host` - is the **IP** or **domain** of the server to connect to.  
`port` - is **the number of the port** to connect to.  
`response_listener` - is a **response listener** function that receives responses from the server via a separate stream. The response is stored in `event.msg` as a string.  
And one optional parameter:  
`error_listener` - is the **error listener** function that is called if an error occurs. It contains two parameters: `event.msg` - stores the error description, and `event.code` - stores the numeric error code.  
The function does not return anything.  

`send(data)`  
Sends the data to the server. Before sending, it checks the connection and, if it is not there, tries to connect.  
The function takes one parameter:  
`data` - is **a string of data** to be sent to the server.  
The function returns a numeric error code or 0 if there are no errors.  
Also, if there is an error, the `error_listener` is called.  

*The plugin does not use any application-level protocols, for example, such as HTTP, so you will not be able to simply work with servers using HTTP. The plugin is designed to connect to custom servers written from scratch.*

# A simple example
```lua
local server = require "plugin.SimpleClient"

local function listener( event )
	print( "Response from the server: " .. event.msg )
end

local function errList( event )
	print( "Error: " .. event.msg )
end

server.init("192.168.0.120", 7777, listener, errList)

print(server.send("Hello, World!"))
```

## Русский
Этот плагин позволяет приложению подключиться к не HTTP серверу.  
Текущая версия плагина имеет всего две функции: `init`, `send`.  

`init(host, port, response_listener, error_listener(optional))`  
Настраивает параметры плагина. Не производит подключение к серверу.  
Функция имеет три обязательных параметра:  
`host` - это **IP** или **домен** сервера, к которому надо подключиться.  
`port` - **номер порта**, к которому надо подключиться.  
`response_listener` - функция **слушатель ответов**, в которую через отдельный поток приходят ответы от сервера. Ответ храниться в `event.msg` в виде строки.  
И один необязательный параметр:  
`error_listener` - функция **слушатель ошибок**, которая вызывается в случае возникновения ошибки. В нее приходит два параметра: `event.msg` - хранит описание ошибки, и `event.code` - хранит числовой код ошибки.  
Функция ничего не возвращает.  

`send(data)`  
Отправляет данные на сервер. Перед отправкой проверяет подключение и, если его нет, пытается подключиться.  
Функция принимает один параметр:  
`data` - **строка данных**, которую надо отправить на сервер.  
Функция возвращает числовой код ошибки или 0, если ошибок нет.  
Также, если есть ошибка, вызывается `error_listener`.  

*Плагин не использует никакие протоколы прикладного уровня, например, такие как HTTP, поэтому просто так работать с серверами, использующими HTTP, не получится. Плагин предназначен для подключения к кастомным, написанным с нуля серверам.*
