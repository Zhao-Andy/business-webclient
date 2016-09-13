class Company
  attr_accessor :name, :department, :buzzword, :slogan, :id

  def initialize(input)
    @id = input["id"]
    @name = input["name"]
    @department = input["department"]
    @buzzword = input["buzzword"]
    @slogan = input["slogan"]
  end

  def buzz_department
    @buzzword + @slogan
  end

  def self.find_by(options)
    company_hash = Unirest.get("http://localhost:5000/api/v1/companies/#{options[:id]}.json").body
    @company = Company.new(company_hash)
  end

  def self.all
    companies_array = Unirest.get(
      "http://localhost:5000/api/v1/companies.json",
      headers: {
        "Accept" => "application/json",
        "Authorization" => "Token token=#{ENV['123']}",
        "X-User-Email" => ENV["cool@gmail.com"]
      }
    ).body
    companies_array.map do |company|
      Company.new(company)
    end
  end

  def destroy
    Unirest.delete(
      "http://localhost:3000/api/v1/companies/#{id}",
      headers: {
        "Accept" => "application/json"
      }
    ).body
  end

  def update(params)
    @company = Unirest.patch(
      "http://localhost:3000/api/v1/companies/#{id}",
      headers: {
        "Accept" => "application/json"
      },
      parameters: {
        name: params[:name],
        department: params[:department],
        buzzword: params[:buzzword],
        slogan: params[:slogan]
      }
    ).body
  end

  def self.create(params)
    @company = Unirest.post(
      "http://localhost:3000/api/v1/companies",
      headers: {
        "Accept" => "application/json"
      },
      parameters: {
        name: params[:name],
        department: params[:department],
        buzzword: params[:buzzword],
        slogan: params[:slogan]
      }
    ).body
  end
end
