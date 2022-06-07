class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def recieved_one?(item_name)
        if self.freebies.find_by(item_name: item_name) == nil
            false
        else
            true
        end
    end

    def give_away(dev, freebie)
        if self.freebies.find_by(item_name: freebie.item_name) != nil
            freebie.update_attribute(:dev_id, dev.id)
        else
            "That freebie does not belong to this dev"
        end
    end
end
