# I don't know if ActiveRecord makes the above unnessecary, 
# and I don't know if I wrote these correctly

require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
