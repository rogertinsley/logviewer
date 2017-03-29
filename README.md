# README

### Useful links

 * https://hackhands.com/ruby-rails-tutorial-creating-rails-instance-existing-mysql-db/

### Build the container

`docker-compose build`

### Development

`DB_NAME=logger DB_HOST=rt-dev.database.windows.net DB_USERNAME=user DB_PASSWORD=pass DB_AZURE=true docker-compose up`

### Production

`DB_NAME=logger DB_HOST=rt-dev.database.windows.net DB_USERNAME=user DB_PASSWORD=pass DB_AZURE=true  docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d`
