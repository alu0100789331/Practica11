require "spec_helper"

describe "Practica6" do
    before(:all) do
       @Lista = Lista_Doblemente_Enlazada.new() 
       
        @new_dieta_dsl = DSL_dieta.new do
            titulo "Almuerzo"
            por_dieta :min => 30, :max => 40
            comida :descripcion_ => "Macarrones con salsa de tomate y queso parmesano",
                   :porcion_reco_ => "1 1/2 cucharon",
                   :peso_ => 200
            comida :descripcion_ => "Escalope con ternera",
                   :porcion_reco_ => "1 bistec mediano",
                   :peso_ => 200
            resto  :VCT =>785.9,
                   :p_proteinas => 19 ,
                   :p_grasas => 34,
                   :p_hidratos => 47
        end
        
        @dieta_dsl_edades = DSL_dieta.new do
            titulo "Almuerzo", :edades => "12 a 14 años"
            por_dieta :min => 30, :max => 40
            comida :descripcion_ => "Macarrones con salsa de tomate y queso parmesano",
                   :porcion_reco_ => "1 1/2 cucharon",
                   :peso_ => 200
            comida :descripcion_ => "Escalope con ternera",
                   :porcion_reco_ => "1 bistec mediano",
                   :peso_ => 200
            resto  :VCT =>785.9,
                   :p_proteinas => 19 ,
                   :p_grasas => 34,
                   :p_hidratos => 47
        end
        
        @dieta_dsl_alimentos = DSL_dieta.new do
            titulo "Almuerzo", :alimentos => "vegetariano"
            por_dieta :min => 30, :max => 40
            comida :descripcion_ => "Macarrones con salsa de tomate y queso parmesano",
                   :porcion_reco_ => "1 1/2 cucharon",
                   :peso_ => 200
            comida :descripcion_ => "Escalope con ternera",
                   :porcion_reco_ => "1 bistec mediano",
                   :peso_ => 200
            resto  :VCT =>785.9,
                   :p_proteinas => 19 ,
                   :p_grasas => 34,
                   :p_hidratos => 47
        end
        
    end


    describe "DLS" do
        
        it "Debe de tener titulo" do
            expect(@new_dieta_dsl.get_titulo()).to eq("Almuerzo")
        end
        
        it "Debe de tener Porcentaje de dieta minima" do
            expect(@new_dieta_dsl.get_por_dieta_min()).to eq("30")
        end
        
        it "Debe de tener Porcentaje de dieta maximo" do
           expect(@new_dieta_dsl.get_por_dieta_max()).to eq("40") 
        end
        
        it "COMIDA -> Debe tener un n de Comidas" do
            expect(@new_dieta_dsl.get_n_platos()).to eq(2)
           # expect(@new_dieta_dsl.@Platos[0]).to eq("Macarrones con salsa de tomate y queso parmesano")
        end
        
        it "COMIDA -> Debe tener una descripcion" do
           expect(@new_dieta_dsl.get_Platos_descrip(0)).to eq("Macarrones con salsa de tomate y queso parmesano") 
        end
        
        it "COMIDA -> Debe tener una porcion recomendada" do
            expect(@new_dieta_dsl.get_Platos_porcion(0)).to eq("1 1/2 cucharon") 
        end
        
        it "COMIDA -> Debe tener un peso o cantidad recomendada" do
            expect(@new_dieta_dsl.get_Platos_peso(0)).to eq("200") 
        end
        
        it "Se imprime correctamente" do
           @new_dieta_dsl.mostrar_dieta() 
        end
    end
end