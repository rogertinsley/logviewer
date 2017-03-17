crumb :root do
  link "Home", root_path
end

# Messages list
crumb :messages do |message|
  link source_application, messages_path
end

# Single MessageID
crumb :message do |message|
  link message_type, messages_path
  parent :messages
end
