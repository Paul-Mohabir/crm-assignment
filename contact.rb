class Contact

  attr_accessor:first_name, :last_name, :email, :note
  attr_reader:id
  #Need to make a unique ID for each new contact added
  @@contacts = []
  @@next_id = 1000

  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note)
    @id = @@next_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @next_id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create (first_name, last_name, email, note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find (id)
    @@contacts.each do |contact|
      if contact.id == id
        #if local variable contact which is contact equals id int the array it will return the defined local varialble which is called contact.
        return  contact
      end
    end
    puts "Contact not found"
  end


  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
  when "first_name"
    self.first_name = value
  when "last_name"
    self.last_name = value
  when "email"
    self.email = value
  when "note"
    self.note = value
  end
end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(criteria)
    search_result = []
  @@contacts.each do |contact|
  case criteria
    when contact.first_name
      search_result << contact
    when contact.last_name
      search_result << contact
    when contact.email
      search_result << contact
    when contact.note
      search_result << contact
    else
    "That value is not stored"
  end
  puts search_result
  return search_result
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = [nil]
  end

  def full_name
  "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete.self
    @@contacts
  end

  # Feel free to add other methods here, if you need them.

end
