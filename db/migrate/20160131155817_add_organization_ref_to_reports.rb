class AddOrganizationRefToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :organization, index: true, foreign_key: true
  end
end
