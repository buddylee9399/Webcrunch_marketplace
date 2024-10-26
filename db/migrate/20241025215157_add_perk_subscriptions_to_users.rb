class AddPerkSubscriptionsToUsers < ActiveRecord::Migration[7.0]
  def change
    # add_column :users, :perk_subscriptions, :text, array:true, default: []
  end
end
