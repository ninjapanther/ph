#require_relative "../m2"
#require_relative "../init.rb"
require "test/unit"



def letter_combinations(digits)
    #number to letters mapping
    letters = {"2" => ["a", "b", "c"],"3" => ["d", "e", "f"],"4" => ["g", "h", "i"],"5" => ["j", "k", "l"],"6" => ["m", "n", "o"],"7" => ["p", "q", "r", "s"],"8" => ["t", "u", "v"],"9" => ["w", "x", "y", "z"]}

    # Read dictionary file and hold all values in a array
    dictionary = []
    file_path = "dictionary.txt"
    File.foreach( file_path ) do |word|
      dictionary.push word.chop.to_s.downcase
    end
    # get all letters for numbers in form of array
    keys = digits.chars.map{|digit|letters[digit]}

    results = {}
    total_number = keys.length - 1 # total numbers
    #Loo through all letters and get matching records with dictionary
    for i in (1..total_number)
      first_array = keys[0..i]
      second_array = keys[i + 1..total_number]
      next if first_array.length < 3 || second_array.length < 3
      first_combination = first_array.shift.product(*first_array).map(&:join) # Get product of arrays
      next if first_combination.nil?
      second_combination = second_array.shift.product(*second_array).map(&:join)
      next if second_combination.nil?
      results[i] = [(first_combination & dictionary), (second_combination & dictionary)] # get common values from arrays
    end
    #arrange words like we need as a output
    final_words = []
    results.each do |key, combinataions|
      next if combinataions.first.nil? || combinataions.last.nil?
      combinataions.first.product(combinataions.last).each do |combo_words|
        final_words << combo_words
      end
    end
    # for all numbers
    final_words << (keys.shift.product(*keys).map(&:join) & dictionary).join(", ") # matche with all character
    final_words
  end




class TestCase < Test::Unit::TestCase
	def test_case
                expected = letter_combinations("8787878787")	
		assert_equal(expected,[])

		
	end


end	
