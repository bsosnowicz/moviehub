require "open-uri"

class DocumentsController < ApplicationController
  def download_pdf
    movie = Movie.find(params[:id])
    pdf_path = Rails.root.join("tmp", "#{movie.title.parameterize}.pdf")

    image_temp_path = Rails.root.join("tmp", "movie_poster.jpg")
    File.open(image_temp_path, "wb") do |file|
      file.write URI.open(movie.image_url).read
    end

    Prawn::Document.generate(pdf_path) do |pdf|
      pdf.font "Helvetica"

      pdf.text movie.title, size: 24, style: :bold, align: :center
      pdf.move_down 10
      pdf.stroke_horizontal_rule
      pdf.move_down 20

      y_position = pdf.cursor

      pdf.bounding_box([0, y_position], width: 200) do
        pdf.image image_temp_path, width: 180, height: 270
      end

      pdf.bounding_box([220, y_position], width: 300) do
        pdf.text "Category: <b>#{movie.category}</b>", inline_format: true, size: 14
        pdf.text "Rating: <b>#{movie.rating}/10</b>", inline_format: true, size: 14
        pdf.text "Release Date: <b>#{movie.release_date}</b>", inline_format: true, size: 14
        pdf.text "Duration: <b>#{movie.length} min</b>", inline_format: true, size: 14
        pdf.text "Director: <b>#{movie.director}</b>", inline_format: true, size: 14
      end

      pdf.move_down 200
      pdf.move_down 20

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
