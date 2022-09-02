-- 299331d1e5ee4db7340c8bda4ad5565b
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 129 )
	self:setTopBottom( true, false, 0, 33 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 43.72, 99 )
	Image0:setTopBottom( true, false, 5, 28.44 )
	Image0:setImage( RegisterImage( "uie_t7_mp_hud_engame_rightarrowpanel" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( false, false, -63, 65 )
	Text:setTopBottom( false, false, -10.5, 11.5 )
	Text:setRGB( 0, 0, 0 )
	Text:setTTF( "fonts/escom.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Text:subscribeToGlobalModel( controller, "AARSPMGraph", "avgSPM", function ( model )
		local avgSPM = Engine.GetModelValue( model )
		if avgSPM then
			Text:setText( Engine.Localize( avgSPM ) )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

