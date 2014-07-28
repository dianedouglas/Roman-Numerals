def roman_numerals(arabic_num)
  roman_out = ""
  arabic_num = arabic_num.to_s.split("").reverse

  arabic_num.length.downto(0) do |i|
    roman_out += find_each_digit(arabic_num[i].to_i, i)
  end
  roman_out
end

def find_each_digit(digit, placevalue)
  numeral_table = ['I', 'V', 'X', 'L', 'C', 'D', 'M']
  output = ""
  isAdditive = !(digit == 4 || digit == 9)
  degree_of_ten = numeral_table[placevalue * 2]
  degree_of_five = numeral_table[(placevalue * 2) + 1]
  next_degree_of_ten = numeral_table[(placevalue * 2) + 2]

  if(isAdditive)
    if digit >= 5
      digit -= 5
      output += degree_of_five
    end
    1.upto(digit) do
      output += degree_of_ten
    end

  else
    if digit == 4
      output += (degree_of_ten + degree_of_five)
    else
      output += (degree_of_ten + next_degree_of_ten)
    end
  end
  output
end
