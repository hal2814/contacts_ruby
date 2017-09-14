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
  erb(:list)
end

post('/contact/:id') do
  @contact = Contact.find(params[:id])
  Contact.delete(@contact.id)
  erb(:contact)
end

get('/update/:id') do
  @contact = Contact.find(params[:id])
  erb(:update)
end

post('/update/:id') do
  name = params['name']
  last = params['last']
  phone = params['phone']
  street = params['street']
  city = params['city']
  state = params['state']
  zip = params['zip']
  # contact = Contact.new(name,last,phone,street,city,state,zip)
  @contact = Contact.find(params[:id])

  @contact.update(name,last,phone,street,city,state,zip)
  # @contact.update("ben","guy","1234568970","barf street","city","WA","89345")
  erb(:update)
end

get('/contact/:id') do
  @contact = Contact.find(params[:id])
  erb(:contact)
end
