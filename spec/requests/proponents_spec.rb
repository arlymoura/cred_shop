RSpec.describe "/proponents", type: :request do
  let(:valid_attributes) do
    {
      name: "John Doe",
      cpf: "123.456.789-00",
      date_of_birth: "1990-01-01",
      address_attributes: {
        street: "Main St.",
        number: "100",
        neighborhood: "Downtown",
        city: "Springfield",
        state: "SP",
        zip_code: "12345-678"
      },
      financial_info_attributes: {
        salary: 1045.00,
        inss_discount: 78.37
      },
      phones_attributes: {
        "0": {
          phone_number: "(11) 99999-9999",
          phone_type: "personal"
        }
      }
    }
  end

  let(:invalid_attributes) {
    {
      name: "John Doe",
      cpf: "123.456.789-00",
      date_of_birth: "1990-01-01",
      address_attributes: {
        street: "Main St.",
        number: "100",
        neighborhood: "Downtown",
        city: "Springfield",
        state: "SP",
        zip_code: "12345-678"
      },
      financial_info_attributes: {
        salary: -1045.00,
        inss_discount: 78.37
      },
      phones_attributes: {
        "0": {
          phone_number: "(11) 99999-9999",
          phone_type: "personal"
        }
      }
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Proponent.create! valid_attributes
      get proponents_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      proponent = Proponent.create! valid_attributes
      get proponent_url(proponent)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_proponent_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      proponent = Proponent.create! valid_attributes
      get edit_proponent_url(proponent)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Proponent" do
        expect {
          post proponents_url, params: { proponent: valid_attributes }
        }.to change(Proponent, :count).by(1)
      end

      it "redirects to the created proponent" do
        post proponents_url, params: { proponent: valid_attributes }
        expect(response).to redirect_to(proponent_url(Proponent.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Proponent" do
        expect {
          post proponents_url, params: { proponent: invalid_attributes }
        }.to change(Proponent, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post proponents_url, params: { proponent: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          financial_info_attributes: {
            salary: 3000.00,
          }
        }
      end

      it "updates the requested proponent" do
        proponent = Proponent.create! valid_attributes
        patch proponent_url(proponent), params: { proponent: new_attributes }
        proponent.reload
        expect(proponent.financial_info.salary).to eq(3000.00)
      end

      it "redirects to the proponent" do
        proponent = Proponent.create! valid_attributes
        patch proponent_url(proponent), params: { proponent: new_attributes }
        proponent.reload
        expect(response).to redirect_to(proponent_url(proponent))
      end
    end

    context "with invalid parameters" do
      xit "renders a response with 422 status (i.e. to display the 'edit' template)" do
        proponent = Proponent.create! valid_attributes
        patch proponent_url(proponent), params: { proponent: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested proponent" do
      proponent = Proponent.create! valid_attributes
      expect {
        delete proponent_url(proponent)
      }.to change(Proponent, :count).by(-1)
    end

    it "redirects to the proponents list" do
      proponent = Proponent.create! valid_attributes
      delete proponent_url(proponent)
      expect(response).to redirect_to(proponents_url)
    end
  end
end
