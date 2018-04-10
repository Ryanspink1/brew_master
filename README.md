# Brew O'clock

### About
Brew O'Clock is an application built to better connect users to the vibrant brewery culture of Colorado. This application uses the [Facebook Graph API](https://developers.facebook.com/docs/graph-api) to collect new events from over 300 Colorado breweries every hour. Users are able to add and remove these events to and from their personal dashboard to keep track of events they are interested in attending.

## Getting Started Locally
Follow these instructions to setup and serve Brew O'Clock locally.

Clone & Setup environment:
```
git clone https://github.com/Ryanspink1/brew_master.git
cd brew_master
bundle exec install
```

Once bundled, the FACEBOOK_TOKEN environment variable will need to be set. Please retrieve your personal Facebook token from the [Facebook Graph API Explorer](https://developers.facebook.com/tools/explorer) (*Facebook account required*).

Set Token:

```
# config/application.yml
FACEBOOK_TOKEN: #your_token
```

With the token configured, the database can now be created and populated via rake tasks.
In your terminal:

```
#terminal
rake db:create
rake db:migrate
```

And to populate with breweries and events:

```
#terminal
rake create_breweries
rake get_new_events
```

Both of the previous rake tasks will output the status of their brewery and event creation in the terminal and notify upon completion.

## Testing

Test suite may be run in the terminal:

```
#terminal
rspec
```

## Built With
- [Rails 5 Back-End](http://rubyonrails.org/)
- [JavaScript populated front-end](https://www.javascript.com/)
- [PostgreSQL database](https://www.postgresql.org/)


## Author
Ryan Spink (2017 - Current)

## License
This project is licensed under the MIT License. 
