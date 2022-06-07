class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

  

    def give_freebie(dev, item_name, value)
        dev_id = Dev.find_by(name: dev).id
        Freebie.create(item_name: item_name, value: value, dev_id: dev_id, company_id: self.id)
    end

    def self.oldest_company
        founding_year_arr = []
        self.all.each do |company|
            founding_year_arr << company.founding_year
        end
        founding_year_arr.sort
        
        self.find_by(founding_year: founding_year_arr[-1])
    end
end
