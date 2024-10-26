# == Schema Information
#
# Table name: projects
#
#  id                      :integer          not null, primary key
#  backings_count          :integer          default(0)
#  current_donation_amount :integer          default(0)
#  donation_goal           :decimal(, )
#  expires_at              :datetime         default(Sat, 01 Mar 2025 22:59:39.000000000 UTC +00:00)
#  status                  :string           default("active")
#  title                   :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :integer          not null
#
# Indexes
#
#  index_projects_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Project < ApplicationRecord
  belongs_to :user
  has_rich_text :description
  has_one_attached :thumbnail
  has_many :comments, as: :commentable
  has_many :perks, dependent: :destroy
  accepts_nested_attributes_for :perks, allow_destroy: true, reject_if: proc { |attr| attr['title'].blank? }

  scope :active, ->{ where(status: "active") }
  scope :inactive, ->{ where(status: "inactive") }

  def backers
    # find users who backed a specific project
  end

  def active?
    status == "active"
  end

  def inactive
    status == "inactive"
  end
end
