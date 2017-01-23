require './contact'

class CRM

  def initialize(name)
  @name =name
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
    puts "Please Enter a Number:"
  end

#show menu ooptions
  def call_option(user_selected)
    case user_selected
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

def attribute_list
  puts 'Please Select an Attribute'
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] Email'
    puts '[4] Note'

  end

#When option 2 is selected modify an existing contact
  def modify_existing_contact
  display_all_contacts
  puts "What ID would you like to modify?"
  id = gets.to_i
  modify_existing_contact = Contact.find(id)

  attribute_list

  case user_selected
  when 1 then puts "Edit First Name"
    edit = modify_existing_contact.update(:first_name, value =gets.chomp)
    puts
    modify_existing_contact.display_contact
    puts


  when 2 then puts "Edit Last Name"
    edit = modify_existing_contact.update(:last_name, value =gets.chomp)
    puts
    modify_existing_contact.display_contact
    puts


  when 3 then puts "Edit Email"
    edit = modify_existing_contact.update(:email, value =gets.chomp)
    puts
    modify_existing_contact.display_contact
    puts


  when 4 then puts "Edit Note"
    edit = modify_existing_contact.update(:note, value =gets.chomp)
    puts
    modify_existing_contact.display_contact
    puts

else
  puts "Please select an attribute from 1 to 4"
  attribute_list
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
    all_contact .each do |list|
    puts "first_name: #{list.first_name}"
    puts "last_name: #{list.last_name}"
    puts "email: #{list.email}"
    puts "id: #{list.id}"
    puts
  end
  end

  def search_by_attribute
    attribute_list
    puts "Select a Number to Search By Attribute"
    while user_selected =gets.to_i

  case user_selected
  when 1 then puts "Enter First Name"
      search_result = Contact.find_by(:first_name, value = gets.chomp.to_s)
      puts
      search_result.display_contact
      puts
      break

   when 2 then puts "Enter Last Name"
     search_result = Contact.find_by(:last_name, value = gets.chomp.to_s)
     puts
     search_result.display_contact
     puts
     break

   when 3 then puts "Enter Email"
      search_result = Contact.find_by(:email, value = gets.chomp.to_s)
      puts
      search_result.display_contact
      puts
      break

    when 4 then puts "Enter Note"
      search_result = Contact.find_by(:note, value = gets.chomp.to_s)
      puts
      search_result.display_contact
      puts
      break

    else
      puts "x------xx-----------xx-------x"
      puts "Enter a Number from 1 - 4"
      end
    end
  end


program_app = CRM.new
