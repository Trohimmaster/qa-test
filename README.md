# qa-test
⚙️ Как это работает

    Сборка под разные платформы
    Команды make linux, make arm, make mac, make windows используют переменные GOOS и GOARCH для кросс-компиляции.
    Входная точка — cmd/app/main.go, при этом код из internal/mathutil автоматически подтягивается при импорте.

    Сборка Docker-образа
    Команда make image собирает образ на платформу хоста с использованием стандартного docker build.
    Поддерживаются только нативные сборки без buildx.

    Запуск тестов
    Команда make test запускает юнит-тесты, например, из internal/mathutil/add_test.go.

    Очистка проекта
    Команда make clean удаляет:

        бинарники, собранные под разные платформы

        Docker-образ с тегом, указанным в IMAGE_TAG

🚀 Команды сборки
Команда	Назначение
make linux	Сборка бинарника для Linux (amd64)
make arm	Сборка бинарника для Linux (arm64)
make mac	Сборка бинарника для macOS (amd64)
make windows	Сборка бинарника для Windows (amd64)
make image	Сборка Docker-образа для платформы хоста
make test	Запуск тестов
make clean	Очистка бинарников и Docker-образа
🐳 Сборка и запуск контейнера

# Сборка Docker-образа
make image

# Запуск контейнера
docker run --rm ghcr.io/username/demo:latest

📄 Пример использования

make linux        # Собрать бинарник для Linux
make test         # Запустить тесты
make image        # Собрать Docker-образ
make clean        # Удалить бинарники и образ
