class Todo < ApplicationRecord
  belongs_to :project, optional: true
end

class Project < ApplicationRecord
  has_many :todos

end
