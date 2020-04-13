require 'spec_helper'

describe Movie do
  describe "#similar" do
    it "should find movies by the same director" do
       @Test_Movies = [
            double("Movie", :id => 1, :title => "Star Wars", :director => "George Lucas"),
            double("Movie", :id => 2, :title => "THX-1138", :director => "George Lucas"),
            double("Movie", :id => 3, :title => "Blade Runner", :director => "Ridley Scott")             
        ]

        results = Movie.search_directors(@Test_Movies[0].director)

        expect(@Test_Movies[0].title).to eq("Star Wars")
        expect(@Test_Movies[1].title).to eq('THX-1138')
       
    end

    it "should not find movies by different directors" do
     @Test_Directors = [
            double("Movie", :id => 1, :title => "Star Wars", :director => "George Lucas"),
            double("Movie", :id => 2, :title => "THX-1138", :director => "George Lucas"),
            double("Movie", :id => 3, :title => "Blade Runner", :director => "Ridley Scott")             
        ]

        expect(Movie.search_directors(@Test_Directors[2].title)).not_to eq("Blade Runner")
    end
  end
    describe '#ratings' do
    it 'returns all ratings' do
      expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
        end
    end
end