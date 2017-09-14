require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contacts')
require('pry')

get('/') do
  @list = Contact.all()
  erb(:input)
end
