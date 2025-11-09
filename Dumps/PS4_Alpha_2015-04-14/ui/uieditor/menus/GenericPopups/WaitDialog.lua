require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )

local PostLoadFunc = function ( self, controller )
	self.setMessage = function ( message )
		self.waitMessage:setText( Engine.Localize( message ) )
	end
	
end

LUI.createMenu.WaitDialog = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "WaitDialog" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local WaitSpinner = CoD.DialogSpinner.new( self, controller )
	WaitSpinner:setLeftRight( true, false, 1178, 1216 )
	WaitSpinner:setTopBottom( true, false, 646, 684 )
	WaitSpinner:setRGB( 1, 1, 1 )
	self:addElement( WaitSpinner )
	self.WaitSpinner = WaitSpinner
	
	local waitMessage = LUI.UIText.new()
	waitMessage:setLeftRight( true, true, 912.5, -109 )
	waitMessage:setTopBottom( false, false, 297, 313 )
	waitMessage:setRGB( 1, 1, 1 )
	waitMessage:setAlpha( 0.9 )
	waitMessage:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
	waitMessage:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	waitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	waitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( waitMessage )
	self.waitMessage = waitMessage
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.WaitSpinner:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

