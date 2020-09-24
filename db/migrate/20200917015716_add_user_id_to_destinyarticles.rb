class AddUserIdToDestinyarticles < ActiveRecord::Migration[6.0]
  def change
    add_column :destinyarticles, :user_id, :string
  end
end
