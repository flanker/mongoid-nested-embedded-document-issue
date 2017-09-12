require_relative '../lib/spike'
Mongoid.load!('config/mongoid.yml', 'test')
require 'byebug'

Mongoid.logger.level = Logger::DEBUG
Mongo::Logger.logger.level = Logger::DEBUG
Mongoid.logger = Logger.new(STDOUT)
Mongo::Logger.logger = Logger.new(STDOUT)

describe A do

  it 'sets api code when create' do
    a = A.create! bs: [{cs: [{}]}]
    expect(a.persisted?).to be true

    reloaded = A.find_by id: a.id
    expect(reloaded.bs.first.api_code).to eq 'Default Api Code B'
    expect(reloaded.bs.first.cs.first.api_code).to eq 'Default Api Code C'
  end


  it 'sets api code when update' do
    a = A.create
    expect(a.persisted?).to be true

    a.update_attributes bs: [{cs: [{}]}]

    reloaded = A.find_by id: a.id
    expect(reloaded.bs.first.api_code).to eq 'Default Api Code B'
    expect(reloaded.bs.first.cs.first.api_code).to eq 'Default Api Code C'    # expected: "Default Api Code C", got: nil
  end

end
