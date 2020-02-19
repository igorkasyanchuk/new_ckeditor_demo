class Post < ApplicationRecord

  def to_param
    self.uuid
  end

  def Post.with_template(template)
    post = Post.new
    post.template = template
    post.content  = %q{
      <h1>I'm new CKEditor 5</h1>
      <ul>
        <li>I support different type editor</li>
        <li>I can be customized</li>
        <li>I support image uploads</li>
        <li>...and other <strong>things</strong></li>
      </ul>
    }
    post.uuid     = SecureRandom.alphanumeric(8)
    post.save
    post
  end

end
