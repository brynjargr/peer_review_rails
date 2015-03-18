class CreatePeerReviews < ActiveRecord::Migration
  def change
    create_table :peer_reviews do |t|
      t.string :name
      t.text   :peer_reviews
      t.text   :self_review
      t.timestamps null: false
    end
  end
end
