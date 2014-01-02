class AddVotesCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :votes_count, :integer, default: 0

    Topic.reset_column_information
    Topic.find_each do |t|
      Topic.reset_counters t.id, :votes
    end
  end
end
