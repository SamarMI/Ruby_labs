#!/usr/bin/ruby


class ComplexNumber
    
attr_reader :real, :imag
@@count=0
def initialize(real,imag)
    @real=0.0+real
    @imag=0.0+imag
  end

  def +(other)
    new_real = @real + other.real
    new_img = @imag + other.imag
    @@count += 1
   result= ComplexNumber.new(new_real,new_img)
   return result

  end

  def *(other)
    @@count += 1
    new_real = real * other.real - imag * other.imag
    new_imag = imag * other.real + real * other.imag
   #puts "the multiplication of complex #{new_real}+ i #{ new_imag}" 
    result = ComplexNumber.new(new_real, new_imag)
    return result
  end

  def self.bulk_add(args)
    init_real=0.0
    init_img=0.0
  
    result =  ComplexNumber.new(init_real,init_img)      
    for cn in args 
        result = (result + cn)
    end
    return result
   # args.each_index { |i| new_real = args[i][i].real + new_real }
   end


   def self.bulk_multiply(args)
    init_real=1.0
    init_img=0  
    result =  ComplexNumber.new(init_real,init_img)      
    for cn in args 
        result = ((result ).* (cn))
    end
    return result
   
   end


  def self.get_stats()
    puts "#{@@count}"
  end  

end




puts"==================================================="
num1 = ComplexNumber.new(3,2)
num2 = ComplexNumber.new(1,7)
puts " num1 = ComplexNumber.new(3,2) , num2 = ComplexNumber.new(1,7)"
multiplication_test= ComplexNumber.new(3,2).*(ComplexNumber.new(1,7))
puts " multiplication_test = #{multiplication_test.real} + #{multiplication_test.imag}i"

sunmming_test= ComplexNumber.new(3,2)+(ComplexNumber.new(1,7))
puts " sunmming_test = #{sunmming_test.real} + #{sunmming_test.imag}i"

puts"==================================================="
puts"array =[ComplexNumber.new(3,2),ComplexNumber.new(1,7)]"
a =[ComplexNumber.new(3,2),ComplexNumber.new(1,7)]
multiplication_pulk_test=ComplexNumber.bulk_multiply(a)
puts"multiplication_pulk_test =  #{multiplication_pulk_test.real} + #{multiplication_pulk_test.imag}i"

sunmming_pulk_test=ComplexNumber.bulk_add(a)
puts"sunmming_pulk_test =  #{sunmming_pulk_test.real} + #{sunmming_pulk_test.imag}i"

puts"==================================================="
status =  ComplexNumber.get_stats()
puts " status =  #{status}"
 



