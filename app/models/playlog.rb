class Playlog < ApplicationRecord
  belongs_to :user
  belongs_to :place
end
