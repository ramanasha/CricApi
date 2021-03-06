require 'spec_helper'

describe CricApi do
 
  before(:all) do
    @output = CricApi::Request.new("TESTKEY0273")
    @data = @output.cricket.data
  end
  
  describe '#cricket' do
    it 'returns on-going cricket data' do
      cricket = @output.cricket
      expect(cricket.data.length).to be > 0
    end

  end 
  
  describe '#schedule' do
    it 'returns schedule data' do
      schedule = @output.schedule
      expect(schedule.data.length).to be > 0
    end

  end
  
  describe '#matches' do
    it 'returns match data' do
      matches = @output.matches
      expect(matches.matches.length).to be > 0
    end

  end

  describe '#cricketScore' do
    it 'returns team score data' do
      cricketScore = @output.cricketScore(@data[0].unique_id)
      expect(cricketScore.score).not_to be(nil)
    end

  end  

  describe '#playerStats' do
    it 'returns playerStats data' do
      playerStats = @output.playerStats("35320")
      expect(playerStats.pid.to_s).to eq("35320")
    end

  end
  
  describe '#fantasySummary' do
    it 'returns fantasySummary data' do
      fantasySummary = @output.fantasySummary(@data[0].unique_id)
      expect(fantasySummary.data).not_to be(nil)
    end
  end

  describe '#fantasySquad' do
    it 'returns fantasySquad data' do
      fantasySquad = @output.fantasySquad(@data[0].unique_id)
      expect(fantasySquad.squad.length).to be > 0
    end
  end  


  describe '#playerFinder' do
    it 'returns playerFinder data' do
      playerFinder = @output.playerFinder("tendulkar")
      expect(playerFinder.data.length).to be > 0
    end
  end       
  
end