module PostsHelper
    
    def findLastPoster(post, user)
        if post.replies.count == 0
           return user.name + "\n"
        else 
           return User.find(post.replies.last.user_id).name 
        end
    end
    
    def humanizeDateTime(date_time)
       return date_time.strftime("%B %d '%y at %I:%M %p") 
    end
end
