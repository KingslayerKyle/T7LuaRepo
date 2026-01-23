require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.MissionRecordVault_FrameBG = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_FrameBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_FrameBG )
	self.id = "MissionRecordVault_FrameBG"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 587 )
	self:setTopBottom( true, false, 0, 281 )
	self.anyChildUsesUpdateState = true
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 0, 0 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "previewImage", function ( model )
		local previewImage = Engine.GetModelValue( model )
		if previewImage then
			Image:setImage( RegisterImage( previewImage ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local BoxButtonLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	BoxButtonLrgInactiveStroke:setLeftRight( true, false, -2, 589 )
	BoxButtonLrgInactiveStroke:setTopBottom( true, false, -2, 283 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveStroke:close()
		element.Image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

