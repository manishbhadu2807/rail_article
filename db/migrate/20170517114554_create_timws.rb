class CreateTimws < ActiveRecord::Migration[5.1]
  def change
    create_table :timws do |t|

      t.timestamps
    end
  end
end
