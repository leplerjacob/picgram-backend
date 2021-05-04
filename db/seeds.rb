User.destroy_all
Post.destroy_all
Comment.destroy_all

nerly = User.create(email: "nerly@me.com", password: "123asd")

jacob = User.create(email: "jacob@me.com", password: "456fgh")

christian = User.create(email: "christian@me.com", password: "789jkl")

post_one = Post.create(image: "http://somesite.com/123dicde", description: "this is me at the beach. yayyy", user_id: nerly.id)

post_two = Post.create(image: "http://somesite.com/583rnie", description: "this is me at the mall. yayyy", user_id: jacob.id)

post_three = Post.create(image: "http://somesite.com/429f9j", description: "this is me at the dealership. yayyy", user_id: christian.id)

comment_one = Comment.create(text: "this is some text", user_id: nerly.id, post_id: post_two.id)
comment_two = Comment.create(text: "this is some text", user_id: jacob.id, post_id: post_three.id)
comment_three = Comment.create(text: "this is some text", user_id: christian.id, post_id: post_one.id)

