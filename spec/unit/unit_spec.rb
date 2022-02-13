# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Message, type: :model do
  subject do
    described_class.new(id:0, text: 'harry potter', date_created: '2022-02-13',admin_id: 0, created_at: '2022-02-13', updated_at: '2022-02-13')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.text = nil
    subject.id = nil
    subject.date_created = nil
    subject.admin_id = nil
    subject.created_at = nil
    subject.updated_at = nil
    expect(subject).not_to be_valid
  end
end


RSpec.describe Carrier, type: :model do
  subject do
    described_class.new(id:0, domain: 'mms.cricketwireless.net',created_at: '2022-02-13', updated_at: '2022-02-13')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.domain = nil
    expect(subject).not_to be_valid
  end
end