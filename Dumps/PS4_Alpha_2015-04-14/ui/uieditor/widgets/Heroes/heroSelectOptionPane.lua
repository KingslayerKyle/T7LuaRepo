CoD.heroSelectOptionPane = InheritFrom( LUI.UIElement )
CoD.heroSelectOptionPane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroSelectOptionPane )
	self.id = "heroSelectOptionPane"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 471 )
	
	local headerName = LUI.UITightText.new()
	headerName:setLeftRight( true, false, 0, 63 )
	headerName:setTopBottom( true, false, 0, 34 )
	headerName:setRGB( 1, 1, 1 )
	headerName:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	headerName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			headerName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( headerName )
	self.headerName = headerName
	
	self.close = function ( self )
		self.headerName:close()
		CoD.heroSelectOptionPane.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

