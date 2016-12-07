class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :date_of_birth, :string
    
    add_column :users, :street_address, :string
    
    add_column :users, :city, :string
   
    add_column :users, :state, :string
    
    add_column :users, :zip_code, :string
    
    add_column :users, :phone, :string
  
    add_column :users, :cell_phone, :string
    
    add_column :users, :wife_name, :string
    
    add_column :users, :wife_date_of_birth, :string
    
    add_column :users, :wedding_anniversary, :string
    
    add_column :users, :diocese_of_ordination, :string
   
    add_column :users, :ordination_date, :string
    
    add_column :users, :diocese_of_incardination, :string
    
    add_column :users, :incardination_date, :string
    
    add_column :users, :military_service, :string
    
    add_column :users, :military_branch, :string
   
    add_column :users, :military_period, :string
   
    add_column :users, :military_years, :string
   
    add_column :users, :military_rank, :string

    add_column :users, :faculties, :string
 
    add_column :users, :preaching, :string
   
    add_column :users, :status, :string
    
    add_column :users, :employer, :string
   
    add_column :users, :employer_address, :string
    
    add_column :users, :secondary_address, :string
    
    add_column :users, :secondary_city, :string
    
    add_column :users, :secondary_state, :string
    
    add_column :users, :secondary_zip, :string
    
    add_column :users, :secondary_phone, :string
    
    add_column :users, :assignment, :string
   
    add_column :users, :assignment_location, :string
    
    add_column :users, :assignment_pastor, :string
    
    add_column :users, :emergency_contact_name, :string
    
    add_column :users, :emergency_contract_phone, :string
    
    add_column :users, :highschool, :string
   
    add_column :users, :under_graduate, :string
    
    add_column :users, :graduate, :string
    
    add_column :users, :doctorate, :string
    
    add_column :users, :field_of_study, :string
    
    add_column :users, :prior_employment_description, :string
   
    add_column :users, :prior_diaconate_ministry, :string
    
    add_column :users, :picture, :string
   
  end
end
