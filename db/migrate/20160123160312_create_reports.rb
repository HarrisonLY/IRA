class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
	  t.integer :reportable_id
      t.string  :reportable_type

      t.timestamps null: false
    end
  	  add_index :reports, :reportable_id
  end
end
