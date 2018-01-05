require 'json'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/activerecord'
require_relative './lib/app'

set :database, {adapter: "sqlite3", database: "domains.sqlite3"}
set :show_exceptions, false

Application.new
