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
      else
        result[type] = options[type] unless options[type].nil?
      end
    end

    result.to_json
  end
  alias_method :nss, :number_and_secondary_stat


  def leaderboard(primary_value, options = {})
    result = Hash.new
    values = Array.new

    primary_value.each do |t|
      if t[2].nil?
        values << {
          label: t[0],
          value: t[1]
        }
      else
        values << {
          label: t[0],
          value: t[1],
          previous_rank: t[2]
        }
      end
    end

    result[:format] = options[:format] if options.has_key?(:format)
    result[:unit] = options[:unit] if options.has_key?(:unit)
    result[:items] = values

    result.to_json
  end
  alias_method :lb, :leaderboard


  def linechart(primary_value, options = {})
    result = Hash.new

    result[:item] = primary_value
    result[:settings] = Hash.new

    options.each do |key, value|
      result[:settings][key] = value
    end

    result.to_json
  end



end