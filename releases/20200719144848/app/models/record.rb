class Record < ApplicationRecord
  belongs_to :user, foreign_key: "app_user_id", optional:true

  validates :material, presence: true, length: { maximum: 50 }
  validates :memo, presence: true, length: { maximum: 255 }

  MINUTES = %w(
    0 1 2 3 4 5 6 7 8 9
    10 11 12 13 14 15 16 17 18 19
    20 21 22 23 24 25 26 27 28 29
    30 31 32 33 34 35 36 37 38 39
    40 41 42 43 44 45 46 47 48 49
    50 51 52 53 54 55 56 57 58 59
  )
  MINUTES_INT = MINUTES.map { |e| e.to_i }
  validates :study_minute, inclusion: { in: MINUTES_INT, allow_blank: true }

  HOURS = %w(
    0 1 2 3 4 5 6 7 8 9
    10 11 12 13 14 15 16 17 18 19
    20 21 22 23
  )
  HOURS_INT = HOURS.map { |e| e.to_i }
  validates :study_hour, inclusion: { in: HOURS_INT, allow_blank: true  }

  def self.total_minutes(study_minute)
    sum(:study_minute)
  end

  def self.total_hours(study_hour)
    sum(:study_hour)
  end

  def total_study_time
    self.study_minute + self.study_hour * 60
  end
end
