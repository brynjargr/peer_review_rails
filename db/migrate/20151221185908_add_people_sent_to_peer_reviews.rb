class AddPeopleSentToPeerReviews < ActiveRecord::Migration
  def change
    add_column :peer_reviews, :people_sent, :string
  end
end
