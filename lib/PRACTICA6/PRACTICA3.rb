
class Comida                #Clase comida principal para generacion de Dieta (Plato)
    attr_reader :Por_IngDia, :Descripcion, :Porcion_reco, :Peso
    
    def initialize(por_ingdia, descripcion, porcion_reco)       #constructor
       @Por_IngDia = por_ingdia
       @Descripcion = descripcion
       @Porcion_reco = porcion_reco
    end
    

    
    def get_poringdia()                                         #devolvemos Porcion Ingerida
        @Por_IngDia
    end
    
    def get_descripcion()                                       #Descripcion del plato
        @Descripcion
    end
    
    def get_porcionrecomen()                                    #porcion recomendada
        @Porcion_reco
    end
    
    def formatear()                                             #formateo de la comida
       @Por_IngDia = nil
       @Descripcion = nil
       @Porcion_reco = nil
       @Peso = nil
    end
    
    def between(other0,other1)
       if((self.Peso>other0)&&(self.Peso<other1))
           return true
       else
           return false
       end
    end
    
    def mostrar_comida()                                        #formato de muestra comida
       print "- ", @Descripcion,", ",@Porcion_reco,", ",@Por_IngDia,"gr"
       puts
    end
end

class Dieta                                                     #clase dieta, la cual usa comida
    attr_reader :Titulo, :Platos, :VCT, :P_proteinas, :P_grasas, :P_hidratos, :Por_dieta
    include Comparable
    def initialize(titulo, vct, p_proteinas, p_grasas, p_hidratos,p_dieta)  #constructor
       @Titulo = titulo
       @Platos = Array.new()
       @VCT = vct
       @P_proteinas = p_proteinas
       @P_grasas = p_grasas
       @P_hidratos = p_hidratos
       @P_dieta = p_dieta
       @n_platos = 0
    end
    
    
    def formatear()                                             #formateo de DIETA
       @Titulo = nil
       @Platos = nil
       @VCT = nil
       @P_proteinas = nil
       @P_grasas = nil
       @P_hidratos = nil
       @P_dieta = nil
       @n_platos = 0
    end
    
    def get_pdieta()                                            #p_dieta
        @P_dieta
    end
    
    def get_size()                                              #n de platos
        @n_platos
    end
    
    def push_plato(plato)                                       #las dietas estan construidas de platos
        @Platos.push(plato)
        @n_platos = @n_platos+1
    end 
    
    def get_titulo()                                            #titulo de la dieta
        @Titulo
    end

    def get_vct()                                               #VCT
        @VCT
    end
    
    def get_pproteinas()                                        #proteinas
        @P_proteinas
    end
    
    def get_pgrasas()                                           #grasas
        @P_grasas
    end
    
    def get_phidratos()                                         #hidratos
        @P_hidratos
    end
    
    def get_platos()                                            #devolvemos platos
        iterador=0
        while(iterador < get_size())
        @Platos[iterador].mostrar_comida()
        iterador = iterador + 1
        end
    end
    def to_s()                                                  #mostrar
       print @Titulo,"(",@P_dieta,")"
       puts 
       iterador=0
        while(iterador < get_size())
        @Platos[iterador].mostrar_comida()
        iterador = iterador + 1
        end
        print "V.C.T  | %", "    ", @VCT," | ", @P_proteinas,"% - ",@P_grasas,"% - ",@P_hidratos,"%"
        puts
    end
    
    
    def mostrar_dieta()                                         #mismo mostrar pero en funcion
       print @Titulo,"(",@P_dieta,")"
       puts 
       iterador=0
        while(iterador < get_size())
        @Platos[iterador].mostrar_comida()
        iterador = iterador + 1
        end
        print "V.C.T  | %", "    ", @VCT," | ", @P_proteinas,"% - ",@P_grasas,"% - ",@P_hidratos,"%"
        puts
    end
end


    class Por_Edad < Dieta                                      #hijo de la clase Dieta
        attr_reader :edades
        include Comparable
        def initialize(titulo, vct, p_proteinas, p_grasas, p_hidratos,p_dieta, dieta_edad)  #cons. hijo
            super(titulo, vct, p_proteinas, p_grasas, p_hidratos,p_dieta)   #llamamos al cons. padre
            @edades = dieta_edad
        end
        
        def mostrar_dieta_edad()                                            #mostramos
            puts @edades
            self.mostrar_dieta()
        end
    end
    
    class Por_Alimentos < Dieta                                     #hijo de la clase Dieta
        attr_reader :alimentos
        include Comparable
        def initialize(titulo, vct, p_proteinas, p_grasas, p_hidratos,p_dieta, dieta_alimentos) #cons. hijo
            super(titulo, vct, p_proteinas, p_grasas, p_hidratos,p_dieta)       #llamamos al cons. padre
            @alimentos = dieta_alimentos
        end
        
        def mostrar_dieta_alim()                                            #mostramos
            puts @alimentos
            self.mostrar_dieta()
        end
    end

    #@comida1 = Comida.new("200","Macarrones con salsa de tomate y queso parmesano","1 1/2 cucharón")
    #@comida2 = Comida.new("100","Escalope de ternera","1 bistec mediano")
    #@comida3 = Comida.new("120","Ensalada basica con zanahoria rallada","guarnicion")
    #@comida4 = Comida.new("180","Mandarina","1 grande")
    #@comida5 = Comida.new("20","Pan de trigo integral","1 rodaja")
    #@dieta1 = Dieta.new("Almuerzo",786.9,19,34,47,"30 - 35%")
    #    @dieta1.push_plato(@comida1)
    #    @dieta1.push_plato(@comida2)
    #    @dieta1.push_plato(@comida3)
    #    @dieta1.push_plato(@comida4)
    #    @dieta1.push_plato(@comida5)
    #        @dieta1.mostrar_dieta()
    
    #@comida1 = Comida.new("200","Macarrones con salsa de tomate y queso parmesano","1 1/2 cucharón")
    #@comida2 = Comida.new("100","Escalope de ternera","1 bistec mediano")
    #@comida3 = Comida.new("120","Ensalada basica con zanahoria rallada","guarnicion")
    #@comida4 = Comida.new("180","Mandarina","1 grande")
    #@comida5 = Comida.new("20","Pan de trigo integral","1 rodaja")
    #@dieta_edad1 = Por_Edad.new("Almuerzo",786.9,19,34,47,"30 - 35%","De 4 a 6 años")
    #    @dieta_edad1.push_plato(@comida1)
    #    @dieta_edad1.push_plato(@comida2)
    #    @dieta_edad1.push_plato(@comida3)
    #    @dieta_edad1.push_plato(@comida4)
    #    @dieta_edad1.push_plato(@comida5)
    #        @dieta_edad1.mostrar_dieta_edad()