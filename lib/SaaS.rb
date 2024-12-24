class SaaS
  ["Cloud","Ruby", "cluster"].each do |action|
    define_method("perform_#{action}") do |argument|
      "performing #{action.gsub('_',' ')} on #{argument}"
    end
  end
end

software = SaaS.new
puts software.perform_Cloud("public")
puts  software.perform_Ruby("Rails")
puts software.perform_cluster("demand")

r = ['banana','anana','naan'].map do |food| food.reverse
end.select { |f|  f.match(/^a/) }
puts r 

def demonstrate_block(number)
   yield(number)
end
puts demonstrate_block(1) { |number| number + 1}

def calculate(a, b)
  yield(a, b)
end
 puts calculate(2, 3) { |a, b| a + b }
 puts calculate(2, 3) { |a, b| a - b }
 puts calculate(2, 3) { |a, b| a * b }
 