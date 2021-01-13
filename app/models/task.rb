class Task < ApplicationRecord
    validates :title, :start, :finish, presence: true
end
