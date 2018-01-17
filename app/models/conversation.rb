class Conversation < ApplicationRecord
    has_many :messages, dependent: :destroy
    belongs_to :sender, foreign_key: :sender_id, class_name: User
    belongs_to :recipient, foreign_key: :recipient_id, class_name: User

    validates :sender_id, uniqueness: {scope: :recipient_id}
    add_index :conversations, [:recipient_id, :sender_id], unique: true
    
    def opposed_user(user)
        user == recipient ? sender : :recipient
    end

    add_index :conversations, [:recipient_id, :sender_id], unique: true
end

##ADD INDEX COMMAND MAY NEED TO BE EXECUTED IN TERMINAL - DOUBLE CHECK.