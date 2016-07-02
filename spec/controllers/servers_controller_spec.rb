require 'rails_helper'

RSpec.describe ServersController, type: :controller do

  let(:valid_attributes) { attributes_for(:server) }
  let(:invalid_attributes) { attributes_for(:server, name: nil, application: nil, public_ip: nil) }

  before(:each) { sign_in }

  describe "GET #index" do
    it "assigns all servers as @servers" do
      server         = Server.create valid_attributes
      another_server = Server.create valid_attributes
      get :index, {}
      # expect(assigns(:servers)).to eq [server, another_server] // NOTICE: Will respect order.
      expect(assigns(:servers)).to match_array [server, another_server]
    end
  end

  describe "GET #show" do
    it "assigns the requested server as @server" do
      server = Server.create valid_attributes
      get :show, { :id => server.to_param }
      expect(assigns(:server)).to eq(server)
    end
  end

  describe "GET #new" do
    it "assigns a new server as @server" do
      get :new, {}
      expect(assigns(:server)).to be_a_new(Server)
    end
  end

  describe "GET #edit" do
    it "assigns the requested server as @server" do
      server = Server.create valid_attributes
      get :edit, { :id => server.to_param }
      expect(assigns(:server)).to eq(server)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Server" do
        expect {
          post :create, { :server => valid_attributes }
        }.to change(Server, :count).by(1)
      end

      it "assigns a newly created server as @server" do
        post :create, { server: valid_attributes }
        expect(assigns(:server)).to be_a(Server)
        expect(assigns(:server)).to be_persisted
      end

      it "redirects to the created server" do
        post :create, { :server => valid_attributes }
        expect(response).to redirect_to(Server.last)
      end
    end

    context "with invalid params" do
      it "does not saves the new server in the database" do
        expect {
          post :create, { server: invalid_attributes }
        }.not_to change(Server, :count)
      end

      it "assigns a newly created but unsaved server as @server" do
        post :create, { server: invalid_attributes }
        expect(assigns(:server)).to be_a_new(Server)
      end

      it "re-renders the 'new' template" do
        post :create, { server: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      let(:new_server) { build(:server) }
      let(:new_attributes) { new_server.attributes }

      it "updates the requested server" do
        server = Server.create valid_attributes
        put :update, { :id => server.to_param, :server => new_attributes }
        server.reload
        expect(server.name).to eq(new_server.name)
      end

      it "assigns the requested server as @server" do
        server = Server.create valid_attributes
        put :update, { :id => server.to_param, :server => valid_attributes }
        expect(assigns(:server)).to eq(server)
      end

      it "redirects to the server" do
        server = Server.create valid_attributes
        put :update, { :id => server.to_param, :server => valid_attributes }
        expect(response).to redirect_to(server)
      end
    end

    context "with invalid params" do
      it "assigns the server as @server" do
        server = Server.create valid_attributes
        put :update, { :id => server.to_param, :server => invalid_attributes }
        expect(assigns(:server)).to eq(server)
      end

      it "re-renders the 'edit' template" do
        server = Server.create valid_attributes
        put :update, { :id => server.to_param, :server => invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested server" do
      server = Server.create valid_attributes
      expect {
        delete :destroy, { :id => server.to_param }
      }.to change(Server, :count).by(-1)
    end

    it "redirects to the servers list" do
      server = Server.create valid_attributes
      delete :destroy, { :id => server.to_param }
      expect(response).to redirect_to(servers_url)
    end
  end
end
