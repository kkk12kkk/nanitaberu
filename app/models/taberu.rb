class Taberu < ApplicationRecord
  has_one_attached :image
  belongs_to :user  

  validates :body, length: { maximum: 200}

  validates :title, presence: true
  validates :body, presence: true

 def get_image
    unless image.attached?
      file_path = Rails.root.join
      image.attach(io: file.open(file_path), filename:'default-image.jpg',content_type: 'image/jpeg')
    end
    image
  end
end  