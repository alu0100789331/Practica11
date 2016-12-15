
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


class DSL_dieta
    def initialize(&block)
        @Titulo
        @Platos = Array.new()       #Para guardar las Comidas
        @VCT
        @P_proteinas
        @P_grasas
        @P_hidratos
        @Por_dieta = []             #Dado que ahora se quiere un intervalo
        
        @n_platos=0
        
        @edades                     #Para la clase edades
        @alimentos                  #Para la clase alimentos
        
        if block_given?
            if block.arity == 1
                yield self
            else
                instance_eval(&block)
            end
        end
    end
    
    def mostrar_dieta()                                         #mismo mostrar pero en funcion
       print @Titulo,"(",@P_dieta,")"
       puts 
       iterador=0
        while(iterador < get_n_platos())
        @Platos[iterador].mostrar_comida()
        iterador = iterador + 1
        end
        print "V.C.T  | %", "    ", @VCT," | ", @P_proteinas,"% - ",@P_grasas,"% - ",@P_hidratos,"%"
        puts
    end
    
    def get_por_dieta_min()
        @Por_dieta[0]
    end
    
    def get_por_dieta_max()
        @Por_dieta[1]
    end
    
    def get_Platos_descrip(numero)
        if(numero > @n_platos)
            puts "ERROR"
        else
        @Platos[numero].get_descripcion()
        end
    end
    
    def get_Platos_porcion(numero)
        if(numero > @n_platos)
            puts "ERROR"
        else
        @Platos[numero].get_porcionrecomen()
        end
    end
    
    def get_Platos_peso(numero)
        if(numero > @n_platos)
            puts "ERROR"
        else
        @Platos[numero].get_poringdia()
        end
    end
    
    def get_titulo()
        @Titulo
    end
    
    def get_VCT()
        @VCT
    end
    
    def get_P_proteinas()
        @P_proteinas
    end
    
    def get_P_grasas()
        @P_grasas
    end
    
    def get_P_hidratos()
        @P_hidratos
    end
    
    def get_n_platos()
        @n_platos
    end
    
    def get_edad()
        @edades
    end
    
    def get_alimentos()
        @alimentos
    end
    
    def push_plato(plato)                                       #las dietas estan construidas de platos
        @Platos.push(plato)
        @n_platos = @n_platos + 1
    end 
    
    def titulo (titulo, opciones = {})
        @Titulo = titulo
        @edades = "#{opciones[:edades]}" if opciones[:edades]
        @alimentos = "#{opciones[:alimentos]}" if opciones[:alimentos]
    end
    
    def por_dieta(opciones = {})
       @Por_dieta[0] = "#{opciones[:min]}" if opciones[:min]
       @Por_dieta[1] = "#{opciones[:max]}" if opciones[:max]
    end
    
    def comida(opciones = {})
        test2 = "#{opciones[:descripcion_]}" if opciones[:descripcion_]
        test1 = "#{opciones[:porcion_reco_]}" if opciones[:porcion_reco_]
        test3 = "#{opciones[:peso_]}" if opciones[:peso_]
        prueba = Comida.new(test3,test2,test1)
        push_plato(prueba)
    end
    
    def resto(opciones = {})
        @VCT =  "#{opciones[:VCT]}" if opciones[:VCT]
        @P_proteinas = "#{opciones[:p_proteinas]}" if opciones[:p_proteinas]
        @P_grasas = "#{opciones[:p_grasas]}" if opciones[:p_grasas]
        @P_hidratos = "#{opciones[:p_hidratos]}" if opciones[:p_hidratos]
    end
    
end

