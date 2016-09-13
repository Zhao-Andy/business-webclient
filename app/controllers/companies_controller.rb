class CompaniesController < ApplicationController
  def show
    @company = Company.find_by(id: params[:id])
  end

  def index
    @companies = Company.all
  end

  def new
  end

  def create
    @company = Company.create(
      name: params[:name],
      department: params[:department],
      buzzword: params[:buzzword],
      slogan: params[:slogan]
    )
    redirect_to "/companies/#{@company['id']}"
  end

  def edit
    @company = Unirest.get("http://localhost:3000/api/v1/companies/#{params[:id]}").body
  end

  def update
    @company = Company.find_by(id: params[:id])
    @company.update(
      name: params[:name],
      department: params[:department],
      buzzword: params[:buzzword],
      slogan: params[:slogan]
    )
    redirect_to "/companies/#{@company.id}"
  end

  def destroy
    @company = Company.find_by(id: params[:id]).destroy
    redirect_to '/companies'
  end
end
