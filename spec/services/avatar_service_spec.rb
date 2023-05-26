RSpec.describe AvatarService do
  it 'exists' do
    service = AvatarService.new

    expect(service).to be_a AvatarService
  end

  it 'can get members' do
    params = 'fire+nation'

    response = AvatarService.new.get_members(params)

    expect(response).to be_a Array
    expect(response.count).to eq(97)
  end
end