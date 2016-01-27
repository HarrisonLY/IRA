class AddOrganizationsUsers < ActiveRecord::Migration
  def self.up
    create_table :organizations_users, :id => false do |t|
      t.integer :organization_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :organizations_users
  end
end