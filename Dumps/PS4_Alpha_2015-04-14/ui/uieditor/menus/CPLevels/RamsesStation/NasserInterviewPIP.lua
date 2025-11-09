require( "ui.uieditor.widgets.CPLevels.RamsesStation.NasserInterviewWidget" )

LUI.createMenu.NasserInterviewPIP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "NasserInterviewPIP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local NasserInterviewWidget = CoD.NasserInterviewWidget.new( self, controller )
	NasserInterviewWidget:setLeftRight( true, false, 800, 1203 )
	NasserInterviewWidget:setTopBottom( true, false, 48, 272 )
	NasserInterviewWidget:setRGB( 1, 1, 1 )
	self:addElement( NasserInterviewWidget )
	self.NasserInterviewWidget = NasserInterviewWidget
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.NasserInterviewWidget:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

