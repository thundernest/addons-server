#!/bin/bash

# initialize_db:
python manage.py reset_db --noinput
python manage.py syncdb --noinput
python manage.py loaddata initial.json
python manage.py import_prod_versions
schematic --fake src/olympia/migrations/
#python manage.py createsuperuser
#python manage.py loaddata zadmin/users

# update_assets:
make update_assets

#populate_data:
make populate_data
