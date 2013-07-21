require 'net/http'
require 'rubygems'
require 'pdf/reader'

class IndexController < ApplicationController
  def index
  end

  def upload
    session[:fp_url] = params[:fp_url]
    page_count = SnailMail.page_count (session[:fp_url])
    @price = SnailMail.calc_price(page_count)      
  end

  def thanks
    page_count = SnailMail.page_count (session[:fp_url])
    m = SnailMail.new(:page_count => page_count, :file_url => session[:fp_url],
    :email => params[:email], :sender_address => params[:sender_address],
    :recipient_address => params[:recipient_address])

    m.save
    m.process_payment (params[:stripeToken])
  end
end
