require "application_system_test_case"

class InvoiceItemsTest < ApplicationSystemTestCase
  setup do
    @invoice_item = invoice_items(:one)
  end

  test "visiting the index" do
    visit invoice_items_url
    assert_selector "h1", text: "Invoice Items"
  end

  test "creating a Invoice item" do
    visit invoice_items_url
    click_on "New Invoice Item"

    fill_in "Amount", with: @invoice_item.amount
    fill_in "Invoice", with: @invoice_item.invoice_id
    fill_in "Item", with: @invoice_item.item_id
    fill_in "Quantity", with: @invoice_item.quantity
    click_on "Create Invoice item"

    assert_text "Invoice item was successfully created"
    click_on "Back"
  end

  test "updating a Invoice item" do
    visit invoice_items_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @invoice_item.amount
    fill_in "Invoice", with: @invoice_item.invoice_id
    fill_in "Item", with: @invoice_item.item_id
    fill_in "Quantity", with: @invoice_item.quantity
    click_on "Update Invoice item"

    assert_text "Invoice item was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice item" do
    visit invoice_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice item was successfully destroyed"
  end
end
