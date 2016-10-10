require 'test_helper'
require 'string_extension'

class StringExtensionTest < ActiveSupport::TestCase

	def test_is_number
		assert "3".is_number?
	end

	def test_is_not_number
		assert !"Blah".is_number?
	end

	def test_humanize_function
		assert_respond_to("blah", :humanize)
	end

	def test_humanize_returns_something
		assert_not_nil "blah".humanize, "humanize is returning nil"
	end

	def test_humanize
		assert_equal "Likes me brains!", "LIKES ME BRAINS!".humanize, "humanize doesn't downcase the string"
	end

	def test_just_for_brains
		assert_match /brains/, "LIKES ME BRAINS!".humanize
	end

	def test_zombie_in_humanize_raises_error
		assert_raise(RuntimeError) do
			"zombie".humanize
		end
	end

end