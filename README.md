# README

### Useful links

 * https://hackhands.com/ruby-rails-tutorial-creating-rails-instance-existing-mysql-db/
s

 Run `rake db:schema:dump` to generate `db/schema.rb`

 Convert schema.rb into db/migrate/001_create_database.rb


```
$ export DB_PWD="Pa$$w0rd"
$ export DB_HOST="rt-dev.database.windows.net"
$ export DB_USER="roger@rt-dev"
```
### Build the container

`docker-compose build`

### Development

`docker-compose up`

### Production

`docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d`
