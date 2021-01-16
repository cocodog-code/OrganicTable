class Store < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :genre, presence: true, length: { maximum: 30 }
  validates :phone, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :access, presence: true, length: { maximum: 30 }
  validates :hour, presence: true, length: { maximum: 50 }
  validates :website, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 50 }
  has_one_attached :image
  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
