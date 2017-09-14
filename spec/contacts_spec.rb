require('pry')
require('rspec')
require('contacts')

# describe Triangles do
describe("Contact") do
  before() do
    Contact.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end


  describe("#save") do
    it("saves an contact to the list of items") do
      contact = Contact.new("dan","111.111.1111","123 road","Portland","OR","97206")
      contact.save()
      expect(Contact.all()).to(eq([contact]))
    end
  end

  describe(".clear") do
    it("clears all contact from the list") do
      contact = Contact.new("dan","111.111.1111","123 road","Portland","OR","97206")
      contact.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new contact is added") do
      contact = Contact.new("dan","111.111.1111","123 road","Portland","OR","97206")
      contact.save()
      contact2 = Contact.new("bob","222.222.2222","456 street","Portland","OR","97207")
      contact2.save()
      expect(contact.id()).to(eq(1))
      expect(contact2.id()).to(eq(2))
    end
  end
  describe(".find") do
    it("finds an contact based on its id") do
      contact = Contact.new("dan","111.111.1111","123 road","Portland","OR","97206")
      contact.save()
      contact2 = Contact.new("bob","222.222.2222","456 street","Portland","OR","97207")
      contact2.save()
      expect(Contact.find(1)).to(eq(contact))
      expect(Contact.find(2)).to(eq(contact2))
    end
  end
end
