require './contact'

class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected =gets.to_i
      call_option(user_selected)
  end
end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Update an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Show all Contacts'
    puts '[5] Search by Attribute'
    puts '[6] Exit'
  end

  def call_option(user_selected)
  when 1 then add_new_contact
  when 2 then modify_existing_contact
  when 3 then delete_contact
  when 4 then display_all_contacts
  when 5 then search_by_attribute
  when 6 then Exit
  end
end

  def add_new_contact
print "Contact first name:"
first_name = gets.chomp

print "Contact last name:"
last_name = gets.chomp

print "Enter Contact's Email Address"
email =  gets.chomp

print "Enter Note"
note = gets.chomp

Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact

  end

  def delete_contact

  end

  def display_all_contacts

  end

  def search_by_attribute

  end


end
