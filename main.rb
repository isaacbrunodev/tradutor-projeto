require 'yandex-translator'

class Tradutor
  def initialize
    @translator = Yandex::Translator.new('YANDEX_API_KEY')
  end

  def traduzir_texto(texto, idioma_origem, idioma_destino)
    traducao = @translator.translate(texto, from: idioma_origem, to: idioma_destino)
    salvar_traducao(texto, traducao, idioma_destino)
    traducao
  end

  private

  def salvar_traducao(texto_original, texto_traduzido, idioma_destino)
    nome_arquivo = Time.now.strftime("%Y-%m-%d_%H-%M") + ".txt"
    File.open(nome_arquivo, "a") do |file|
      file.puts("Original (#{idioma_destino}): #{texto_original}")
      file.puts("Tradução (#{idioma_destino}): #{texto_traduzido}")
      file.puts("=" * 30)
    end
  end
end

# Uso da classe
tradutor = Tradutor.new

puts "Digite o texto:"
texto = gets.chomp

puts "Digite o idioma do texto:"
idioma_origem = gets.chomp

puts "Digite o idioma para o qual você deseja traduzir:"
idioma_destino = gets.chomp

texto_traduzido = tradutor.traduzir_texto(texto, idioma_origem, idioma_destino)
puts "Texto Traduzido: #{texto_traduzido}"
