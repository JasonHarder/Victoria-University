class Conversation < ApplicationRecord
    has_many :messages, dependent: :destroy
    belongs_to :sender, foreign_key: :sender_id, class_name: User
    belongs_to :recipient, foreign_key: :recipient_id, class_name: User

    validates :sender_id, uniqueness: {scope: :recipient_id}
    
    def opposed_user(user)
        user == recipient ? sender : :recipient
    end

end

##ADD INDEX COMMAND MAY NEED TO BE EXECUTED IN TERMINAL - DOUBLE CHECK.
# Adding the between scope means being able to return a conversation between 2 requested users
# we add a get method to get a conversation between 2 users and if present , will return it if there is not any it would create one.