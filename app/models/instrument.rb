class Instrument < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  mount_uploader :picture, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, inclusion: {
    in: %w(String Brass Percussion Guitar other)
  }
  validates :picture, presence: true
end
