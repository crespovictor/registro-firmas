class SeccionesController < ApplicationController
	def index
		secciones = Seccion.all
	end

end
