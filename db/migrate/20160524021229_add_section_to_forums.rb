class AddSectionToForums < ActiveRecord::Migration
  def change
    add_column :forums, :section, :string
  end
end
