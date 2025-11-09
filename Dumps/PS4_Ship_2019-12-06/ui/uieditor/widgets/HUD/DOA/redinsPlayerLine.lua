CoD.redinsPlayerLine = InheritFrom( LUI.UIElement )
CoD.redinsPlayerLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.redinsPlayerLine )
	self.id = "redinsPlayerLine"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 31 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 40.78, 325 )
	Image1:setTopBottom( true, false, 7.45, 23.55 )
	Image1:setRGB( 0, 0, 0 )
	Image1:setAlpha( 0.25 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 222.78, 247 )
	Image10:setTopBottom( true, false, 7.45, 23.55 )
	Image10:setRGB( ColorSet.CodCasterFactionAllies.r, ColorSet.CodCasterFactionAllies.g, ColorSet.CodCasterFactionAllies.b )
	Image10:setAlpha( 0.2 )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 274.62, 298.84 )
	Image4:setTopBottom( true, false, 7.45, 23.55 )
	Image4:setRGB( 0, 0.32, 0.34 )
	Image4:setAlpha( 0.2 )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local namebox0 = LUI.UITightText.new()
	namebox0:setLeftRight( true, false, 46, 165 )
	namebox0:setTopBottom( true, false, 4.86, 24.86 )
	namebox0:setTTF( "fonts/default.ttf" )
	namebox0:linkToElementModel( self, "gpr_rgb", true, function ( model )
		local gprRgb = Engine.GetModelValue( model )
		if gprRgb then
			namebox0:setRGB( gprRgb )
		end
	end )
	namebox0:linkToElementModel( self, "generic_txt", true, function ( model )
		local genericTxt = Engine.GetModelValue( model )
		if genericTxt then
			namebox0:setText( Engine.Localize( genericTxt ) )
		end
	end )
	self:addElement( namebox0 )
	self.namebox0 = namebox0
	
	local lapsbox0 = LUI.UIText.new()
	lapsbox0:setLeftRight( true, false, 224, 247 )
	lapsbox0:setTopBottom( true, false, 4.86, 24.86 )
	lapsbox0:setTTF( "fonts/default.ttf" )
	lapsbox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lapsbox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lapsbox0:linkToElementModel( self, "bombs", true, function ( model )
		local bombs = Engine.GetModelValue( model )
		if bombs then
			lapsbox0:setText( Engine.Localize( bombs ) )
		end
	end )
	self:addElement( lapsbox0 )
	self.lapsbox0 = lapsbox0
	
	local nitrobox0 = LUI.UIText.new()
	nitrobox0:setLeftRight( true, false, 250, 274 )
	nitrobox0:setTopBottom( true, false, 4.86, 24.86 )
	nitrobox0:setAlpha( 0.9 )
	nitrobox0:setTTF( "fonts/default.ttf" )
	nitrobox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	nitrobox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	nitrobox0:linkToElementModel( self, "boosts", true, function ( model )
		local boosts = Engine.GetModelValue( model )
		if boosts then
			nitrobox0:setText( Engine.Localize( boosts ) )
		end
	end )
	self:addElement( nitrobox0 )
	self.nitrobox0 = nitrobox0
	
	local zombiesbox0 = LUI.UIText.new()
	zombiesbox0:setLeftRight( true, false, 276.5, 295.5 )
	zombiesbox0:setTopBottom( true, false, 4.86, 24.86 )
	zombiesbox0:setTTF( "fonts/default.ttf" )
	zombiesbox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	zombiesbox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	zombiesbox0:linkToElementModel( self, "gpr", true, function ( model )
		local gpr = Engine.GetModelValue( model )
		if gpr then
			zombiesbox0:setText( Engine.Localize( gpr ) )
		end
	end )
	self:addElement( zombiesbox0 )
	self.zombiesbox0 = zombiesbox0
	
	local gembox0 = LUI.UIText.new()
	gembox0:setLeftRight( true, false, 301, 320 )
	gembox0:setTopBottom( true, false, 4.86, 24.86 )
	gembox0:setAlpha( 0.9 )
	gembox0:setTTF( "fonts/default.ttf" )
	gembox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	gembox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	gembox0:linkToElementModel( self, "gpr2", true, function ( model )
		local gpr2 = Engine.GetModelValue( model )
		if gpr2 then
			gembox0:setText( Engine.Localize( gpr2 ) )
		end
	end )
	self:addElement( gembox0 )
	self.gembox0 = gembox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Image1:completeAnimation()
				self.Image1:setRGB( 0, 0, 0 )
				self.Image1:setAlpha( 0.25 )
				self.clipFinished( Image1, {} )
				Image10:completeAnimation()
				self.Image10:setAlpha( 0.2 )
				self.clipFinished( Image10, {} )
				Image4:completeAnimation()
				self.Image4:setAlpha( 0.2 )
				self.clipFinished( Image4, {} )
				namebox0:completeAnimation()
				self.namebox0:setAlpha( 1 )
				self.clipFinished( namebox0, {} )
				lapsbox0:completeAnimation()
				self.lapsbox0:setAlpha( 0.9 )
				self.clipFinished( lapsbox0, {} )
				nitrobox0:completeAnimation()
				self.nitrobox0:setAlpha( 0.9 )
				self.clipFinished( nitrobox0, {} )
				zombiesbox0:completeAnimation()
				self.zombiesbox0:setAlpha( 0.9 )
				self.clipFinished( zombiesbox0, {} )
				gembox0:completeAnimation()
				self.gembox0:setAlpha( 0.9 )
				self.clipFinished( gembox0, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				Image10:completeAnimation()
				self.Image10:setAlpha( 0 )
				self.clipFinished( Image10, {} )
				Image4:completeAnimation()
				self.Image4:setAlpha( 0 )
				self.clipFinished( Image4, {} )
				namebox0:completeAnimation()
				self.namebox0:setAlpha( 0 )
				self.clipFinished( namebox0, {} )
				lapsbox0:completeAnimation()
				self.lapsbox0:setAlpha( 0 )
				self.clipFinished( lapsbox0, {} )
				nitrobox0:completeAnimation()
				self.nitrobox0:setAlpha( 0 )
				self.clipFinished( nitrobox0, {} )
				zombiesbox0:completeAnimation()
				self.zombiesbox0:setAlpha( 0 )
				self.clipFinished( zombiesbox0, {} )
				gembox0:completeAnimation()
				self.gembox0:setAlpha( 0 )
				self.clipFinished( gembox0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsSelfModelValueNil( element, controller, "generic_txt" )
			end
		}
	} )
	self:linkToElementModel( self, "generic_txt", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "generic_txt"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.namebox0:close()
		element.lapsbox0:close()
		element.nitrobox0:close()
		element.zombiesbox0:close()
		element.gembox0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

