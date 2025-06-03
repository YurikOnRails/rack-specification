# Time Formatting Rack Application

Простое Rack-приложение для форматирования текущего времени.

## Установка

```bash
bundle install
```

## Запуск

```bash
bundle exec rackup
```

По умолчанию сервер запустится на порту 9292.

## Использование

Приложение отвечает на GET-запросы к endpoint `/time` с параметром `format`.

Доступные форматы времени:
- year
- month
- day
- hour
- minute
- second

### Примеры запросов

```
GET /time?format=year,month,day
# Ответ: 2024-03-21

GET /time?format=hour,minute,second
# Ответ: 14-30-45

GET /time?format=year,invalid
# Ответ: Unknown time format [invalid]
```
