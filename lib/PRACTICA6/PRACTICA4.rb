Node = Struct.new(:Data_, :Next_, :Prev_)   #Nuestro nodo

class Lista_Doblemente_Enlazada                             #lista enlazada
    attr_reader :Size_, :Head_, :Tail_
    include Enumerable
    
    def initialize()                                        #constructor
       @Size_ = 0
       @Head_ = nil
       @Tail_ = nil
    end
    
    def each                                                #func. necesaria para recorrer con el Enumerable
        return nil if @Head_.nil?
        entry = @Head_
        until entry.nil?
            yield entry
            entry = entry.Next_
        end
    end
    
    def push_start(data)                                     #push start
        if(@Size_==0)
            @Tail_ = data
            data.Next_ = nil
        else
            @Head_.Prev_ = data
            data.Next_ = @Head_
        end
            @Head_ = data
            data.Prev_ = nil
            @Size_ = @Size_ + 1
    end
    
    def push_end(data)                                      #push end
       if(@Size_==0)
            @Head_ = data
            data.Prev_ = nil
       else
           @Tail_.Next_=data
           data.Prev_=@Tail_
       end
           @Tail_ = data
           data.Next_ = nil
           @Size_ = @Size_ + 1
    end
    
    def pop_start()                                         #pop start
       if(@Size_==0)
           puts "La Lista_Doblemente_Enlazada esta vacia"
       else
           aux = @Head_
           (@Head_.Next_).Prev_ = nil
           @Head_ = @Head_.Next_
           @Size_=@Size_ - 1
           return aux
       end
    end
    
    def reverse()                                           #reverse de los nodos de una lista
        new_list = Lista_Doblemente_Enlazada.new()
        self.each {|entry| new_list.push_start(Node.new(entry.Data_,nil,nil))}
        return new_list
    end
    
    def pop_end()                                           #pop end
        if(@Size_==0)
            
        else
           aux = @Tail_
           (@Tail_.Prev_).Next_ = nil
           @Tail_ = @Tail_.Prev_
           @Size_ = @Size_ - 1
           return aux
        end
    end
    
    def mostrar()                                           #mostrar
       if(@Size_==0)
           puts "La Lista_Doblemente_Enlazada esta vacia"
       else
           aux = @Head_
           while(aux!=nil)
           puts aux.Data_
           aux = aux.Next_
           end
       end
    end
    
    def get_size()                                          #devolvemos size
        @Size_
    end
    
    def between(other0,other1)
       if((self.Peso>other0.Peso)&&(self.Peso<other1.Peso))
           return true
       else
           return false
       end
    end
    
    
    
end
#@listita = Lista_Doblemente_Enlazada.new()
#@nodo_prueba1 = Node.new(1,nil,nil)
#@nodo_prueba2 = Node.new(2,nil,nil)
#@nodo_prueba3 = Node.new(3,nil,nil)
#@nodo_prueba4 = Node.new(4,nil,nil)
#@listita.push_start(@nodo_prueba2)
#@listita.push_start(@nodo_prueba1)
#@listita.mostrar()
#puts

#aux = @listita.reverse()
#aux.mostrar()
#puts

#@listita.push_end(@nodo_prueba3)
#@listita.mostrar()
#puts

#@listita.push_end(@nodo_prueba4)
#@listita.mostrar()

#puts
#auxi = @listita.pop_end
#print auxi.Data_
#@listita.mostrar()