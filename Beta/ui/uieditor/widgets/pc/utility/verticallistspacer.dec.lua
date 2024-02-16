CoD.VerticalListSpacer = InheritFrom( LUI.UIElement )
CoD.VerticalListSpacer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VerticalListSpacer )
	self.id = "VerticalListSpacer"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 34 )
	self:linkToElementModel( "height", true, function ( model )
		local element = self
		SetVerticaListSpacerHeight( self, model )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

