class AddVanityLinksToPolls < ActiveRecord::Migration
  def change
    add_column :polls, :vanity_url, :string
  end
end
