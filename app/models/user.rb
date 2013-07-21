class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :address
  # attr_accessible :title, :body

  has_many :snail_mails

  def count_mails
    return snail_mails.count
  end

  def total_price
    total = 0
    snail_mails.each do |snail_mail|
      total += SnailMail.calc_price(snail_mail.page_count)
    end

    return total
  end

end
