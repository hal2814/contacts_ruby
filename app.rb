require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contacts')
require('pry')

get('/') do
  @list = Contact.all()
  erb(:list)
end

post('/') do
  name = params['name']
  last = params['last']
  phone = params['phone']
  street = params['street']
  city = params['city']
  state = params['state']
  zip = params['zip']
  contact = Contact.new(name,last,phone,street,city,state,zip)
  contact.save()
  @list = Contact.all()
  # binding.pry
  erb(:list)
end

get('/contact/:id') do
  @contact = Contact.find(params[:id])
  erb(:contact)
end
