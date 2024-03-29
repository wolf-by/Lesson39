class Contact < ApplicationRecord
  validates :email, presence: true, length: {minimum: 7}
  validates :message, presence: true, length: {minimum: 15}

end
