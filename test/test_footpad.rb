require 'minitest/autorun'
require 'footpad'
include Footpad

class FootpadTest < Minitest::Test
  def test_number_and_secondary_stat_one_value
    test_data = '{"item":[{"value":5723}]}'
    assert_equal test_data, number_and_secondary_stat(5723)
  end

  def test_number_and_secondary_stat_one_value_and_text
    test_data = '{"item":[{"value":5723,"text":"Total paying customers"}]}'
    assert_equal test_data, number_and_secondary_stat(5723, text: 'Total paying customers')
  end

  def test_number_and_secondary_stat_one_value_and_text_and_prefix
    test_data = '{"item":[{"value":5723,"text":"Total paying customers","prefix":"$"}]}'
    assert_equal test_data, number_and_secondary_stat(5723, text: 'Total paying customers', prefix: '$')
  end

  def test_number_and_secondary_stat_two_values
    test_data = '{"item":[{"value":5723,"secondary":"300"}]}'
    assert_equal test_data, number_and_secondary_stat(5723, secondary: '300')
  end

    def test_number_and_secondary_stat_two_values_reversed
    test_data = '{"item":[{"value":5723,"secondary":"300","reversed":true}]}'
    assert_equal test_data, number_and_secondary_stat(5723, secondary: '300', reversed: true)
  end

  def test_number_and_secondary_stat_one_value_with_trendline_and_text
    test_data = '{"item":[{"value":274057,"text":"Past 7 days"},["38594","39957","35316","35913","36668","45660","41949"]]}'
    assert_equal test_data, number_and_secondary_stat(274057, text: 'Past 7 days', trendline: ["38594","39957","35316","35913","36668","45660","41949"])
  end
end