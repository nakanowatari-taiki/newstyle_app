class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :part
  belongs_to :user
  has_many   :comments
  validates :part_id, numericality: { other_than: 1 } 
end
