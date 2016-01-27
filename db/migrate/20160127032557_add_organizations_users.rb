class AddOrganizationsUsers < ActiveRecord::Migration
  def change
	create_table :members do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end