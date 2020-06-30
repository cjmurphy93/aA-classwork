# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, :description, :moderator_id, presence: true

    has_many :posts,
      primary_key: :id,
      foreign_key: :sub_id,
      class_name: :Sub

    belongs_to :moderator,
      primary_key: :id, 
      foreign_key: :moderator_id,
      class_name: :User

      # has_many :post_subs
end
