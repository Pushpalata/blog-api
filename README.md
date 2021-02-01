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

`docker-compose build web`

`docker-compose up web`

Rails:

`bundle install`

`rails s`

### Run Test

Docker:

    `docker-compose run -e "RAILS_ENV=test" web bundle exec rspec`
Rails:

    `bundle exec rspec`

## API Routes
| Resource      | Method | description                       |
|:--------------|:-------|:----------------------------------|
| `/signup`     |`POST` | Create User
| `/login`    |`POST` | User Login
| `/posts` |`GET` | Returns a list of posts |
| `/posts/:id`      |`GET` | Returns a post |
| `/posts`  |`POST` | Create post |
| `/posts/:id` | `PUT` | Update a post |
| `/posts/:id` | `DELETE` | Delete a post |
| `/posts/:id/comments` | `GET` |  Returns comments of a post |
| `/posts/:id/comments/:id` | `GET` |  Returns a post's comment |
| `/posts/:id/comments` | `POST` | Creates a post's comment |
| `/posts/:id/comments/:id` | `PUT` | Updates a post's comment |
| `/posts/:id/comments/:id` | `DELETE` | Deletes a post's comment |
| `/posts/:id/likes` | `GET` |  Returns likes of a post |
| `/posts/:id/likes` | `POST` |  Like a post |
| `/posts/:id/unlike` | `DELETE` |  Unlike a post |
| `/user_posts` | `GET` |  Returns a list of user's posts |
| `/user_comments` | `GET` |  Returns a list of user's comments |

### Demo
https://rails-5-blog-api.herokuapp.com/posts
