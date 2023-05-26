require 'rails_helper'

RSpec.describe Member do 
  it 'can create a member' do
    attrs = {
      _id: "5cf5679a915ecad153ab6906",
      allies: ["Ty Lee"],
      enemies: ["Appa"],
      photoUrl: "https://vignette.wikia.nocookie.net/avatar/images/a/a5/Circus_master.png/revision/latest?cb=20130706153819",
      name: "Circus master",
      affiliation: "Fire Nation circus"
    }

    member = Member.new(attrs)

    expect(member).to be_a Member
    expect(member.id).to eq("5cf5679a915ecad153ab6906")
    expect(member.name).to eq("Circus master")
    expect(member.photo).to eq("https://vignette.wikia.nocookie.net/avatar/images/a/a5/Circus_master.png/revision/latest?cb=20130706153819")
    expect(member.allies.first).to eq("Ty Lee")
    expect(member.enemies.first).to eq("Appa")
  end
end