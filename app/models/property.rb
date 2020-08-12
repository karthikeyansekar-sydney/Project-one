class Property < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :broker, optional: true
end
