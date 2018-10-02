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
  
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = holiday_hash[:winter].values
  return winter_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_list = ""
  holiday_hash.each do |season, holiday|
    holiday_list << "#{season.to_s.capitalize}:\n"
    
      holiday.each do |holiday_name, value|
        holiday_list << "  #{holiday_name.to_s.split("_").map(&:capitalize!).join(" ")}: #{value.join(", ")}\n"
    end
  end
   puts holiday_list
end


def all_holidays_with_bbq(holiday_hash)
  bbq_holidays = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday_name, supply|
      if supply.include?("BBQ") == true 
        bbq_holidays << holiday_name
      end
    end
  end
  return bbq_holidays
end