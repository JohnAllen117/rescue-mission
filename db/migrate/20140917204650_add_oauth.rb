class AddOauth < ActiveRecord::Migration
  def change
    add_column(:users, :twit_id, :string)
  end
end
