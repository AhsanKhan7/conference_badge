class BadgePdfGenerator
  def initialize(attendee)
    @attendee = attendee
  end

  def render
    Prawn::Document.new(page_size: "A7") do |pdf|
      pdf.text @attendee.full_name, size: 18, style: :bold, align: :center
      pdf.move_down 10

      pdf.text @attendee.company.to_s, align: :center
      pdf.text @attendee.role.to_s, align: :center
      pdf.move_down 20

      qr = RQRCode::QRCode.new(
        Rails.application.routes.url_helpers.checkin_url(
          @attendee.token,
          host: "localhost:3000"
        )
      )

      png = qr.as_png(size: 200)

      io = StringIO.new(png.to_s)
      pdf.image io, width: 100, position: :center
    end.render
  end
end
