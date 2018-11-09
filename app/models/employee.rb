class Employee < ApplicationRecord
  belongs_to :dog
  validates :alias, uniqueness: true
  validates :title, uniqueness: true

  def name
    @employee.first_name + " " + @employee.last_name
  end

end
