# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  uuid       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  template   :string
#

class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  def to_param
    self.uuid
  end

  def Post.with_template(template)
    post          = Post.new
    post.uuid     = SecureRandom.alphanumeric(8)
    post.title    = "Post: #{Post.maximum(:id)}"
    post.template = template
    post.content  = %q{
      <h1>I'm a new CKEditor 5</h1>
      <ul>
        <li>I support different type editor</li>
        <li></li>
        <li>CLICK HERE</li>
        <li></li>
        <li>I can be customized</li>
        <li>I support image uploads</li>
        <li>...and other <strong>things</strong></li>
      </ul>

      <img src="/Logo_100x100.png"/>

      <table>
        <thead>
          <tr>
            <th>First name</th>
            <th>Last name</th>
            <th>Age</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Jill</td>
            <td>Smith</td>
            <td>50</td>
          </tr>
          <tr>
            <td>Eve</td>
            <td>Jackson</td>
            <td>94</td>
          </tr>
        </tbody>
      </table>
    }
    post.save
    post
  end

end
