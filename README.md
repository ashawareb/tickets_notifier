# README

- #### Ruby version: 3.0.2
- #### Rails version: 7.1.4
- #### Database: SQLite 1.4

### To run the project
- *Clone the Repositery*
`git clone https://github.com/ashawareb/tickets_notifier.git`

- Run 
`bundle install`
`redis-server`
`bundle exec sidekiq`
`rails db:migrate`
`rails db:seed`
`rails s`

### API endpoints
###### `[GET] /api/v1/users` to list all users
###### `[POST] /api/v1/users` to create new user
###### `[GET] /api/v1/tickets` to list all tickets
###### `[POST] /api/v1/tickets` to create new tickets


### To run specs:
`bundel exec rspec spec`

### Used Gems:
- Annotate
- Rspec
- Sidekiq
- Active Model Serializer
