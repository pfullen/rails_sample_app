require 'test_helper'

class InfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @info = infos(:one)
  end

  test "should get index" do
    get infos_url
    assert_response :success
  end

  test "should get new" do
    get new_info_url
    assert_response :success
  end

  test "should create info" do
    assert_difference('Info.count') do
      post infos_url, params: { info: { assignment: @info.assignment, assignment_location: @info.assignment_location, assignment_pastor: @info.assignment_pastor, cell_phone: @info.cell_phone, city: @info.city, date_of_birth: @info.date_of_birth, diocese_of_incardination: @info.diocese_of_incardination, diocese_of_ordination: @info.diocese_of_ordination, emergency_contact_name: @info.emergency_contact_name, emergency_contract_phone: @info.emergency_contract_phone, employer: @info.employer, employer_address: @info.employer_address, faculties: @info.faculties, first_name: @info.first_name, incardination_date: @info.incardination_date, last_name: @info.last_name, middle_name: @info.middle_name, military_service: @info.military_service, ordination_date: @info.ordination_date, phone: @info.phone, preaching: @info.preaching, secondary_address: @info.secondary_address, secondary_city: @info.secondary_city, secondary_phone: @info.secondary_phone, secondary_state: @info.secondary_state, secondary_zip: @info.secondary_zip, state: @info.state, status: @info.status, street_address: @info.street_address, string: @info.string, user_id: @info.user_id, wedding_anniversary: @info.wedding_anniversary, wife_date_of_birth: @info.wife_date_of_birth, wife_name: @info.wife_name, zip_code: @info.zip_code } }
    end

    assert_redirected_to info_url(Info.last)
  end

  test "should show info" do
    get info_url(@info)
    assert_response :success
  end

  test "should get edit" do
    get edit_info_url(@info)
    assert_response :success
  end

  test "should update info" do
    patch info_url(@info), params: { info: { assignment: @info.assignment, assignment_location: @info.assignment_location, assignment_pastor: @info.assignment_pastor, cell_phone: @info.cell_phone, city: @info.city, date_of_birth: @info.date_of_birth, diocese_of_incardination: @info.diocese_of_incardination, diocese_of_ordination: @info.diocese_of_ordination, emergency_contact_name: @info.emergency_contact_name, emergency_contract_phone: @info.emergency_contract_phone, employer: @info.employer, employer_address: @info.employer_address, faculties: @info.faculties, first_name: @info.first_name, incardination_date: @info.incardination_date, last_name: @info.last_name, middle_name: @info.middle_name, military_service: @info.military_service, ordination_date: @info.ordination_date, phone: @info.phone, preaching: @info.preaching, secondary_address: @info.secondary_address, secondary_city: @info.secondary_city, secondary_phone: @info.secondary_phone, secondary_state: @info.secondary_state, secondary_zip: @info.secondary_zip, state: @info.state, status: @info.status, street_address: @info.street_address, string: @info.string, user_id: @info.user_id, wedding_anniversary: @info.wedding_anniversary, wife_date_of_birth: @info.wife_date_of_birth, wife_name: @info.wife_name, zip_code: @info.zip_code } }
    assert_redirected_to info_url(@info)
  end

  test "should destroy info" do
    assert_difference('Info.count', -1) do
      delete info_url(@info)
    end

    assert_redirected_to infos_url
  end
end
