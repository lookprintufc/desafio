require 'test_helper'

class AgencyBanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agency_bank = agency_banks(:one)
  end

  test "should get index" do
    get agency_banks_url
    assert_response :success
  end

  test "should get new" do
    get new_agency_bank_url
    assert_response :success
  end

  test "should create agency_bank" do
    assert_difference('AgencyBank.count') do
      post agency_banks_url, params: { agency_bank: { address: @agency_bank.address, number_agency: @agency_bank.number_agency } }
    end

    assert_redirected_to agency_bank_url(AgencyBank.last)
  end

  test "should show agency_bank" do
    get agency_bank_url(@agency_bank)
    assert_response :success
  end

  test "should get edit" do
    get edit_agency_bank_url(@agency_bank)
    assert_response :success
  end

  test "should update agency_bank" do
    patch agency_bank_url(@agency_bank), params: { agency_bank: { address: @agency_bank.address, number_agency: @agency_bank.number_agency } }
    assert_redirected_to agency_bank_url(@agency_bank)
  end

  test "should destroy agency_bank" do
    assert_difference('AgencyBank.count', -1) do
      delete agency_bank_url(@agency_bank)
    end

    assert_redirected_to agency_banks_url
  end
end
