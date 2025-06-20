# dev_symfony_task

Приложение для получения интересных фактов о числах.

## Описание

Это Flutter-приложение позволяет пользователю:
- Ввести любое число и получить интересный факт о нем.
- Получить случайный факт о числе без ввода.
- Сохранять понравившиеся факты для быстрого доступа.

## Основные экраны

- **Экран выбора фактов** — ввод числа, получение факта, запрос случайного факта.
- **Экран сохранённых фактов** — просмотр и управление ранее сохранёнными фактами.

## Установка и запуск

1. **Клонируйте репозиторий:**
   ```sh
   git clone https://github.com/Bayrampro/dev_symfony_task.git
   cd dev_symfony_task
   ```

2. **Установите зависимости:**
   ```sh
   flutter pub get
   ```

3. **Запуск приложения:**
   ```sh
   flutter run
   ```

## Сборка

- **Android:**
  ```sh
  flutter build apk
  ```
- **iOS:**
  ```sh
  flutter build ios
  ```

## Тестирование

Для запуска тестов выполните:
```sh
flutter test
```

## Используемые технологии

- Flutter
- flutter_bloc
- go_router
- get_it
- http
- shared_preferences
- dartz
- equatable
