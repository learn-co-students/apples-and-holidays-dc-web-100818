require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, list_of_holidays|
    if season == :winter 
      list_of_holidays.each do |holiday, items| 
      items << supply
      end 
    end 
  end 
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, list_of_holidays|
    if season == :spring
      list_of_holidays.each do |holiday, items|
        if holiday == :memorial_day
          items << supply
        end
      end 
    end 
  end 
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  array = []
  # return an array of all of the supplies that are used in the winter season
  holiday_hash.each do |season, list_of_holidays|
    if season == :winter
      array = list_of_holidays.values.flatten
    end 
  end 
  array
end

def all_supplies_in_holidays(holiday_hash)
  array = []
  holiday_hash.each do |season, list_of_holidays|
    puts "#{season.to_s.capitalize!}:"
    list_of_holidays.each do |holiday, items|
      variable = holiday.to_s.include? ("_")
      if variable == true 
        holiday = holiday.to_s.split("_")
        holiday.collect do |n|
          n.capitalize!
        end
        holiday = holiday.join (" ")
        elsif variable == false 
        holiday = holiday.to_s.capitalize!
      end
      puts "  #{holiday}: #{items.join(", ")}"
    end 
  end 
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  array = []
  holiday_hash.each do |season, list_of_holidays|
    list_of_holidays.each do |holidays, items|
      variable = items.any? {|n| n == "BBQ"}
      if variable == true 
        array << holidays
      end
    end 
  end 
  array
end







