require 'award'

def update_quality(awards)

  awards.each do |award|

    next if award.name == Award.blue_distinction_plus

    award.calc_quality
    award.calc_expiration
    
  end
  
end
