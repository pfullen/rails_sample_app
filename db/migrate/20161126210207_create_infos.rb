class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.date :date_of_birth
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :cell_phone
      t.string :wife_name
      t.string :wife_date_of_birth
      t.string :wedding_anniversary
      t.string :diocese_of_ordination
      t.date :ordination_date
      t.string :diocese_of_incardination
      t.date :incardination_date
      t.boolean :military_service
      t.boolean :faculties
      t.boolean :preaching
      t.string :status
      t.string :employer
      t.string :employer_address
      t.string :secondary_address
      t.string :secondary_city
      t.string :string
      t.string :secondary_state
      t.string :secondary_zip
      t.string :secondary_phone
      t.string :assignment
      t.string :assignment_location
      t.string :assignment_pastor
      t.string :emergency_contact_name
      t.string :emergency_contract_phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
