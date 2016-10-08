class Api::V1::CompaniesController < ApplicationController
	require 'rut_chileno'
	def index
		if validate(params[:rut])
			search = Company.where("rut LIKE ?","%"+params[:rut]+"%").first
			if !search.blank?
				response = {response:"true",data: search}
				render json: response, status: 200
			else
				response = {response:"false",msg:"Rut no existe en la base de datos"}
				render json: response,status: 422
			end
		else
			response = {response:"false",msg:"Rut no valido"}
			render json:response,status: 422
		end
	end
	def validate(record)
		unless RUT::validar(record)
			false
		else
			true
		end
	end
end
