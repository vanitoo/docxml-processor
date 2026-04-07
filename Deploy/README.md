# Руководство по развертыванию Document XML Processor

Это руководство описывает процесс развертывания системы обработки XML документов на сервере.

## Общая подготовка

1. Скопируйте всю папку `Deploy/` на сервер в `/srv/`:
   ```bash
   sudo cp -r Deploy/* /srv/
   ```

2. Убедитесь, что Docker и docker-compose установлены на сервере.

3. Создайте необходимые директории для volumes:
   ```bash
   sudo mkdir -p /docker-data/registry /docker-data/certs
   ```

## Развертывание компонентов

### 1. Docker Registry (приватный реестр образов)

Локальный Docker Registry для хранения образов приложений.

**Расположение:** `/srv/registry/`

**SSL сертификаты:**
- Генерация самоподписанного сертификата:
  ```bash
  cd /srv/registry
  openssl req -newkey rsa:4096 -nodes -sha256 -keyout domain.key -x509 -days 365 -out domain.crt -config openssl.cnf
  sudo cp domain.crt /docker-data/certs/
  sudo cp domain.key /docker-data/certs/
  ```

**Запуск:**
```bash
cd /srv/registry
docker-compose up -d
```

Registry будет доступен на порту 5050 с HTTPS.

### 2. RabbitMQ (брокер сообщений)

Сервис очередей для асинхронной обработки сообщений между компонентами.

**Расположение:** `/srv/rabbit/`

**Примечание:** Docker-compose файл для RabbitMQ не найден в папке. Возможно, он находится в другом месте или создается отдельно. Используйте стандартную конфигурацию RabbitMQ.

**Пример docker-compose.yml для RabbitMQ:**
```yaml
version: '3.8'
services:
  rabbitmq:
    image: rabbitmq:3-management
    container_name: docxml-processor-rabbitmq
    environment:
      RABBITMQ_DEFAULT_USER: user
      RABBITMQ_DEFAULT_PASS: password
    volumes:
      - rabbitmq_data:/var/lib/rabbitmq
    ports:
      - "5672:5672"
      - "15672:15672"
    restart: unless-stopped
volumes:
  rabbitmq_data:
```

**Запуск:**
```bash
cd /srv/rabbit
docker-compose up -d
```

Management UI доступен на порту 15672.

### 3. Jenkins (CI/CD сервер)

Сервер для автоматизированной сборки и развертывания приложений.

**Расположение:** `/srv/jenkins/`

**Конфигурация:**
- Dockerfile: Собирает Jenkins с Docker и необходимыми плагинами
- plugins.txt: Список плагинов
- casc_configs/jenkins.yaml: Конфигурация Jenkins as Code (JCasC)
- jenkins_home/: Готовый home-директорий с настройками и job'ами

**Переменные окружения для JCasC:**
```bash
export GH_USER=your_github_username
export GH_PAT=your_github_personal_access_token
# export REG_USER=registry_username (если нужен)
# export REG_PASS=registry_password (если нужен)
```

**Пример docker-compose.yml для Jenkins:**
```yaml
version: '3.8'
services:
  jenkins:
    build: .
    container_name: docxml-processor-jenkins
    ports:
      - "8080:8080"
      - "50000:50000"
    volumes:
      - ./jenkins_home:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - CASC_JENKINS_CONFIG=/var/jenkins_home/casc_configs/jenkins.yaml
      - GH_USER=${GH_USER}
      - GH_PAT=${GH_PAT}
    restart: unless-stopped
```

**Запуск:**
```bash
cd /srv/jenkins
docker-compose up -d
```

Jenkins будет доступен на порту 8080. Начальный пароль admin/admin.

**Job:** Автоматически создан job `build-and-push-net` для сборки проекта из GitHub.

### 4. XSLT Processor (дополнительные скрипты)

Скрипты для обслуживания XSLT Processor сервиса.

**Расположение:** `/srv/xslt_processor/`

**Скрипты:**
- `clean.sh`: Очистка временных файлов
- `copy_shema_in_images.sh`: Копирование схем в запущенный контейнер

**Использование:**
```bash
cd /srv/xslt_processor
# Копирование схем в контейнер
./copy_shema_in_images.sh
```

## Порядок развертывания

1. Registry
2. RabbitMQ
3. Jenkins
4. Основное приложение (используя Jenkins pipeline)

## Мониторинг и поддержка

- **Registry:** `https://localhost:5050` (с сертификатом)
- **RabbitMQ Management:** `http://localhost:15672` (user/password)
- **Jenkins:** `http://localhost:8080` (admin/admin)

## Безопасность

- Измените стандартные пароли в конфигурациях
- Настройте firewall для ограничения доступа к портам
- Используйте HTTPS для production deployment
- Регулярно обновляйте образы и зависимости

## Troubleshooting

- Логи контейнеров: `docker logs <container_name>`
- Перезапуск сервисов: Используйте скрипты `docker_compose_restart.sh` в каждой папке
- Остановка: `docker_compose_down.sh`