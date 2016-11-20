namespace :csv do
	require 'csv'
	task :parser => :environment do
		date = Date.today - 1.day
		date = date.strftime("%Y%m%d")
		Company.destroy_all
		CSV.foreach(Dir.pwd+'/public/ce_empresas_dwnld_'+date.to_s+'.csv', { col_sep: ';', quote_char: '¢',headers: true, encoding:'ISO-8859-1'}) do |row|
			Company.create(rut: row["RUT"],name: row["RAZON SOCIAL"],resolve_number: row["NUMERO RESOLUCION"],resolve_date: row["FECHA RESOLUCION"],mail: row["MAIL INTERCAMBIO"],url: row["URL"])
		end
	end
	task :download => :environment do
		require 'open-uri'
		date = Date.today - 1.day
		date = date.strftime("%Y%m%d")
		download = open('https://palena.sii.cl/cvc_cgi/dte/ee_consulta_empresas_dwnld?NOMBRE_ARCHIVO=ce_empresas_dwnld_'+date.to_s+'.csv')
		IO.copy_stream(download, Dir.pwd+'/public/ce_empresas_dwnld_'+date.to_s+'.csv')
	end
end
