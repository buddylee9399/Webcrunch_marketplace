json.extract! project, :id, :title, :donation_goal, :user_id, :current_donation_amount, :expires_at, :status, :backings_count, :created_at, :updated_at
json.url project_url(project, format: :json)
