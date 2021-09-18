class GameLog < ApplicationRecord
  validates :user_id_1, presence: true
  validates :user_id_2, presence: true
end
