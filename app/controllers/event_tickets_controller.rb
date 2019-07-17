class EventTicketsController < ApplicationController

  def show
    @event_ticket = EventTicket.last
    @code = @event_ticket.code
    @qrcode = RQRCode::QRCode.new(@code)

    # NOTE: showing with default options specified explicitly
    @svg = @qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6
    )
  end

end
