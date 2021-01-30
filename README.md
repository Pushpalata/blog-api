# Blog API

RESTful Blog API built in Rails 5.2 using Docker.

### Prerequisities

Two ways to run this application.
With Docker:

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)


Without Docker:
* Rails 5.2
* Ruby 2.5


## Usage

### Run application
Docker: 

docker-compose build web
docker-compose up web

Rails:
bundle install
rails s

### Run Test

Docker:
    docker-compose run -e "RAILS_ENV=test" web bundle exec rspec
Rails:
    bundle exec rspec

## API Routes
| Name   |      API      | 
|----------|:-------------:|
| Get posts |  http :3000/posts |
| Create Post |  http POST :3000/posts title="First post" body="this is test content"   |



