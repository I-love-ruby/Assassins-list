require_relative '../spec_helper'

describe 'CONTROLLER' do
  let(:user) {User.create(name: "kane", password: "123")}

  it 'my index route rendered' do
    get '/'
    expect(last_response).to be_ok
  end
end