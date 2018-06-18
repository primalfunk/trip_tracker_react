5.times do
  name = Faker::Zelda.location
  Trip.create(name: name)
  puts "Created Trip - name: #{name}"
end

counter = 1
Trip.all.each do
  10.times do
    val = rand(4) + 1
    case val
    when 1
      name = Faker::StarWars.planet
    when 2
      name = Faker::Simpsons.location
    when 3
      name = Faker::StarTrek.location
    when 4
      name = Faker::Lovecraft.location
    end
    address = Faker::Address.full_address
    Stop.create(name: name, address: address, trip_id: counter)
    puts "Created Stop on Trip to #{Trip.find(counter).name}: Stop: #{name}"
  end
  counter += 1
end