# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    after_create :assign_default_role
  has_many :projects, dependent: :destroy
    def name
      "#{first_name} #{last_name}"
    end
    def uid?
      "uid#"
    end
    def admin?
      true
    end
    def provider?
      "prov#"
    end
    def access_code?
      "access#"
    end
    def publishable_key?
      "pubKey#"
    end
    def stripe_id
      "str_id#"
    end
    def subscribed
      true
    end
    def card_last4
      "1234"
    end
    def card_exp_month
      "08"
    end
    def card_exp_year
      "2025"
    end
    def card_type    
      "visa"
    end
  def can_receive_payments?
    uid? &&  provider? && access_code? && publishable_key?
  end
    
    def assign_default_role
      if User.count == 1
        self.add_role(:site_admin) if self.roles.blank?
        self.add_role(:admin)
        self.add_role(:customer)      
      else
        self.add_role(:customer) if self.roles.blank?
      end
    end  
end
