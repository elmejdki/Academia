require 'rails_helper'

describe Comment do
  let!(:user) do
    User.create(
      username: 'Zaka',
      email: 'elmejdki@gmail.com',
      fullname: 'Zakariae El number2',
      password: '123456'
    )
  end
  let(:post) do
    Post.create(
      author_id: user.id,
      text: 'Hello every one this is a post'
    )
  end
  subject do
    Comment.new(
      user_id: user.id,
      post_id: post.id,
      text: 'Hi'
    )
  end

  it { should validate_presence_of(:text) }
  it { should validate_length_of(:text).is_at_least(2) }

  it 'is valid if text length is long enough' do
    expect(subject).to be_valid
  end

  it 'is not valid if text length is not long enough' do
    subject.text = 'I'
    expect(subject).to_not be_valid
  end
end
