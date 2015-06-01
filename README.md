# Ita

The project was built on Michael Hartl's sample_app_rails_4 from github, using these commands:

    $ cd /tmp
    $ git clone https://github.com/railstutorial/sample_app_rails_4.git
    $ cd sample_app_rails_4
    $ cp config/database.yml.example config/database.yml
    $ bundle install
    $ bundle exec rake db:migrate

# Locations

    $ rails generate scaffold Locations location_name:string location_code:string latitude:decimal longitude:decimal location_notes:text 
    $ bundle exec rake db:migrate


# Trips

    $ rails generate scaffold Trips trip_name:string start_date:datetime end_date:datetime trip_notes:text 
    $ bundle exec rake db:migrate

    $ rails generate migration trips_users 
    $ bundle exec rake db:migrate

    $ rails generate migration add_stuff_to_user surname:string institution:string
    $ bundle exec rake db:migrate


# Maps

    $ rails generate migration add_trip_to_map trip_id:references
    $ bundle exec rake db:migrate

    $ rails generate migration add_locationid_to_map location_id:references
    $ bundle exec rake db:migrate

    $ rails generate scaffold Maps map_name:string map_description:text map_date:date user_id:references 
    $ bundle exec rake db:migrate

    $ rails generate migration add_map_code_to_map map_code:string
    $ bundle exec rake db:migrate

    $ rails generate migration add_location_to_map latitude:decimal longitude:decimal
    $ bundle exec rake db:migrate

    $ rails generate migration add_pixel_to_map pixel_size:decimal
    $ bundle exec rake db:migrate

# Outlines

    $ rails generate scaffold Outlines map:references substrate_type:string substrate_state:string outline_filename:string outliner_name:string outline_flag:string outline_area:decimal outline_perimeter:decimal outline_notes:text
    $ bundle exec rake db:migrate

    $ rails generate migration add_user_to_outline user:references
    $ bundle exec rake db:migrate


# Setup

    $ git clone git@github.com:jmadin/ita.git
    $ git pull master origin
    $ bundle update
    $ bundle exec rake db:migrate RAILS_ENV="production"
    $ rake tmp:clear
    $ bundle exec rake assets:precompile RAILS_ENV=production RAILS_GROUPS=assets
    $ rails s -e production -p 3009





r20140423_box1, 0.000900067
r20140424_horseshoe_circle01, 0.000881512
r20140424_northreef_circle01, 0.00187084
r20140424_northreef_circle02, 0.00187084
r20140424_northreef_circle03, 0.00155664
r20140424_south_island_circle01, 0.000828708
r20140424_vickis_circle01, 0.00152703
r20140425_cookes_path_circle01, 0.000843716
r20140425_easter_point_circle01, 0.00153095
r20140425_lizard_head_circle01, 0.00152206
r20140425_resort_circle01, 0.00155275
r20140425_southeast_circle01, 0.00154692
r20140425_southeast_circle02, 0.00155795
r20140425_turtle_beach_circle01, 0.00190817
r20140426_lagoon_circle01, 0.00197651
r20140426_lagoon_circle02, 0.00159642
r20140427_gnarly_tree_circle01, 0.00148464
r20140427_nomansland, 0.000858577
r20140427_north_of_paradise_circle01, 0.000983925
r20140427_washing_machine, 0.00154463
r20140428_osprey, 0.00152434
r20140429_cornerbeach_circle01, 0.00101352
r20140430_horseshoe_circle02a, 0.00195357
r20140430_horseshoe_circle02b, 0.000834102

# Production

    $ bundle exec rake db:migrate RAILS_ENV="production"
    $ rake tmp:clear
    $ bundle exec rake assets:precompile RAILS_ENV=production RAILS_GROUPS=assets
    $ rails s -e production -p 3003

delete from outlines;
delete from sqlite_sequence where name='outlines';

