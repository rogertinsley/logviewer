# README

### Useful links

 * https://hackhands.com/ruby-rails-tutorial-creating-rails-instance-existing-mysql-db/

### Build the container

`docker-compose build`

### Development

`DB_NAME=logger DB_HOST=rt-dev.database.windows.net DB_USER=user DB_PASS=pass DB_AZURE=true GH_TOKEN=123123123123123 docker-compose up`

### Production

`DB_NAME=Logging DB_HOST=rt-dev.database.windows.net DB_USER=user DB_PASS=pass DB_AZURE=false GH_TOKEN=123123123123123 SECRET_KEY_BASE=6e36f2ef31409ba2199a632ca8437a527407b89bf6d983365fb3e5c0d3b7ad9e47af6565d737a8770faf5e82a7e01a97aac6a653362397d0429d6f590a249515 docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d`
