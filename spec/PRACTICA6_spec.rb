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
            comida :descripcion_ => "Escalope con ternera (de tofu)",
                   :porcion_reco_ => "1 bistec mediano",
                   :peso_ => 200
            resto  :VCT =>785.9,
                   :p_proteinas => 19 ,
                   :p_grasas => 34,
                   :p_hidratos => 47
        end
        
    end


    describe "DLS" do
        describe "Titulo & Porcentajes" do
        it "Debe de tener titulo" do
            expect(@new_dieta_dsl.get_titulo()).to eq("Almuerzo")
        end
        
        it "Debe de tener Porcentaje de dieta minima" do
            expect(@new_dieta_dsl.get_por_dieta_min()).to eq("30")
        end
        
        it "Debe de tener Porcentaje de dieta maximo" do
           expect(@new_dieta_dsl.get_por_dieta_max()).to eq("40") 
        end
    end
    describe "COMIDAS" do
        
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
    end
    describe "RESTO DE INFORMACION (Porcentajes & VCT)" do
        it "Debe de tener un VCT" do
            expect(@new_dieta_dsl.get_VCT()).to eq("785.9")
        end
        
        it "Debe de tener un Porcentaje de proteinas" do
           expect(@new_dieta_dsl.get_P_proteinas()).to eq("19") 
        end
        
        it "Debe de tener un Porcentaje de grasas" do
           expect(@new_dieta_dsl.get_P_grasas()).to eq("34") 
        end
        
        it "Debe de tener un Porcentaje de hidratos" do
           expect(@new_dieta_dsl.get_P_hidratos()).to eq("47") 
        end
    end
    describe "DIETAS ESPECIALES (Por grupos/Por alimentos)" do
        it "DIETA EDADES -> Debe de tener un argumento edades" do
            expect(@dieta_dsl_edades.get_grupos_edades()).to eq("12 a 14 años")
        end
        
        it "DIETA ALIMENTOS -> Debe de tener un argumento alimentos" do
            expect(@dieta_dsl_alimentos.get_grupos_alimentos()).to eq("vegetariano")
        end
    end
    describe "IMPRESION" do 
        it "Se imprime correctamente" do
            puts
           @new_dieta_dsl.mostrar_dieta() 
        end
    end
    end
end