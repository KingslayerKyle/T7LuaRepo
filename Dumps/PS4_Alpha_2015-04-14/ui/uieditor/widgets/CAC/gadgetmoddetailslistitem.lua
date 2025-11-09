CoD.GadgetModDetailsListItem = InheritFrom( LUI.UIElement )
CoD.GadgetModDetailsListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GadgetModDetailsListItem )
	self.id = "GadgetModDetailsListItem"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 65 )
	
	local modIcon = LUI.UIImage.new()
	modIcon:setLeftRight( true, false, 0, 40 )
	modIcon:setTopBottom( true, false, 3, 43 )
	modIcon:setRGB( 0.95, 0.65, 0.13 )
	modIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( modIcon )
	self.modIcon = modIcon
	
	local modName = LUI.UITightText.new()
	modName:setLeftRight( true, false, 50, 134 )
	modName:setTopBottom( true, false, 0, 25 )
	modName:setRGB( 1, 1, 1 )
	modName:setTTF( "fonts/default.ttf" )
	self:addElement( modName )
	self.modName = modName
	
	local modDescription = LUI.UIText.new()
	modDescription:setLeftRight( true, true, 50, 0 )
	modDescription:setTopBottom( true, false, 26, 46 )
	modDescription:setRGB( 0.4, 0.44, 0.52 )
	modDescription:setTTF( "fonts/default.ttf" )
	modDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	modDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( modDescription )
	self.modDescription = modDescription
	
	self.modIcon:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			modIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.modName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			modName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.modDescription:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			modDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.close = function ( self )
		self.modIcon:close()
		self.modName:close()
		self.modDescription:close()
		CoD.GadgetModDetailsListItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

