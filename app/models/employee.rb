class Employee < ApplicationRecord
  belongs_to :dog
  #validate uniqueness of alias and job title
  validates :alias, uniqueness: true, unless: Proc.new {|employee| employee.alias == "none"}
  validates :title, uniqueness: true
end
