puts "Cleaning database..."
Location.destroy_all

puts "Creating Locations..."
warehouse = {name: "Warehouse", address: "15 Science Centre Rd, Singapore 609081"}
projectA = {name: "Marina Bay Sands", address: "10 Bayfront Ave, Singapore 018956"}
projectB = {name: "Singapore Zoo", address: "80 Mandai Lake Rd, 729826"}
projectC = {name: "Changi Airport", address: "70 Airport Blvd., Singapore 819661"}

locations = [warehouse, projectA, projectB, projectC]

locations.each do |attributes|
  location = Location.create!(attributes)
  puts "Created #{location.name}"
  rose = Material.create({category: "flower", name: "rose", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  hibiscus = Material.create({category: "flower", name: "hibiscus", cost_code: "MFH", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  lily = Material.create({category: "flower", name: "lily", cost_code: "MFL", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  brocoli = Material.create({category: "vegetable", name: "brocoli", cost_code: "MVB", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "kg", location: location})
  spinach = Material.create({category: "vegetable", name: "spinach", cost_code: "MVS", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "kg", location: location})
  cabbage = Material.create({category: "vegetable", name: "cabbage", cost_code: "MVC", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "kg", location: location})
  orange = Material.create({category: "fruit", name: "orange", cost_code: "MFO", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "kg", location: location})
  apple = Material.create({category: "fruit", name: "apple", cost_code: "MFA", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "kg", location: location})
  mango = Material.create({category: "fruit", name: "mango", cost_code: "MFM", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "kg", location: location})
  oak = Material.create({category: "tree", name: "oak", cost_code: "MTO", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  maple = Material.create({category: "tree", name: "maple", cost_code: "MTM", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  banyan = Material.create({category: "tree", name: "banyan", cost_code: "MTB", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  puts " #{location.name} Creating equipment..."

  location.materials.each  do |material|
    puts "#{material.name} created"
  end

  vacuum = Equipment.create({category: "electronics", name: "vacuum", qty: rand(0..10), location: location})
  table = Equipment.create({category: "furniture", name: "table", qty: rand(0..10), location: location})
  chair = Equipment.create({category: "furniture", name: "chair", qty: rand(0..10), location: location})
  shelf = Equipment.create({category: "furniture", name: "shelf", qty: rand(0..10), location: location})
  bicycle = Equipment.create({category: "sports", name: "bicycle", qty: rand(0..10), location: location})
  basketball = Equipment.create({category: "sports", name: "basketball", qty: rand(0..10), location: location})
  goggles = Equipment.create({category: "sports", name: "goggles", qty: rand(0..10), location: location})
  piano = Equipment.create({category: "instrument", name: "piano", qty: rand(0..10), location: location})
  violin = Equipment.create({category: "instrument", name: "violin", qty: rand(0..10), location: location})
  flute = Equipment.create({category: "instrument", name: "flute", qty: rand(0..10), location: location})
  fridge = Equipment.create({category: "electronics", name: "fridge", qty: rand(0..10), location: location})
  toaster = Equipment.create({category: "electronics", name: "toaster", qty: rand(0..10), location: location})

  location.equipment.each  do |equipment|
    puts "#{equipment.name} created"
  end
end

  puts "Creating sites for geomap..."
  warehse = {name: "Warehouse", address: "15 Science Centre Rd, Singapore 609081"}
  mbs_sg = {name: "Marina Bay Sands", address: "10 Bayfront Ave, Singapore 018956"}
  zoo_sg = {name: "Singapore Zoo", address: "80 Mandai Lake Rd, 729826"}
  airport_sg = {name: "Changi Airport", address: "70 Airport Blvd., Singapore 819661"}
  hq_sg = {name: "HQ", address: "9 Bishan Pl, Singapore 579837"}


  sites = [warehse, mbs_sg, zoo_sg, airport_sg, hq_sg]

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
