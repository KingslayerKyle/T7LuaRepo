CoD.heroPreviewPane = InheritFrom( LUI.UIElement )
CoD.heroPreviewPane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroPreviewPane )
	self.id = "heroPreviewPane"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 471 )
	
	local headerName = LUI.UITightText.new()
	headerName:setLeftRight( true, false, 0, 62 )
	headerName:setTopBottom( true, false, 0, 34 )
	headerName:setRGB( 1, 1, 1 )
	headerName:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	headerName:linkToElementModel( self, "headerName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			headerName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( headerName )
	self.headerName = headerName
	
	local currentlyEquipped = LUI.UITightText.new()
	currentlyEquipped:setLeftRight( true, false, 0, 45 )
	currentlyEquipped:setTopBottom( true, false, 34, 59 )
	currentlyEquipped:setRGB( 1, 1, 1 )
	currentlyEquipped:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	currentlyEquipped:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			currentlyEquipped:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( currentlyEquipped )
	self.currentlyEquipped = currentlyEquipped
	
	self.close = function ( self )
		self.headerName:close()
		self.currentlyEquipped:close()
		CoD.heroPreviewPane.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

