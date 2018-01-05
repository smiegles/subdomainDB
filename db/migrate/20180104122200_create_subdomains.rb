class CreateSubdomains < ActiveRecord::Migration[5.1]
  def change
    create_table :subdomain do |t|
      t.string :name
      t.integer :domain
      t.timestamps
    end
  end
end
