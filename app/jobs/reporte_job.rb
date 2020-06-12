class ReporteJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Adicional para que demore um pouco o Job
    sleep 8

    # verfica se o diretorio reports existe
    Dir.mkdir "#{Rails.root.join('public')}/reports" unless File.directory?("#{Rails.root.join('public')}/reports")
    
    # gerando um nome unico para o relatório
    code = (0...8).map { rand(65..90).chr }.join

    # path do arquivo
    out_file = File.new("#{Rails.root.join('public')}/reports/report#{code}.html", 'w')
    
    # gerando o arquivo
    out_file.puts("<p>Your Report Here - code: <b>#{code}</b></p>")
    out_file.puts('<hr>')
    out_file.puts("e-Book: Guia de Gems OneBitCode - <a href='https://onebitcode.com/guia-onebitcode-de-gems/'>Baixar Agora :)</a>")
    out_file.close
  end
end
