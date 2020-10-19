require 'pg'

def truncate_test_db
  PG.connect(dbname: 'makersbnb_test').exec('TRUNCATE TABLE users;')
end
