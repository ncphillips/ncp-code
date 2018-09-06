1.upto(5) do |i|
	puts "#{i}. Infinity, the star that would not die"
end


class A 
	def name
		"A"
	end
end

something = A.new

if A.new.name
	puts "Name: #{something.name}"
end

puts "Name: #{something.name}"
puts "Name: #{something.name}"
puts "Name: #{something.name}"

