class AddMonthAndYearToPeerReviews < ActiveRecord::Migration
  def change
    add_column :peer_reviews, :month, :integer
    add_column :peer_reviews, :year, :integer
  end
end
