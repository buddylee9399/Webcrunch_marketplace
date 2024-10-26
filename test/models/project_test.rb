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
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
