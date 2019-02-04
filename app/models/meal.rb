class Meal < ApplicationRecord
  belongs_to :user, optional: true
  has_many :meal_compositions
  has_many :foods, through: :meal_compositions

  scope :today, -> { where("time > :begin_day AND time < :end_day)", begin_day: DateTime.now.midnight, end_day: DateTime.now.midnight + 1)}
  scope :chronological, -> { order(time: :asc) }
end
