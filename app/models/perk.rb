# == Schema Information
#
# Table name: perks
#
#  id          :integer          not null, primary key
#  amount      :decimal(8, 2)    default(0.0)
#  description :text
#  quantity    :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer          not null
#
# Indexes
#
#  index_perks_on_project_id  (project_id)
#
# Foreign Keys
#
#  project_id  (project_id => projects.id)
#
class Perk < ApplicationRecord
  belongs_to :project
end
