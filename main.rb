require_relative 'config/initializer' 

Availability.delete_all
# testes
 
puts "\ntestando mesmo dia"
puts "true => #{Availability.call('2020-10-01',1, "joão")}" 
puts "false => #{Availability.call('2020-10-01',1, "artu")}" 


puts "\ntestando dia seguinte" 
puts "true => #{Availability.call('2020-10-02',1, "ana")}" 
puts "false => #{Availability.call('2020-10-02',1, "vitoria")}"  


puts "\ntestando dias iniciais e finais"

puts "true => #{Availability.call('2020-10-05',5, "vitor") }" 
puts "false => #{Availability.call('2020-10-03',5, "julia") }"   
puts "false => #{Availability.call('2020-10-08',5, "betina") }"   

puts "\ntestando entre dias"
puts "true => #{Availability.call('2020-10-15',2, "eduardo") }"    
puts "false => #{Availability.call('2020-10-13',10, nil)}"   
 
 