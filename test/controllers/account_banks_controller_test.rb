require 'test_helper'

class AccountBanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account_bank = account_banks(:one)
  end

  test "should get index" do
    get account_banks_url
    assert_response :success
  end

  test "should get new" do
    get new_account_bank_url
    assert_response :success
  end

  test "should create account_bank" do
    assert_difference('AccountBank.count') do
      post account_banks_url, params: { account_bank: { agency_bank_id: @account_bank.agency_bank_id, limit: @account_bank.limit, number_account: @account_bank.number_account } }
    end

    assert_redirected_to account_bank_url(AccountBank.last)
  end

  test "should show account_bank" do
    get account_bank_url(@account_bank)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_bank_url(@account_bank)
    assert_response :success
  end

  test "should update account_bank" do
    patch account_bank_url(@account_bank), params: { account_bank: { agency_bank_id: @account_bank.agency_bank_id, limit: @account_bank.limit, number_account: @account_bank.number_account } }
    assert_redirected_to account_bank_url(@account_bank)
  end

  test "should destroy account_bank" do
    assert_difference('AccountBank.count', -1) do
      delete account_bank_url(@account_bank)
    end

    assert_redirected_to account_banks_url
  end
end
