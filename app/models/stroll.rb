class Stroll < ApplicationRecord
  belongs_to :city
  belongs_to :dog
  belongs_to :dogsitter

end
