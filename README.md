**Project ADS**

**Credential**:

  **Admin**:
    email: test@example.com
    password: qwerty
    
  **Seller**:
    email: test2@example.com
    password: qwerty


**Post moderation logic**

The logic of post moderation was implemented in a simple way of transmitting the necessary string:
```
    @draft = Post.where(post_type: 'C', user_id: current_user.id)
    @moderation = Post.where(post_type: 'M', user_id: current_user.id)
    @rejected = Post.where(post_type: 'R', user_id: current_user.id)
    @approved = Post.where(post_type: 'A', user_id: current_user.id)
    @archive = Post.where(post_type: 'AR', user_id: current_user.id)
```

Heroku:
https://stormy-journey-16747.herokuapp.com/posts
