# README
## Welcome to Sweater Weather
![sweather weather ](https://user-images.githubusercontent.com/96926479/173902122-be966133-6beb-4fd9-94b3-21a2e84733ec.png)

This app is designed from a back-end developer perspective working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

The app is working with a service-oriented architecture. The front-end will communicate with the back-end through an API.

## Versions
* Ruby Version - 2.7.4
* Rails - 5.2.7

## Setup
* Clone this repo
* `bundle install`
* `bundle exec figaro install`
* `rails db:{create,migrate,seed}`
* Get MapQuest API key [here](https://developer.mapquest.com/documentation/geocoding-api/)
* Get OpenWeather API key [here](https://openweathermap.org/api/one-call-api)
* Get Unsplash API key [here](https://unsplash.com/documentation#search-photos)
* place the keys in your `config/application.yml` file
* run `bundle exec rspec` to run our RSpec testing suite
* execute the Postman collection below to test the endpoints

## Available Endpoints - Postman Collection
* [Click this link](https://www.getpostman.com/collections/2f214de2f1260f7e9196)
* Copy the entire text
* Open Postman, select "Import" from top left of page, then "Raw text" from the top line
* Paste the entire text
* Click "Continue", then "Import"
* Check out the endpoint examples - we have calls to the external APIs consumed by our app, as well as demonstrations of the responses returned from our own API endpoints!

## Contact
* Scott Sullivan [GitHub](https://github.com/ScottSullivanltd), [LinkedIn](https://www.linkedin.com/in/scott-sullivan-9394204a/)

## Acknowledgements
* Turing School of Software and Design
* Unsplash API
* Mapquest API
* OpenWeather API
* OpenLibrary API
* OpenBrewery API
