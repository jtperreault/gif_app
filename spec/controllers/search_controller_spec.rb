require 'rails_helper'

describe SearchController do

  let!(:gifs) { create_list(:gif, 3, tag_list: 'One, Two, Three') }

  describe "GET #index" do
    before { get :index }

    it "renders the :index view" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #search" do
    context "with matching tags" do
      before { get :search, params: { tags: 'One, Two, Three' } }

      it "populates an array of gifs" do
        expect(assigns(:gifs)).to match_array(gifs)
      end

      it "renders the :search view" do
        expect(response).to render_template(:search)
      end
    end

    context "without matching tags" do
      before { get :search, params: { tags: 'Four, Five, Six' } }

      it "renders the :search view" do
        expect(response).to render_template(:search)
      end

    end
  end
end
