#!/bin/bash
sed -ie 's/TYPEORM_HOST = localhost/'$HOST'/' ormconfig.env
sed -ie 's/TYPEORM_USERNAME = test/'$USERNAME'/' ormconfig.env
sed -ie 's/TYPEORM_PASSWORD = test/'$PASS'/' ormconfig.env
sed -ie 's/TYPEORM_DATABASE = test/'$DATABASE'/' ormconfig.env

yarn typeorm migration:run