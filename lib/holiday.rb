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
  holiday_hash[:winter].each do |key, value|
      value << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
    
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_array = []
  final_holidays = ""
  extras = ""
  holiday_hash.each do |season, day|
    season_capped = season.to_s.capitalize!
    puts "#{season_capped}:"
    day.each do |holiday, extra|
      holiday_array = (holiday.to_s.tr("_", " ")).split
      holiday_array.each do |string|
        string.capitalize!
        final_holidays = holiday_array.join(" ")
      end 
    extras = "#{extra.join(", ")}"
    puts "  #{final_holidays}: #{extras}"
    end
  end 
end

def all_holidays_with_bbq(holiday_hash)
  bbq_holiday = []
  holiday_hash.each do |season, holiday|
    holiday.each do |day, supplies|
      if (supplies).include?("BBQ") == true
        bbq_holiday << day
      end
    end
  end
  bbq_holiday
end







