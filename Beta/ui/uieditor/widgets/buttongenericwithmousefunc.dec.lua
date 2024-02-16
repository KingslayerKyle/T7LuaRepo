require( "ui.uieditor.widgets.Border" )

CoD.ButtonGenericWithMouseFunc = InheritFrom( LUI.UIElement )
CoD.ButtonGenericWithMouseFunc.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ButtonGenericWithMouseFunc )
	self.id = "ButtonGenericWithMouseFunc"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local ButtonIcon = LUI.UIImage.new()
	ButtonIcon:setLeftRight( true, true, 0, 0 )
	ButtonIcon:setTopBottom( true, true, 0, 0 )
	ButtonIcon:setImage( RegisterImage( "uie_headicon_dead" ) )
	self:addElement( ButtonIcon )
	self.ButtonIcon = ButtonIcon
	
	local BorderOver = CoD.Border.new( menu, controller )
	BorderOver:setLeftRight( true, true, 0, 0 )
	BorderOver:setTopBottom( true, true, 0, 0 )
	BorderOver:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	self:addElement( BorderOver )
	self.BorderOver = BorderOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BorderOver:completeAnimation()
				self.BorderOver:setAlpha( 0 )
				self.clipFinished( BorderOver, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				BorderOver:completeAnimation()
				self.BorderOver:setAlpha( 1 )
				self.clipFinished( BorderOver, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderOver:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

