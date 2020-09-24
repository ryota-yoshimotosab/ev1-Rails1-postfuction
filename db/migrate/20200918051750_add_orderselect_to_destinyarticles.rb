class AddOrderselectToDestinyarticles < ActiveRecord::Migration[6.0]
  def change
    add_column :destinyarticles, :orderselect, :integer
  end
end
