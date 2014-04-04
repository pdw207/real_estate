class Building < ActiveRecord::Migration
  def change
    create_table(:buildings) do |b|
      b.string :street, null: false
      b.string :city, null: false
      b.string :state, null: false
      b.string :zip_code, null: false
      b.string :description
    end

    add_index :buildings, :zip_code
  end

end
