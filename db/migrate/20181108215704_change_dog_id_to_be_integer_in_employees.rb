class ChangeDogIdToBeIntegerInEmployees < ActiveRecord::Migration[5.1]
  def change
    change_column :employees, :dog_id, :integer
  end
end
