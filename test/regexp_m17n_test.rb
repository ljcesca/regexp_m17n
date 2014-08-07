# encoding: utf-8
require 'minitest/autorun'
require_relative '../lib/regexp_m17n'

class RegexpTest < MiniTest::Unit::TestCase
  def test_non_empty_string
    Encoding.list.each do |enc|
      begin
        assert(RegexpM17N.non_empty?('.'.encode(enc)))
      rescue Encoding::ConverterNotFoundError
        assert(RegexpM17N.non_empty?('.'.force_encoding(enc)))
      end
    end
  end
end
