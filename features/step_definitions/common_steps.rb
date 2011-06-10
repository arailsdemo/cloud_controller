Given /^an? (.+) exists$/ do |model|
  factory_name = model.gsub(" ", "_")
  instance_variable_set "@#{factory_name}", Factory(factory_name)
end
