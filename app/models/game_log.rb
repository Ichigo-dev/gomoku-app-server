class GameLog < ApplicationRecord
  validates :user_id_1, presence: true
  validates :user_id_2, presence: true
  validates :win_user, presence: true
end
