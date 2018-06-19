class Authentication < ApplicationRecord
    validates :token, presence: true
    validates :token, uniqueness: true
    validates :ts, presence: true
    validates :ts, uniqueness: true
    validates :date, presence: true
end
