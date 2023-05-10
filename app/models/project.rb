class Project < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3}
  validates :body, length: { minimum: 1, maximum: 280 }
  has_one_attached :image

  validates :image, attached: true, 
                    content_type: [:png, :jpg, :jpeg]

end
