class Employee < ApplicationRecord
  belongs_to :dog
  validates :first_name, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :alias, presence: true
  validates :office, presence: true
  validates :title, uniqueness: true

  def full_name
    self.first_name + " " + self.last_name
  end
end
