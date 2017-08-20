list = File.read("#{Rails.root}/public/countries.csv").split("\n")
list.each { |name| Country.find_or_create_by!(name: name) }
