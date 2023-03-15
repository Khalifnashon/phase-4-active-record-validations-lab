class Author < ApplicationRecord
    validates :name, presence: true, uniqueness: true, format: { with: /\A[A-Z]/, message: "must start with a capital letter" }
    validates :phone_number, presence: true, length: { is: 10 }
end
  
