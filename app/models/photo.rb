class Photo < ApplicationRecord
  belongs_to :property, optional: true
end
