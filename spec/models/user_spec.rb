require_relative "../spec_helper"

describe "User Model" do
  let(:dongchul){User.create(name:"dongchul", password:"0000")}

  it 'should have a name' do
    expect(dongchul.name).to eq("dongchul")
  end

end