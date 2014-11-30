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

  def test_leaderboard
    test_data = '{"items":[{"label":"Peter","value":234,"previous_rank":2},{"label":"Patrick","value":232,"previous_rank":1},{"label":"Jon","value":230},{"label":"Clara","value":220},{"label":"Tom","value":215,"previous_rank":7},{"label":"Sylvester","value":200},{"label":"David","value":195,"previous_rank":5},{"label":"Matt","value":190},{"label":"William","value":185},{"label":"Rose","value":182,"previous_rank":11},{"label":"Colin","value":178,"previous_rank":10},{"label":"Paul","value":172},{"label":"Amy","value":166},{"label":"Christopher","value":162}]}'
    assert_equal test_data, leaderboard([['Peter',234,2],['Patrick',232,1],['Jon',230],['Clara',220],['Tom',215,7],['Sylvester',200,],['David',195,5],['Matt',190],['William',185],['Rose',182,11],['Colin',178,10],['Paul',172],['Amy',166],['Christopher',162]])
  end

  def test_leaderboard_with_format
    test_data = '{"format":"currency","unit":"USD","items":[{"label":"Peter","value":234,"previous_rank":2},{"label":"Patrick","value":232,"previous_rank":1},{"label":"Jon","value":230},{"label":"Clara","value":220},{"label":"Tom","value":215,"previous_rank":7},{"label":"Sylvester","value":200},{"label":"David","value":195,"previous_rank":5},{"label":"Matt","value":190},{"label":"William","value":185},{"label":"Rose","value":182,"previous_rank":11},{"label":"Colin","value":178,"previous_rank":10},{"label":"Paul","value":172},{"label":"Amy","value":166},{"label":"Christopher","value":162}]}'
    assert_equal test_data, leaderboard([['Peter',234,2],['Patrick',232,1],['Jon',230],['Clara',220],['Tom',215,7],['Sylvester',200,],['David',195,5],['Matt',190],['William',185],['Rose',182,11],['Colin',178,10],['Paul',172],['Amy',166],['Christopher',162]], format: 'currency', unit: 'USD')
  end

  def test_linechart
    test_data = '{"item":[10,20,30,5,5,1,25,15],"settings":{"axisx":["02/02","02/03","02/04","02/05","02/06","02/07","02/08","02/09"],"axisy":[],"color":"#ff00aa"}}'
    assert_equal test_data, linechart([10,20,30,5,5,1,25,15], axisx: (2..9).map {|i| "02/0#{i}"}, axisy: [], color: '#ff00aa')
  end
end