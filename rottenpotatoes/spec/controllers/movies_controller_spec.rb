require 'rails_helper'

describe MoviesController, type: 'controller' do

  describe "#director" do
    context "When specified movie has a director" do
      it "should find movies with the same director" do
        @Test_Movies = [
            @Movie1 = double(Movie, :id => "1", :title => "Star Wars", :director => "George Lucas"),
            @Movie2 = double(Movie, :id => "4", :title => "THX-1138",  :director => "George Lucas")
        ]
        allow(Movie).to receive(:search_director_movies).and_return(@Test_Movies)
        expect(Movie).to receive(:find).and_return(@Test_Movies[0])
        get :search_directors, {:id => @Test_Movies[0].id}
      end
    end

    context "When specified movie has no director" do
      it "should redirect to the movies page" do
        @Test_NoDirector = double(Movie, :id => "3", :title => "Alien",  :director => "")
        expect(Movie).to receive(:find).and_return(@Test_NoDirector)
        get :search_directors, {:id => @Test_NoDirector.id}
        expect(response).should redirect_to movies_path
      end
    end

    
    context "When a movie is added" do
      it "Should add a new movie" do
        post :create, :movie => {:title => "Movie", :id => "1"}
        expect(flash[:notice]).to eq("Movie was successfully created.")
      end
    end
     context "When a movie is deleted" do
      it "Should delete the movie" do
        post :create, :movie => {:title => "DeleteMovie", :id => "1"}
        delete :destroy, {:id => "1"}
        expect(flash[:notice]).to eq("Movie 'DeleteMovie' deleted.")
      end
    end

    context "When a movie's info is updated" do
      it "Should update the movie" do
        post :create, :movie => {:title => "UpdateMovie", :id => "1"}
        put :update, id: "1",:movie => {:title => "UpdateMovie Updated"}
        expect(flash[:notice]).to eq("UpdateMovie Updated was successfully updated.")
      end
    end
    
  end
end