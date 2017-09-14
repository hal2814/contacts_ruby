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

  def update
   @@list.each do |item|
     if item.name == self.name
       item.rank = self.rank
     end
   end
 end

 def self.delete(del_id)
    @@list.map do |contact|
      if contact.id == del_id
      @@list.delete(contact)
      end
    end
  end
end
