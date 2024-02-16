require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.CPDifficultyImagePreview = InheritFrom( LUI.UIElement )
CoD.CPDifficultyImagePreview.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPDifficultyImagePreview )
	self.id = "CPDifficultyImagePreview"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 505 )
	self:setTopBottom( true, false, 0, 400 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	BoxButtonLrgInactiveStroke:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local PreviewImage = LUI.UIImage.new()
	PreviewImage:setLeftRight( false, false, -177.24, 177.24 )
	PreviewImage:setTopBottom( true, false, 18.6, 381.4 )
	PreviewImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PreviewImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PreviewImage )
	self.PreviewImage = PreviewImage
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveStroke:close()
		self.PreviewImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

