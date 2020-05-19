# frozen_string_literal: true

class CartController < ApplicationController
  # Adds an item to the cart
  def add
    # get the Id of the product
    id = params[:id]
    # if the cart is already been created, use existing cart else create a blank cart
    if session[:cart]
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    # If the product is already added it increments by 1 else product set to 1
    cart[id] = cart[id] ? cart[id] + 1 : 1
    redirect_to action: :index
  end

  # Increases item quantity in cart by 1
  def increase
    id = params[:id]
    cart = session[:cart]
    cart[id] = cart[id] + 1
    redirect_to action: :index
  end

  # Reduces the item quantity in cary by 1
  def decrease
    id = params[:id]
    cart = session[:cart]
    if cart[id] == 1
      cart.delete id
    else
      cart[id] = cart[id] - 1
    end
    # Taking us to cart index[view] page
    redirect_to action: :index
  end

  # Sets session variable to nil and bring back to index
  def clear
    session[:cart] = nil
    redirect_to action: :index
  end

  # Passes a cart to display
  def index
    @cart = session[:cart] || {}
    @invoice = Invoice.new
    @items = Item.all
  end

  def remove
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    redirect_to action: :index
  end

  # Creating an order
  def checkout
    # Step 1: Get the current user
    @user = User.find(current_user.id)
    # @user = User.find(1)

    # Step 2: Create a new order and associate it with the current user
    @invoice = @user.invoices.build(date_of_invoice: DateTime.now, status: 'Paid')
    @invoice.save

    # Step 3: For each item in the cart, create a new item on the order!!
    @cart = session[:cart] || {} # Get the content of the Cart
    @cart.each do |id, quantity|
      # Reduces the stock as item is added to checkout
      item = Item.find_by_id(id)
      sub_total = item.price*quantity
      @invoice_item = @invoice.invoice_items.build(item_id: item.id, quantity: quantity, amount: sub_total, invoice_id: Invoice.last)
      @invoice_item.save
    end

    @invoices = Invoice.last
    @invoice_items = InvoiceItem.where(invoice_id: Invoice.last)
    session[:cart] = nil
  end
  
  
end
