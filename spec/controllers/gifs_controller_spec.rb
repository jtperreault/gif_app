require 'rails_helper'

describe GifsController do

  let(:admin) { create(:admin) }

  describe "GET #index" do
    let(:gif) { create(:gif) }
    before {
      get :index
    }

    it "populates an array of gifs" do
      expect(assigns(:gifs)).to eq([gif])
    end

    it "renders the :index view" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    let(:gif) { create(:gif) }

    before {
      get :show, params: { id: gif }
    }

    it "assigns the requested gif to @gif" do
      expect(assigns(:gif)).to eq(gif)
    end

    it "renders the :show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    context "when authenticated" do
      before {
        sign_in admin
        get :new
      }

      it "assigns a new gif to @gif" do
        expect(assigns(:gif)).to be_a_new(Gif)
      end

      it "renders the :new template" do
        expect(response).to render_template(:new)
      end
    end

    context "when NOT authenticated" do
      before { get :new }

      it "redirects to sign in" do
        expect(response).to redirect_to(new_admin_session_path)
      end
    end

  end

  describe "POST #create" do

    context "when authenticated" do
      before { sign_in admin }

      context "with valid attributes" do
        it "creates a new gif" do
          expect{
            post :create, params: { gif: attributes_for(:gif) }
          }.to change(Gif, :count).by(1)
        end

        it "redirects to the new gif" do
          post :create, params: { gif: attributes_for(:gif) }
          expect(response).to redirect_to Gif.last
        end
      end

      context "with invalid attributes" do
        let(:invalid_gif) { attributes_for(:gif, title: "") }

        it "does not save the gif" do
          expect{
            post :create, params: { gif: invalid_gif }
          }.to_not change(Gif, :count)
        end

        it "again renders the :new method" do
          post :create, params: { gif: invalid_gif }
          expect(response).to render_template :new
        end
      end

    end

    context "when NOT authenticated" do
      before { post :create, params: { gif: attributes_for(:gif) } }
      it "redirects to sign in" do
        expect(response).to redirect_to(new_admin_session_path)
      end
    end
  end

  describe "PUT #update" do

    let(:resource) { create(:gif, title: "My Awesome Gif!") }

    context "when authenticated" do
      before { sign_in admin }

      context "with valid attributes" do
        let(:gif_attributes) { attributes_for(:gif) }

        it "finds the correct gif" do
          put :update, params: { id: resource, gif: gif_attributes }
          expect(assigns(:gif)).to eq(resource)
        end

        it "changes the gif's attributes" do
          put :update, params: { id: resource, gif: gif_attributes.merge( { title: "My Amazing Gif!" } ) }
          resource.reload
          expect(resource.title).to eq("My Amazing Gif!")
        end

        it "redirects to the updated gif" do
          put :update, params: { id: resource, gif: gif_attributes }
          expect(response).to redirect_to resource
        end
      end

      context "with invalid attributes" do
        let(:invalid_gif_attributes) { attributes_for(:gif, title: "") }

        it "finds the correct gif" do
          put :update, params: { id: resource, gif: invalid_gif_attributes }
          expect(assigns(:gif)).to eq(resource)
        end

        it "does not change the gif's attributes" do
          put :update, params: { id: resource, gif: invalid_gif_attributes }
          resource.reload
          expect(resource.title).to eq("My Awesome Gif!")
        end

        it "again renders the :edit method" do
          put :update, params: { id: resource, gif: invalid_gif_attributes }
          expect(response).to render_template :edit
        end
      end

    end

    context "when NOT authenticated" do
      before  { put :update, params: { id: resource, gif: attributes_for(:gif) } }
      it "redirects to the sign in" do
        expect(response).to redirect_to(new_admin_session_path)
      end
    end

  end

  describe "DELETE #destroy" do
    let!(:resource) { create(:gif) }

    context "when authenticated" do
      before {
        sign_in admin
      }

      it "deletes the gif" do
        expect{
          delete :destroy, params: { id: resource }
        }.to change(Gif, :count).by(-1)
      end

      it "redirects" do
        delete :destroy, params: { id: resource }
        expect(response).to redirect_to(gifs_url)
      end
    end

    context "when NOT authenticated" do
      before { delete :destroy, params: { id: resource } }

      it "redirects to sign in" do
        expect(response).to redirect_to(new_admin_session_path)
      end
    end

  end

end

