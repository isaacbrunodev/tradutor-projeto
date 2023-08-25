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

 

