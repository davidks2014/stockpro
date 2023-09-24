puts "Cleaning database..."
Location.destroy_all

puts "Creating Locations..."
warehouse = {name: "Warehouse", address: "5 Joon Koon Way"}
projectA = {name: "Project A", address: "161 Hougang St 11"}
projectB = {name: "Project B", address: "9 Elias Road"}
projectC = {name: "Project C", address: "686 Hougang Ave 4"}

locations = [warehouse, projectA, projectB, projectC]

locations.each do |attributes|
  location = Location.create!(attributes)
  puts "Created #{location.name}"
  rose = Material.create({category: "flower", name: "rose", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(0), uom: "no.", location: location})

  brocoli = Material.create({category: "vegetable", name: "brocoli", cost_code: "MVB", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(0), uom: "kg", location: location})

  orange = Material.create({category: "fruit", name: "orange", cost_code: "MFO", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(0), uom: "kg", location: location})

  oak = Material.create({category: "tree", name: "oak", cost_code: "MTO", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(0), uom: "no.", location: location})

  puts " #{location.name} Creating equipment..."

  location.materials.each  do |material|
    puts "#{material.name} created"
  end

  vacuum = Equipment.create({category: "electronics", name: "vacuum", qty: rand(0..10), location: location})

  shelf = Equipment.create({category: "furniture", name: "shelf", qty: rand(0..10), location: location})

  goggles = Equipment.create({category: "sports", name: "goggles", qty: rand(0..10), location: location})
  
  piano = Equipment.create({category: "instrument", name: "piano", qty: rand(0..10), location: location})


  location.equipment.each  do |equipment|
    puts "#{equipment.name} created"
  end
end

  puts "Creating sites for geomap..."
  warehse = {name: "Warehouse", address: "15 Science Centre Rd, Singapore 609081"}
  projA = {name: "Project A", address: "10 Bayfront Ave, Singapore 018956"}
  projB = {name: "Project B", address: "33 Sengkang West Ave, Singapore 797653"}
  projC = {name: "Project C", address: "4 Tampines Central 5, Singapore 529510"}
  company = {name: "Company", address: "9 Bishan Pl, Singapore 579837"}


  sites = [warehse, projA, projB, projC, company]

  sites.each do |attributes|
    site = Site.create!(attributes)
    puts "Created #{site.name}"
    puts " #{site.name} Creating materials..."
  end

  puts " #{warehouse[:name]} Creating user..."
    teckguan = User.create({name: "Teckguan", role: "engineer", email: "teckguan@gmail.com", password: "123456", location: Location.find_by(warehouse)})
  puts "#{teckguan.name} created"

  puts " #{projectA[:name]} Creating user..."
    david = User.create({name: "David", role: "engineer", email: "david@gmail.com", password: "123456", location: Location.find_by(projectA)})
  puts "#{david.name} created"

  puts " #{projectB[:name]} Creating user..."
    pingyu = User.create({name: "Pingyu", role: "engineer", email: "pingyu@gmail.com", password: "123456", location: Location.find_by(projectB)})
  puts "#{pingyu.name} created"

  puts " #{projectC[:name]} Creating user..."
    yaya = User.create({name: "Yaya", role: "engineer", email: "yaya@gmail.com", password: "123456", location: Location.find_by(projectC)})
  puts "#{pingyu.name} created"

puts " Creating user manager..."
company = Location.create({name: "company", address: "Singapore"})
manager = User.create({name: "Manager", role: "manager", email: "manager@gmail.com", password: "123456"})
puts "#{manager.name} created"

puts "Finished!"
