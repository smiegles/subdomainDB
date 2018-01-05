class SubdomainsBelongsToDomain < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:subdomains, :domain, index: true)
    change_table(:subdomains) do |t|
      t.belongs_to :domain, index: true
    end
  end
end
