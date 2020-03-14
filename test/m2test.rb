#require_relative "../m2"
#require_relative "../init.rb"
require "test/unit"


  def letter_combinations(digits)
    #return if number not valid
    return ["error number of digits not 10"] if digits.length != 10 
	end



class TestCase < Test::Unit::TestCase
	def test_case
                expected = letter_combinations("87878787")	
		assert_equal(expected,["error number of digits not 10"])

		
	end


end	
