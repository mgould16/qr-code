class EventTicketsController < ApplicationController

  def index
  end

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

  def new
    @event_ticket = EventTicket.new
  end

  def create
    @event_ticket = EventTicket.new(ticket_params)
    @event_ticket.save
    redirect_to root_path
  end

  private

  def ticket_params
    params.require(:event_ticket).permit(:event_name)
  end

end
