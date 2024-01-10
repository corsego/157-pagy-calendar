class DateAvatar < ApplicationRecord
  has_one_attached :avatar

  # scope to check if avatar is attached
  scope :avatar_attached, -> { joins(:avatar_attachment) }

  # scope find first date_avatar for selected day
  scope :for_day, ->(date) { where(date: date.all_day) }
  # DateAvatar.where(date: Date.tomorrow.all_day).first
end
