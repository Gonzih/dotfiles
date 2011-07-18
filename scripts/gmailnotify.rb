begin
  require 'gmail'

  password = `cat ~/.gmail.password`.chomp
  gmail = Gmail.connect 'gonzih@gmail.com', password
  new_count = gmail.inbox.count(:unread).to_i
  puts "#{new_count > 0 ? "#{new_count} new" : 'No new'} email#{new_count > 1 || new_count == 0 ? 's' : nil}"
  gmail.logout
resque LoadError
  puts 'sudo gem install gmail'
rescue Exception
  puts 'Error'
end
