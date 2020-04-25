class Post < ApplicationRecord
  validates :title, {
              presence: true,
              uniqueness: { case_sensitive: false },
            }
  validates :description, {
              presence: true,
              length: { minimum: 50 },
            }
end
