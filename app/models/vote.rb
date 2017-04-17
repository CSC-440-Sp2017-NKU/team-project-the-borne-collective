class Vote < ApplicationRecord
    belongs_to :post
    validates :post_id,   presence: true
    #validates :user_id,   presence: true
    validates :vote,   presence: true, length:  { minimum: -1, maximum: 1 }
    
    def vote(post_id, user_id, num)
        Votes.create(:post_id => post_id, :user_id => user_id, :vote => num)
    end
    
    def count_votes(post_id)
        tot_vote = 0;
        Votes.vote.each do |x| 
            tot_vote = tot_vote + x
        end
    end
end
