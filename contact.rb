require 'pg'


class Contact

  CONN = PG::Connection.new({
     host: 'localhost',
     dbname: 'contacts',
     user: 'kyria',
     password: 'development'
  })

  attr_accessor :firstname, :lastname, :email, :id

  def initialize(firstname, lastname, email)
    @firstname = firstname
    @lastname = lastname
    @email = email
    @id = id
  end

  def self.create(firstname, lastname, email)
    contact = Contact.new(firstname, lastname, email)
    contact.save
  end

  def save
    action = ('INSERT INTO contacts (first_name, last_name, email) VALUES ($1, $2, $3);')
    CONN.exec_params(action, [firstname, lastname, email])
  end

  def self.destroy(id)
    action = ('DELETE FROM contacts WHERE id=$1; ')
    CONN.exec_params(action, [id])
  end

  def self.find(id)
    action = ('SELECT * FROM contacts WHERE id=$1; ')
    results = CONN.exec_params(action, [id])
    results.each do |contact|
      p contact
    end
  end

  def self.find_all_by_lastname(name)
    action = ("SELECT * FROM contacts WHERE last_name ILIKE '%#{name}%'; ")
    results = CONN.exec_params(action)
    results.each do |contact|
      p contact
    end
  end

  def self.find_all_by_firstname(name)
    action = ("SELECT * FROM contacts WHERE first_name ILIKE '%#{name}%'; ")
    results = CONN.exec_params(action)
    results.each do |contact|
      p contact
    end
  end

  def self.find_all_by_email(email)
    action = ("SELECT * FROM contacts WHERE email ILIKE '%#{email}%'; ")
    results = CONN.exec_params(action)
    results.each do |contact|
      p contact
    end
  end

  # def self.update(firstname, lastname, email)
  #   @id
  #   binding.pry
  #   action = ('UPDATE contacts SET first_name=$1, last_name=$2, email=$3 WHERE id = @id; ')
  #   CONN.exec_params(action, [firstname, lastname, email])
  # end

  def self.all
    results = CONN.exec_params("SELECT * FROM contacts;")
    results.map do |contact|
      p contact
    end
  end

end
