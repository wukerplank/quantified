## Quantified

Quantified is a small REST-API I use to collect data about my daily habits. My current plans are to grow this in to a major backend that enables me to collect a broad variety of data. I want to be able to collect the data manually via web/apps/etc. (consumed coffee, workouts, events, measurements, etc.) and automatically via Arduino.

Accordingly I plan to develop several auxiliary applications that allow me to collect data conveniently and to learn new technologies.

This project is at a very early stage and might change considerably! This README is also used as a dump for my thoughts, to-dos, etc. concerning this project.

### Installation

Set a DEVISE_SECRET_KEY env variable. This project uses [figaro](https://github.com/laserlemon/figaro). See the `config/application.yml.example` file.

Right now this is a very basic Ruby on Rails app that should be easy enough to deploy.

### Endpoints

#### Authentication

#### Scope

Scopes are like categories and can be used to group events & measurements. Right now I use Scopes like "Body" (measurements, workouts, etc.), "Household" (finances, temperatures, gas price, etc.) and "Nutrition" (cups of coffee, )

##### Attributes

| Name | Type | Description |
|------|------|-------------|
| name | string | The name of the scope. |

##### Methods

 - **`GET`** `/scopes.json`

   Returns a list of Scopes.

 - **`POST`** `/scopes.json`

   Creates a new Scope.

 - **`PATCH/PUT`** `/scopes/:id.json`

   Updates an existing Scope.

#### EventType

This is only a stub so far, it will evolve into something more concrete and validateable.

| Name | Type | Description |
|------|------|-------------|
| name | string | The name of the scope. |
| scope_id | integer | ID of the scope this event might take place in. |

##### Methods

- **`GET`** `/event_types.json`
- **`POST`** `/event_types.json`
- **`PATCH/PUT`** `/event_types/:id.json`

#### Event

This is only a stub so far, it will evolve into something more concrete and validateable.

This defines a discrete event at a specific point in time.

| Name | Type | Description |
|------|------|-------------|
| data | text (serialized Array) | Information about the event (amount, unit of measure, etc.) |

##### Methods

- **`GET`** `/event_types/:event_type_id/events.json`
- **`POST`** `/event_types/:event_type_id/events.json`
- **`PATCH/PUT`** `/event_types/:event_type_id/events/:id.json`

#### StateType

This does not exist right now.

Analogous to EventTypes this defines types of States and their attributes. This includes amount and unit of measure.

#### State

This does not exist right now.

Analogous to Events this represents one concrete state of something in time (CO<sub>2</sub> in the bed room, temperatures, etc.).

### cURL Examples

#### Create a new scope

    curl -u test@test.com:test1234 -H "Content-Type: application/json" -d '{"scope": {"name": "Scope name"}}' http://localhost:3000/scopes.json

#### Update an existing scope

    curl -u test@test.com:test1234 -H "Content-Type: application/json" -X PUT -d '{"scope": {"name": "New scope name"}}' http://localhost:3000/scopes/1.json

### To-Do & Food for Thought

 - [ ] Authorization
 - [ ] Deploy to Heroku
 - [ ] States
 - [ ] Flesh out EventTypes, so they can be used to validate submitted Events
 - [ ] EventTypes might not be bound to a scope an probably could be reused?
 - [ ] Events, States: Use `created_at` as the point in time or introduce another field?
 - [ ] Maybe it's not necessary to have events as a sub-route of
 - [ ] Destroy methods
 - [ ] What about things that can't be measured continuously, like mood, pain, etc.
 - [ ] What kind of units do we allow? Should we automatically store & convert on the fly different units (metric vs imperial)?
 - [ ] Events are defined by EventTypes and might include: photo, amount, measure
 - [ ] Publish Events & State changes via Redis pub/sub
 - [ ] After the vision for the API gets clearer: Tests!

### License & Copyright

Copyright (c) 2015 Christoph Edthofer

This software may be modified and distributed under the terms of the MIT license. See the LICENSE file for details.
