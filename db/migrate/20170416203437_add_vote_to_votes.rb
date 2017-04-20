class AddVoteToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :vote, :integer
  end
end
