class Word
  def palindrome?(string)
    string == string.reverse
  end
end

w = Word.new
p w.palindrome?("foobar")
p w.palindrome?("level")

class Wordd < String
  def palindrome?
    self == self.reverse
  end
end

s = Wordd.new("level")
p s.palindrome?

class String
  def palindrome?
    self == reverse
  end
end

p "foof".palindrome?
p "tor".palindrome?

def string_shuffle(s) 
   s.split('').shuffle.join
end
p string_shuffle("foobar")

puts "="*20

person1 = {:first => "Jhon", :last => "Doe"}
person2 = {:first => "Nensy", :last => "Doe"}
person3 = {:first => "Tom", :last => "Doe"}

params = {:father => person1,
          :mother => person2,
          :child  => person3}

p params[:father][:first]
p params[:mother][:first]

