require( "ui.uieditor.widgets.GenericPopups.Generic_Frame_Pop_up" )

CoD.DescriptionBacking_CAC = InheritFrom( LUI.UIElement )
CoD.DescriptionBacking_CAC.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DescriptionBacking_CAC )
	self.id = "DescriptionBacking_CAC"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( 0, 0, 0, 900 )
	self:setTopBottom( 0, 0, 0, 417 )
	
	local descriptionBacking = LUI.UIImage.new()
	descriptionBacking:setLeftRight( 0, 1, 0, 0 )
	descriptionBacking:setTopBottom( 0, 1, 0, 0 )
	descriptionBacking:setRGB( 0.59, 0.59, 0.59 )
	descriptionBacking:setAlpha( 0.62 )
	descriptionBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( descriptionBacking )
	self.descriptionBacking = descriptionBacking
	
	local Black = LUI.UIImage.new()
	Black:setLeftRight( 0, 1, 0, 0 )
	Black:setTopBottom( 0, 1, 0, 0 )
	Black:setRGB( 0, 0, 0 )
	Black:setAlpha( 0.8 )
	self:addElement( Black )
	self.Black = Black
	
	local GenericFramePopup0 = CoD.Generic_Frame_Pop_up.new( menu, controller )
	GenericFramePopup0:setLeftRight( 0, 1, 0, 0 )
	GenericFramePopup0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( GenericFramePopup0 )
	self.GenericFramePopup0 = GenericFramePopup0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GenericFramePopup0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

