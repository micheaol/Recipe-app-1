require_relative '../rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    Recipe.new(used_id: 1, name: 'first recipe', preparation_time: '1 hour', cooking_time: ' 30 minutes',
               description: 'recipe description')
  end

  it 'should have name' do
    expect(subject.name).to eq('first recipe')
    expect(subject).to be_valid
  end

  it 'should have preparation_time' do
    expect(subject.preparation_time).to eq('1 hour')
    expect(subject).to be_valid
  end

  it 'should have cooking_time' do
    expect(subject.cooking_time).to eq('30 minutes')
    expect(subject).to be_valid
  end

  it 'should have description ' do
    expect(subject.description).to eq('recipe description')
    expect(subject).to be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'preparation_time should be present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'cooking_time should be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
