# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :string           not null
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  validates :title, :url, :content, :sub_id, :author_id, presence: true

  belongs_to :sub,
    primary_key: :id, 
    foreign_key: :sub_id,
    class_name: :Sub

  belongs_to :author, 
    primary_key: :id, 
    foreign_key: :author_id,
    class_name: :User

end
