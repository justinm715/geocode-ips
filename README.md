# Mass Geocode IPs

by Justin Martinez

This script runs through the `users` table and invokes [Geocoder](https://github.com/alexreisner/geocoder) to grab location data using an IP address.

```
# run the main process
ruby lib/geolocate_user_ips.rb
```

## Setup

In a gemset: `bundle install`.

See the `config/config.rb` file for database settings. It is assumed there is a local Postgres database called `geo-user-ips`. `db/migrations` has examples of migrations to create Postgres tables and import data dumps.

## Export

See `lib/export.rb` for examples of how to dump database data. It might be cooler if epxort.rb generate KML files for easy usage with Google Maps and Google Earth.

## Todo

* Put configuration settings in a YML file.
* KML export marker configuration.
* Export to KML. Google Maps/Earth import supports only 2000 items per layer. It would be good if data are exported in batches no larger than 2000.