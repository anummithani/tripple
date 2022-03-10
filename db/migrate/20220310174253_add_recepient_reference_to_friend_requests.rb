class AddRecepientReferenceToFriendRequests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :friend_requests, :users, column: :recepient_id
    add_index :friend_requests, :recepient_id
    change_column_null :friend_requests, :recepient_id, false
  end
end
