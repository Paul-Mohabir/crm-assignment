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

#show menu ooptions
  def call_option(user_selected)
  when 1 then add_new_contact
  when 2 then modify_existing_contact
  when 3 then delete_contact
  when 4 then display_all_contacts
  when 5 then search_by_attribute
  when 6 then Exit
  end
end

#if option 1 seclected add a new contact
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

#When option 2 is selected modify an existing contact
  def modify_existing_contact
  display_all_contacts
  puts "What ID would you like to modify?"
  id = gets.to_i
  modify_existing_contact = Contact.find(id)

  attibutes

  case user_selected
  when 1 then puts "Edit First Name"
    edit = modify_existing_contact.update(:first_name, value =gets.chomp)
    puts
    modify_existing_contact.display_contact
    puts
    break

  when 2 then puts "Edit Last Name"
    edit = modify_existing_contact.update(:last_name, value =gets.chomp)
    puts
    modify_existing_contact.display_contact
    puts
    break

  when 3 then puts "Edit Email"
    edit = modify_existing_contact.update(:email, value =gets.chomp)
    puts
    modify_existing_contact.display_contact
    puts
    break

  when 1 then puts "Edit Note"
    edit = modify_existing_contact.update(:note, value =gets.chomp)
    puts
    modify_existing_contact.display_contact
    puts
    break
else
  puts "Please select an attribute from 1 to 4"
  attributes
    end
  end
end

  def delete_contact
display_all_contacts
puts "Please Select Contact ID"
id = gets.chomp.to_i
delete_value = Contact.find(id)
delete_value.delete
  end

  def display_all_contacts
    all_contact = Contact.all
  end

  def search_by_attribute

  end


end
