LUI.createMenu.AnchorDeployed = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "AnchorDeployed" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local AnchorDeployed = LUI.UIText.new()
	AnchorDeployed:setLeftRight( true, false, 942, 1216 )
	AnchorDeployed:setTopBottom( true, false, 466, 491 )
	AnchorDeployed:setRGB( 1, 1, 1 )
	AnchorDeployed:setText( Engine.Localize( "CP_MI_SING_BLACKSTATION_ANCHOR_DEPLOYED" ) )
	AnchorDeployed:setTTF( "fonts/default.ttf" )
	AnchorDeployed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	AnchorDeployed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AnchorDeployed )
	self.AnchorDeployed = AnchorDeployed
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

