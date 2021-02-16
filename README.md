# Food Finder

Finding food trucks in the Bay area

An api and front end that finds the food vendors near a given location

### Architecture

- API: Ruby on Rails backend serving JSON
- Web Front End: JavaScript React front end

## Food Finder API

This is an API to list all the food vendors (trucks and carts) near a particular address.

### Endpoints

All endpoints return an json object. Results are stored in the "results" attribute

```
  {
    "results": [
      {
        "id": 19,
        "location_id": null,
        "name": "M M Catering",
        "facility_type": "Truck",
        "location_description": null,
        "address": "98 MISSION ST",
        "permit_status": "REQUESTED",
        "food_description": "Cold Truck: sandwiches: corndogs: tacos: yogurt: snacks: candy: hot and cold drinks",
        "latitude": 37.7933707169278,
        "longitude": -122.394233280448,
        "days_hours": "Mo-Fr:7AM-9AM",
        "created_at": "2021-02-16T02:53:32.840Z",
        "updated_at": "2021-02-16T02:53:32.840Z"
      },
      {
        "id": 32,
        "location_id": null,
        "name": "M M Catering",
        "facility_type": "Truck",
        ...
  }
```

The following endpoints have been implemented.

| Endpoint                    | Purpose                                         |
| --------------------------- | ----------------------------------------------- |
| `/api/v1/food`              | Returns all food vendors with an active license |
| `/api/v1/food/coming_soon`  | Returns all food vendors with a pending license |
| `/api/v1/truck`             | Returns all food trucks with an active license  |
| `/api/v1/truck/coming_soon` | Returns all food trucks with a pending license  |
| `/api/v1/carts`             | Returns all push carts with an active license   |
| `/api/v1/carts/coming_soon` | Returns all push carts with a pending license   |

#### Tech Stack

- Rails 6
- Sqlite3 (will migrate to Postgres)
- Docker

#### Setup

- Make sure docker and docker compose are installed.
- Clone repository.
- Navigate to the main folder

This will build the docker containers for the front and backend

`$ docker-compose build`

Then you need to create the database and seed it with the data (loading the data file into the database)

`$ docker-compose run api rake db:migrate db:seed`

#### Running the server

`$ docker-compose up`

#### Accessing the API's

Once the docker containers are running, you can access them through the web

| Service   | Address                     |
| --------- | --------------------------- |
| API       | http://localhost:3000/{uri} |
| Front End | http://localhost            |

#### Running Tests (specs)

`$ docker-compose run api rake`

### Frontend Todo

- [x] Create basic create-react-app
- [x] Containerize react app & add to docker-compose
- [x] Create Listing of all food trucks in a table
- [ ] Create buttons that toggle table for carts and trucks
- [ ] Create buttons to see food vendors coming soon
- [ ] Add Jest for testing components
- [ ] See listings close to a particular address
- [ ] Add results to a map

### API Todo

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
- [x] Update endpoints to accept `?near="123 Main Street, Somewhere OH"`
- [ ] Add error conditions
- [ ] Move Bing key into a env file
- [ ] Create job to geocode new vendors not containing lat / long
- [ ] Move app to postgres with new docker container
- [ ] Add token authorization
- [ ] Add ability to upload new file through the API
- [ ] Move address to its own model

### Installation
