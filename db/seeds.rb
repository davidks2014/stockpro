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

  qty = rand(0.0..10.0).round(0)
  unit_price= rand(1.00..10.00).round(2)
  rose = Material.create({category: "flower", name: "rose", cost_code: "MFR", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "no.", location: location})

  qty = rand(0.0..10.0).round(0)
  unit_price= rand(1.00..10.00).round(2)
  brocoli = Material.create({category: "vegetable", name: "brocoli", cost_code: "MVB", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "kg", location: location})

  qty = rand(0.0..10.0).round(0)
  unit_price= rand(1.00..10.00).round(2)
  orange = Material.create({category: "fruit", name: "orange", cost_code: "MFO", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "kg", location: location})

  qty = rand(0.0..10.0).round(0)
  unit_price= rand(1.00..10.00).round(2)
  oak = Material.create({category: "tree", name: "oak", cost_code: "MTO", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "no.", location: location})

  puts " #{location.name} Creating equipment..."

  # bricks = Material.create({category: "", name: "bricks", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  # cement = Material.create({category: "", name: "cement", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  # concrete = Material.create({category: "", name: "concrete", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  # glass = Material.create({category: "", name: "glass", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  # gravel = Material.create({category: "", name: "gravel", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  # paint = Material.create({category: "", name: "paint", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  # pipes = Material.create({category: "", name: "pipes", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  # sand = Material.create({category: "", name: "sand", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  # steel = Material.create({category: "", name: "steel", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  # tiles = Material.create({category: "", name: "tiles", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})
  # wood = Material.create({category: "", name: "wood", cost_code: "MFR", unit_price: rand(1.00..10.00).round(2), qty: rand(0.00..10.00).round(2), uom: "no.", location: location})



  location.materials.each  do |material|
    puts "#{material.name} created"
  end

  vacuum = Equipment.create({category: "electronics", name: "vacuum", qty: rand(0..10), location: location})

  shelf = Equipment.create({category: "furniture", name: "shelf", qty: rand(0..10), location: location})

  goggles = Equipment.create({category: "sports", name: "goggles", qty: rand(0..10), location: location})

  piano = Equipment.create({category: "instrument", name: "piano", qty: rand(0..10), location: location})



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
company = Location.create({name: "HQ", address: "Singapore"})
manager = User.create({name: "Manager", role: "manager", email: "manager@gmail.com", password: "123456"})
puts "#{manager.name} created"

puts "Finished!"
