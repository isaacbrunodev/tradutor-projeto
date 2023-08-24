require "google/cloud/translate"

class Tradutor
    def initialize
 @translate=Google::Cloud::Translate.def new
 end
 
 def traduzir_texto(texto,idioma_origem,idioma_destino)
    traducao=@translate,translate(texto,from:idioma_origem,to: idioma_destino)
    salvar_traducao(texto,traducao.text,idioma_destino)
    traducao.text
 end
  
 def traduzir_texto(texto,idioma_origem,idioma_destino)
  traducao=@translate.translate(texto,from:idioma_origem,to:idioma_destino)
   salvar_traducao(texto,traducao.text, idioma_destino) 
   traducao.text
 end
 
 private

 def salvar_traducao(texto_original,texto_traduzido,idioma_destino)
   Time.now.strftime("%Y-%m-%d_%H-%M") + ".text"
File.open(nome_arquivo,"a")do |file|
    file.puts ("Original(#{idioma_destino}): #{texto_original}")
    file.puts("Tradução(#{idioma_destino}):#{texto_traduzido}")
    file.puts('='*30)
    end
   end
end

# Uso da classe
tradutor=Tradutor.new

puts"Digite o texto"
texto=gets.chomp

puts"Digite o idioma do texto:"
   idioma_origem=gets.chomp

puts"Digite o idioma para o qual você deseja traduzir:"
idioma_destino=gets.chomp

texto_traduzido =tradutor.traduzir_texto(texto,idioma_origem,idioma_destino)
puts "Texto Traduzido: #{texto_traduzido}"



 

