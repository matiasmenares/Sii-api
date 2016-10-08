class Company < ActiveRecord::Base
	require 'rut_chileno'
	def validate(record)
		unless RUT::validar(record)
		  false
		else
			true
		end
	end
end
