require 'spec_helper'

describe Post do
  before {@post= Post.create(topic: 'whats your favorite xmas song?')}
  subject{@post}
  
  it { should belong_to(:user)}
  it {should have_many(:comments)}

 end