require "open-uri"

class DocumentsController < ApplicationController
  def download_pdf
    movie = Movie.find(params[:id])
    pdf_path = Rails.root.join("tmp", "#{movie.title.parameterize}.pdf")

    image_temp_path = Rails.root.join("tmp", "movie_poster.jpg")
    File.open(image_temp_path, "wb") do |file|
      file.write URI.open(movie.image_url).read
    end

    Prawn::Document.generate(pdf_path,) do |pdf|
      pdf.font "Helvetica"
      
      pdf.fill_color "00081A"
      pdf.fill_rectangle [-pdf.bounds.absolute_left, pdf.bounds.top + 50], 
                         pdf.bounds.absolute_right * 2, 
                         pdf.bounds.height + 100

      pdf.fill_color "EFEFEF"
      
      pdf.text movie.title, size: 24, style: :bold, align: :center
      pdf.move_down 20

      y_position = pdf.cursor

      pdf.bounding_box([0, y_position], width: 200) do
        pdf.image image_temp_path, width: 240, height: 320
      end

      pdf.bounding_box([280, y_position], width: 300) do
        pdf.text "Category: #{movie.category}", inline_format: true, size: 14
        pdf.move_down 8
        pdf.text "Rating: #{movie.rating}/10", inline_format: true, size: 14
        pdf.move_down 8
        pdf.text "Release Date: #{movie.release_date}", inline_format: true, size: 14
        pdf.move_down 8
        pdf.text "Duration: #{movie.length} min", inline_format: true, size: 14
        pdf.move_down 8
        pdf.text "Director: #{movie.director}", inline_format: true, size: 14
      end

      pdf.move_down 260

      pdf.text "Description:", size: 16, style: :bold
      pdf.text movie.description, size: 12, align: :justify
    end

    send_file pdf_path,
      filename: "#{movie.title}.pdf",
      type: "application/pdf",
      disposition: "attachment"
  ensure
    File.delete(image_temp_path) if File.exist?(image_temp_path)
  end
end
