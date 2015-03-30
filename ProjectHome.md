Реализация методов [api vkontakte](http://vkontakte.ru/page2369282) на action script 3.0
## Ссылки ##
  * онлайн [документация](http://apivk.googlecode.com/svn/trunk/docs/index.html)
  * примеры использования: [Unixtime.as](http://code.google.com/p/apivk/source/browse/trunk/examples/unixtime/src/Unixtime.as), [Execute.as](http://code.google.com/p/apivk/source/browse/trunk/examples/execute/src/Execute.as), [Queue.as](http://code.google.com/p/apivk/source/browse/trunk/examples/queue/src/Queue.as), [Dynamic.as](http://code.google.com/p/apivk/source/browse/trunk/examples/dynamic/src/Dynamic.as)
  * версии библиотеки: [RELEASE](http://code.google.com/p/apivk/source/browse/trunk/RELEASE)
  * лицензия: [rus](http://apivk.googlecode.com/svn/trunk/LICENSE_RU), [eng](http://apivk.googlecode.com/svn/trunk/LICENSE)
### Вконтакте ###
  * Тестовое приложение: [app1746762](http://vkontakte.ru/app1746762)
  * Официальная группа: [club17166923](http://vkontakte.ru/club17166923)

## Разработка ##
  * [Video.as](TODO.md)
  * Сообщить об [ошибке в документации](HowToReportDefectInDocs.md)
  * Сообщить об [ошибке в исходном коде](HowToReportDefectInSource.md)
  * Сообщить о [нереализованном методе API](http://code.google.com/p/apivk/issues/entry?template=%D0%9D%D0%B5%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D0%BD%D0%B0%D1%8F%20%D0%B2%D0%BE%D0%B7%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20API)
  * Сообщить об [ошибке во время исполнения](http://code.google.com/p/apivk/issues/entry?template=Runtime%20error)

## SWC библиотеки ##
  * _apivk-x.x.x.swc_
    * `com.vk.api.`APIVK ([src](http://code.google.com/p/apivk/source/browse/trunk/src/com/vk/api/APIVK.as), [doc](http://apivk.googlecode.com/svn/trunk/docs/com/vk/api/APIVK.html), [example](http://code.google.com/p/apivk/source/browse/trunk/examples/unixtime/src/Unixtime.as))
    * `com.vk.api.`VKQueue ([src](http://code.google.com/p/apivk/source/browse/trunk/src/com/vk/api/VKQueue.as), [doc](http://apivk.googlecode.com/svn/trunk/docs/com/vk/api/VKQueue.html), [example](http://code.google.com/p/apivk/source/browse/trunk/examples/queue/src/Queue.as))
    * `com.vk.api.lib.``*` ([src](http://code.google.com/p/apivk/source/browse/trunk#trunk/src/com/vk/api/lib), [doc](http://apivk.googlecode.com/svn/trunk/docs/com/vk/api/lib/package-detail.html), [example](http://code.google.com/p/apivk/source/browse/trunk/examples/unixtime/src/Unixtime.as))
    * `com.serialization.json.`JSON ([src](http://code.google.com/p/apivk/source/browse/trunk/deps/src/com/serialization/json/JSON.as), [doc](http://apivk.googlecode.com/svn/trunk/docs/com/serialization/json/JSON.html))
    * `utils.`MD5 ([src](http://code.google.com/p/apivk/source/browse/trunk/deps/src/utils/MD5.as), [doc](http://apivk.googlecode.com/svn/trunk/docs/utils/MD5.html))
  * _apivk-nolib-x.x.x.swc_
    * `com.vk.api.`APIVK ([src](http://code.google.com/p/apivk/source/browse/trunk/src/com/vk/api/APIVK.as), [doc](http://apivk.googlecode.com/svn/trunk/docs/com/vk/api/APIVK.html), [example](http://code.google.com/p/apivk/source/browse/trunk/examples/unixtime/src/Unixtime.as))
    * `com.vk.api.`VKQueue ([src](http://code.google.com/p/apivk/source/browse/trunk/src/com/vk/api/VKQueue.as), [doc](http://apivk.googlecode.com/svn/trunk/docs/com/vk/api/VKQueue.html), [example](http://code.google.com/p/apivk/source/browse/trunk/examples/queue/src/Queue.as))
    * `com.serialization.json.`JSON ([src](http://code.google.com/p/apivk/source/browse/trunk/deps/src/com/serialization/json/JSON.as), [doc](http://apivk.googlecode.com/svn/trunk/docs/com/serialization/json/JSON.html))
    * `utils.`MD5 ([src](http://code.google.com/p/apivk/source/browse/trunk/deps/src/utils/MD5.as), [doc](http://apivk.googlecode.com/svn/trunk/docs/utils/MD5.html))
  * _apivk-loader-x.x.x+.swc_
    * `com.vk.api.`API ([src](http://code.google.com/p/apivk/source/browse/trunk/loader/src/com/vk/api/API.as), [doc](http://apivk.googlecode.com/svn/trunk/docs/com/vk/api/API.html), [example](http://code.google.com/p/apivk/source/browse/trunk/examples/dynamic/src/Dynamic.as))
## Структура trunk директории: ##
  * download [apivk-x.x.x.tar.gz](http://code.google.com/p/apivk/downloads/list)
  * view [online](http://code.google.com/p/apivk/source/browse/trunk)

```

trunk/
|-- AUTHORS
|-- LICENSE
|-- LICENSE_RU
|-- RELEASE
|-- TODO
|-- build.properties.copy_and_edit
|-- build.xml
|-- deps
|   |-- lib
|   |   `-- JSONLite.swc
|   `-- src
|       |-- com
|       |   `-- serialization
|       |       `-- json
|       |           `-- JSON.as
|       `-- utils
|           `-- MD5.as
|-- docs
|-- examples
|   |-- dynamic
|   |   |-- bin
|   |   |   `-- Dynamic.swf
|   |   |-- build.xml
|   |   `-- src
|   |       |-- ChangeLog
|   |       `-- Dynamic.as
|   |-- execute
|   |   |-- bin
|   |   |   `-- Execute.swf
|   |   |-- build.xml
|   |   `-- src
|   |       |-- ChangeLog
|   |       `-- Execute.as
|   |-- queue
|   |   |-- bin
|   |   |   `-- Queue.swf
|   |   |-- build.xml
|   |   `-- src
|   |       |-- ChangeLog
|   |       `-- Queue.as
|   `-- unixtime
|       |-- bin
|       |   `-- Unixtime.swf
|       |-- build.xml
|       `-- src
|           |-- ChangeLog
|           `-- Unixtime.as
|-- lib
|   |-- apivk-nolib.swc
|   |-- apivk.swc
|   `-- apivk.swf
|-- loader
|   |-- build.xml
|   |-- lib
|   |   `-- apivk-loader.swc
|   `-- src
|       `-- com
|           `-- vk
|               `-- api
|                   |-- API.as
|                   `-- ChangeLog
|-- src
|   `-- com
|       `-- vk
|           `-- api
|               |-- APIVK.as
|               |-- ChangeLog
|               |-- VKQueue.as
|               `-- lib
|                   |-- Audio.as
|                   |-- ChangeLog
|                   |-- Geo.as
|                   |-- HighScores.as
|                   |-- Language.as
|                   |-- Messages.as
|                   |-- Misc.as
|                   |-- Offers.as
|                   |-- Pages.as
|                   |-- Photos.as
|                   |-- Ques.as
|                   |-- SMS.as
|                   |-- User.as
|                   |-- UserField.as
|                   |-- UserNameCase.as
|                   |-- UserSett.as
|                   |-- Variables.as
|                   `-- Wall.as
`-- templates
    |-- ChangeLog
    |-- newChangeLog.tmpl
    |-- newClass.tmpl
    |-- newConst.tmpl
    `-- newFunction.tmpl
```
