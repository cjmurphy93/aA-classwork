# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord

    CAT_COLORS = ["black", "brown", "white"]
    
    validates :color, inclusion: CAT_COLORS
    validates :sex, inclusion: ['M','F']
    validates :birth_date, :color, :name, :sex, :description, presence: true

    include ActionView::Helpers::DateHelper
    def age
        time_ago_in_words(self.birth_date)
    end
end
