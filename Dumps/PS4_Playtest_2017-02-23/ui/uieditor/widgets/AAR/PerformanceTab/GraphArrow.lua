CoD.GraphArrow = InheritFrom( LUI.UIElement )
CoD.GraphArrow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GraphArrow )
	self.id = "GraphArrow"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 193 )
	self:setTopBottom( 0, 0, 0, 49 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 66, 149 )
	Image0:setTopBottom( 0, 0, 8, 43 )
	Image0:setImage( RegisterImage( "uie_t7_mp_hud_engame_rightarrowpanel" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( 0.5, 0.5, -94, 98 )
	Text:setTopBottom( 0.5, 0.5, -16, 17 )
	Text:setRGB( 0, 0, 0 )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Text:subscribeToGlobalModel( controller, "AARSPMGraph", "avgSPM", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

