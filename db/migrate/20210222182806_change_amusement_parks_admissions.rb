class ChangeAmusementParksAdmissions < ActiveRecord::Migration[5.2]
  def change
    change_column :amusement_parks, :admissions, :float
  end
end
