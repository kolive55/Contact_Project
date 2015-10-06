require_relative 'contact_database'
class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  def to_s
    "Name: #{@name}, Email: #{@email}"
  end

  ## Class Methods
  class << self
    def create(name, email)
       Contact.new(name, email)
       ContactDatabase.save_contact([name, email])
       # TODO: Will initialize a contact as well as add it to the list of contacts
    end

    def find(term)

      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end

    def all
      all = ContactDatabase.read
      # TODO: Return the list of contacts, as is
    end

    def show(id)
      # TODO: Show a contact, based on ID
    end

  end

end
