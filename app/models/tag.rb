class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :article, through: :taggings

end
