puts "Cleaning database..."
Location.destroy_all
Material.destroy_all

puts "Creating Locations..."
warehouse = {name: "Warehouse", address: "15 Science Centre Rd, Singapore 609081"}
projectA = {name: "Marina Bay Sands", address: "10 Bayfront Ave, Singapore 018956"}
projectB = {name: "Singapore Zoo", address: "80 Mandai Lake Rd, 729826"}
projectC = {name: "Changi Airport", address: "70 Airport Blvd., Singapore 819661"}

locations = [warehouse, projectA, projectB, projectC]

locations.each do |attributes|
  location = Location.create!(attributes)
  puts "Created #{location.name}"

  qty = rand(400..500).round(0)
  unit_price= rand(16.00..18.00).round(1)
  graniteblock = Material.create(
    category: "block",
    name: "granite block - 20x20x10 cm",
    cost_code: "bgb-202010",
    unit_price: unit_price,
    qty:,
    amount: qty * unit_price,
    uom: "pcs",
    image_path: "granite_block.jpeg",
    location:,
    alertlevel: 0
  )

  qty = rand(400..600).round(0)
  unit_price= rand(11.00..13.00).round(1)
  hollowcoreblock = Material.create({category: "  block", name: "hollow core block - 39x10x19 cm", cost_code: "bhc-301019", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "pcs", image_path: "hollow_core_block.jpeg", location:, alertlevel: 0})

  qty = rand(600..700).round(0)
  unit_price= rand(6.00..8.00).round(1)
  redbrick = Material.create({category: "block", name: "red brick - 20x10x9 cm", cost_code: "brb-201009", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "pcs", image_path: "red_brick.jpg", location:, alertlevel: 0})

 qty = rand(100..200).round(0)
  unit_price= rand(28.00..30.00).round(1)
  riversand = Material.create({category: "sand", name: "river sand (10kg)", cost_code: "srs-001", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "bag", image_path: "sand.jpeg", location:, alertlevel: 0})

 qty = rand(400..600).round(0)
  unit_price= rand(12.00..13.00).round(1)
  portlandcement = Material.create({category: "cement", name: "portland cement (50kg)", cost_code: "cpc-50", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "bag", image_path: "portland_cement.jpg", location:, alertlevel: 0})

 qty = rand(50..60).round(0)
  unit_price= rand(1140.00..1150.00).round(0)
  t10 = Material.create({category: "rebar", name: "10mm dia. rebar", cost_code: "T10", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "tons", image_path: "T10_rebar.jpg", location:, alertlevel: 0})

 qty = rand(40..60).round(0)
  unit_price= rand(1140.00..1150.00).round(0)
  t12 = Material.create({category: "rebar", name: "12mm dia. rebar", cost_code: "T12", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "tons", image_path: "T12_rebar.jpg", location:, alertlevel: 0})

 qty = rand(20..40).round(0)
  unit_price= rand(1140.00..1150.00).round(0)
  t16 = Material.create({category: "rebar", name: "16mm dia. rebar", cost_code: "T16", unit_price: unit_price, qty: qty, amount: qty * unit_price, uom: "tons", image_path: "T16_rebar.jpg", location:, alertlevel: 0})


  location.materials.each  do |material|
    puts "#{material.name} created"
  end

  # vacuum = Equipment.create({category: "electronics", name: "vacuum", qty: rand(0..10), image_path: })

  # shelf = Equipment.create({category: "furniture", name: "shelf", qty: rand(0..10), location: location})

  # goggles = Equipment.create({category: "sports", name: "goggles", qty: rand(0..10), location: location})

  # piano = Equipment.create({category: "instrument", name: "piano", qty: rand(0..10), location: location})


  # location.equipment.each  do |equipment|
  #   puts "#{equipment.name} created"
  # end
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
    pingyu = User.create({name: "Pingyu", role: "engineer", email: "pingyu@gmail.com", password: "123456", location: Location.find_by(warehouse)})
  puts "#{pingyu.name} created"

  puts " #{projectA[:name]} Creating user..."
    david = User.create({name: "David", role: "engineer", email: "david@gmail.com", password: "123456", location: Location.find_by(projectA)})
  puts "#{david.name} created"

  puts " #{projectB[:name]} Creating user..."
    teckguan= User.create({name: "Teckguan2", role: "engineer", email: "teckguan@gmail.com", password: "123456", location: Location.find_by(projectB)})
  puts "#{teckguan.name} created"

  puts " #{projectC[:name]} Creating user..."
    yaya = User.create({name: "Yaya", role: "engineer", email: "yaya@gmail.com", password: "123456", location: Location.find_by(projectC)})
  puts "#{yaya.name} created"

puts " Creating user manager..."
company = Location.create({name: "HQ", address: "Singapore"})
manager = User.create({name: "Manager", role: "manager", email: "manager@gmail.com", password: "123456", location: company})
puts "#{manager.name} created"

puts "Finished!"
