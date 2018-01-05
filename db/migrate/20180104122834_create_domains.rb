class CreateDomains < ActiveRecord::Migration[5.1]
  def change
    create_table :domain do |t|
      t.string :name
      t.timestamps
    end
  end
end
