class Contact
  @@list = []
  attr_reader :id
  attr_accessor :name,:last, :phone, :street, :city, :state, :zip
  def initialize(name,last,phone,street,city,state,zip)
    @name = name
    @last = last
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
    contact_id = id.to_i()
    @@list.each do |contact|
      if contact.id == contact_id
        return contact
      end
    end
  end

end
