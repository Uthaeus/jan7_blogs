10.times do |blog|
  Blog.create(title: "#{blog} Title", date: Date.today, body: "Putting something here.")
end

puts "10 blogs created"
