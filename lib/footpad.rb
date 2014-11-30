require 'JSON'

module Footpad

  def number_and_secondary_stat(primary_value, options = {})
    all_types = [:reverse, :absolute, :time_duration, :item]
    item = Hash.new
    result = Hash.new

    item[:value] = primary_value
    options.each do |key, value|
      item[key] = value unless all_types.include?(key) or key == :trendline
    end

    all_types.each do |type|
      if type === :item
        if options.has_key?(:trendline)
          result[:item] = [item,options[:trendline]]
        else
          result[:item] = [item]
        end
      end
      result[type] = options[type] unless options[type].nil?
    end

    result.to_json
  end
  alias_method :nss, :number_and_secondary_stat



end