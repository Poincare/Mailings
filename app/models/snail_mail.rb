
class SnailMail < ActiveRecord::Base
  attr_accessible :page_count, :file_url, :sender_address, :recipient_address, :email
  belongs_to :user

  def self.page_count(fp_url)
    io = open(fp_url)
    reader = PDF::Reader.new(io)
    return reader.page_count
  end

  def self.calc_price(page_count)
    return ((30*page_count)+170)
  end

  def process_payment(stripeToken)
    @amount = SnailMail.calc_price(page_count) 

    #should be moved to config file soon - temporary placement since
    #it is a testing key.   
    Stripe.api_key = "vhtfQjBxqfPF1BVOlNnpeAqHSB9ssgsE"
 
    Stripe::Charge.create(
      :amount => @amount,
      :card => stripeToken,
      :description => "SnailPDF charge",
      :currency => 'usd'
    ) 

    return true 
  rescue Stripe::CardError => e
    return false 
  end
    
end
