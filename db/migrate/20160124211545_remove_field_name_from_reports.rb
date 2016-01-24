class RemoveFieldNameFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :slug, :string
  end
end
