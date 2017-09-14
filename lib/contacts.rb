class Contact
  @@list = []
  attr_reader :id
  attr_accessor :name, :phone, :street, :city, :state, :zip
  def initialize(name,phone,street,city,state,zip)
    @name = name
    @phone = phone
    @street = street
    @city = city
    @state = state
    @zip = zip
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def save()
    @@list.push(self)
  end

  def self.clear()
    @@list = []
  end

  def self.find(id)
    @@list[id - 1]
  end
  
end
