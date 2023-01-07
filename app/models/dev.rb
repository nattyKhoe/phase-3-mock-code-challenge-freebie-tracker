class Dev < ActiveRecord::Base
has_many :freebies
has_many :companies, through: :freebies

    def received_one? (item_name)
        # item_check = self.freebies.map do |freebie|
        #     freebie.item_name == item_name
        # end

        # item_check.include?(true)

        self.freebies.any? do |freebie|
            freebie.item_name == item_name
        end

    end

    def give_away(dev, freebie)
        # self.freebies.delete(freebie)
        # dev.freebies.push(freebie)
        freebie.update(dev: dev) unless freebie.dev != self
    end
end