# Chats API
Simple Chat API uses Redis, Elastic Search, Queue Management, and built in Ruby on Rails.

## Installation steps
Assuming you already have docker compose installed, clone the repo and run the following commands to start your app:
```
cd development/
docker-compose run web bundle install
docker-compose run web rails db:setup
docker-compose run web rails db:migrate
docker-compose run sidekiq rails runner "UpdateElasticSearchJob.perform_now"
docker-compose build
docker-compose up
```
## Endpoints
You would find a postman collection for the endpoints this app is efforing [Chats API.postman_collection.json](Chats%20API.postman_collection.json)