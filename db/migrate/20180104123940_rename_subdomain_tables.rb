class RenameSubdomainTables < ActiveRecord::Migration[5.1]
  def change
    rename_table :subdomain, :subdomains
    rename_table :domain, :domains
  end
end
