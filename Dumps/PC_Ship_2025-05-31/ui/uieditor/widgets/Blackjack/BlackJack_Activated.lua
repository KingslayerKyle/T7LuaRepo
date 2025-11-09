CoD.BlackJack_Activated = InheritFrom( LUI.UIElement )
CoD.BlackJack_Activated.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackJack_Activated )
	self.id = "BlackJack_Activated"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 235 )
	self:setTopBottom( true, false, 0, 47 )
	
	local ActivatedBacker = LUI.UIImage.new()
	ActivatedBacker:setLeftRight( true, false, 0, 235 )
	ActivatedBacker:setTopBottom( true, false, 0, 47 )
	ActivatedBacker:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_activited" ) )
	self:addElement( ActivatedBacker )
	self.ActivatedBacker = ActivatedBacker
	
	local timeRemaining = LUI.UIText.new()
	timeRemaining:setLeftRight( true, false, 32.37, 207.73 )
	timeRemaining:setTopBottom( true, false, 25, 41 )
	timeRemaining:setTTF( "fonts/default.ttf" )
	timeRemaining:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	timeRemaining:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	timeRemaining:linkToElementModel( self, "activeTimeRemaining", true, function ( model )
		local activeTimeRemaining = Engine.GetModelValue( model )
		if activeTimeRemaining then
			timeRemaining:setText( LocalizeIntoString( "MPUI_BM_CONTRACTS_TIME_REMAINING", NumberAsTimeNoMS( activeTimeRemaining ) ) )
		end
	end )
	self:addElement( timeRemaining )
	self.timeRemaining = timeRemaining
	
	local Activited = LUI.UIText.new()
	Activited:setLeftRight( true, false, 32.37, 213.5 )
	Activited:setTopBottom( true, false, 7, 27 )
	Activited:setRGB( 0.95, 0.55, 0.15 )
	Activited:setText( Engine.Localize( "MENU_ACTIVATED_CAPS" ) )
	Activited:setTTF( "fonts/default.ttf" )
	Activited:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Activited:setShaderVector( 0, 0.06, 0, 0, 0 )
	Activited:setShaderVector( 1, 0.03, 0, 0, 0 )
	Activited:setShaderVector( 2, 1, 0, 0, 0 )
	Activited:setLetterSpacing( 0 )
	Activited:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Activited:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Activited )
	self.Activited = Activited
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.timeRemaining:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

