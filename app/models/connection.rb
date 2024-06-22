class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :connected_user
end
