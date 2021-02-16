# Food Finder API

This is an API to list all the food vendors (trucks and carts) near a particular address.

## Tech Stack

- Rails 6
- Sqlite3 (will migrate to Postgres)
- Docker

## Setup

- Make sure docker and docker compose are installed.
- Clone repository.
- Navigate to the main folder

  `$ docker-compose build`

## Running the server

`$ docker-compose up`

## Running Tests (specs)

`$ docker-compose run api rake`

## Todo

- [x] Containerize the app
- [x] Add rspec, factory_bot, faker, for testing
- [x] Create API endpoint `/api/v1/food` returning all current food vendors
- [x] Create scope for current and coming soon
- [x] Create API endpoint `/api/v1/food/coming_soon` returning all pending food vendors
- [x] Create scope for trucks
- [x] Create API endpoint `/api/v1/trucks` returning all current trucks vendors
- [x] Create API endpoint `/api/v1/trucks/coming_soon` returning all pending trucks vendors
- [x] Create scope for carts
- [x] Create API endpoint `/api/v1/carts` returning all current carts vendors
- [x] Create API endpoint `/api/v1/carts/coming_soon` returning all pending carts vendors
- [x] Add geokit gem
- [ ] Create API endpoint `/api/v1/food/near/address`
- [ ] Move Bing key into a env file
- [ ] Create job to geocode new vendors not containing lat / long
- [ ] Move app to postgres with new docker container
- [ ] Add token authorization
- [ ] Add ability to upload new file through the API
- [ ] Move address to its own model
