require "test/unit"

def setpath
	file_path = "dictionary.txt"
end
class TestCase < Test::Unit::TestCase
	def test_case
		expected = File.file?("file_path")		
               #% expected = ("TT").downcase	
		assert_equal(expected,"true")

		
	end


end	
