# MakersBnB

## Specification
A space hire application where hosts who have spaces available to book for a night can list them and receive booking requests from prospective guests. Hosts and guests must both register with the application.

Listings offer useful information about the space and its availability.

Guests make requests to book a space for a single night at a time, and Hosts will have the option to accept or reject the booking request.

User stories are available via the [repository Project tab](https://github.com/elsstrange/MakersBnB/projects/1).

## Progress
See [Project tab](https://github.com/elsstrange/MakersBnB/projects/1).

## Set Up

**General**
```sh
$ git clone && cd ./makersbnb
$ bundle install
$ bundle exec rake db:create
```

**Development**
```sh
$ bundle exec rake db:migrate RACK_ENV=development
$ bundle exec rackup
```

**Test**
```sh
$ bundle exec rake db:migrate RACK_ENV=test
$ bundle exec rspec
```

## Deployed App

https://shielded-beach-97587.herokuapp.com/

## Design Notes

### CRCs

**User** 
| Responsibilities | Collaborators |
| --- | --- |
| username<br>password<br>email<br>phone |  |

**Space** 
| Responsibilities | Collaborators |
| --- | --- |
| name<br>price<br>description | User (as host) |

**Inventory** 
| Responsibilities | Collaborators |
| --- | --- |
| date<br>availability | Space |

**Booking** 
| Responsibilities | Collaborators |
| --- | --- |
| date<br>status | User (as guest)<br>Space |


### Schema

**users** 
| id | username | email | phone | password |
| --- | --- | --- | --- | --- |
| SERIAL | VARCHAR(20) | VARCHAR(100) | VARCHAR (13) | VARCHAR |
| PK | UNIQUE NOT NULL | UNIQUE NOT NULL | | NOT NULL |

**spaces** 
| id | name | description | price | host_id |
| --- | --- | --- | --- | --- |
| SERIAL | VARCHAR(60) | VARCHAR(500) | INT NOT NULL | INT |
| PK | NOT NULL | | NOT NULL | FK (users id) NOT NULL |

**inventories** 
| id | date | available | space_id |
| --- | --- | --- | --- |
| SERIAL | DATE | BOOLEAN | INT |
| PK | NOT NULL | NOT NULL | FK (spaces id) NOT NULL |

**bookings** 
| id | date | status | space_id | guest_id |
| --- | --- | --- | --- | --- |
| SERIAL | DATE | VARCHAR(60) | INT | INT |
| PK | NOT NULL | NOT NULL | FK (spaces id) NOT NULL | FK (users id) NOT NULL |