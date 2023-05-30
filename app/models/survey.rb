class Survey < ApplicationRecord
    validates :answer0, presence: true
    validates :answer1, presence: true
    validates :answer2, presence: true
end
