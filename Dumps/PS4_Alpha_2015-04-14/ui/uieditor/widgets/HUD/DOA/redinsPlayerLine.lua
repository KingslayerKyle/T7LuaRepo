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
	
	local namebox0 = LUI.UIText.new()
	namebox0:setLeftRight( true, false, 0, 231.28 )
	namebox0:setTopBottom( true, false, 4.86, 24.86 )
	namebox0:setTTF( "fonts/default.ttf" )
	namebox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	namebox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	namebox0:linkToElementModel( self, "tank_rgb", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			namebox0:setRGB( modelValue )
		end
	end )
	namebox0:linkToElementModel( self, "generic_txt", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			namebox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( namebox0 )
	self.namebox0 = namebox0
	
	local lapsbox0 = LUI.UIText.new()
	lapsbox0:setLeftRight( true, false, 241, 288 )
	lapsbox0:setTopBottom( true, false, 4.86, 24.86 )
	lapsbox0:setRGB( 1, 1, 1 )
	lapsbox0:setTTF( "fonts/default.ttf" )
	lapsbox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lapsbox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lapsbox0:linkToElementModel( self, "bombs", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lapsbox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( lapsbox0 )
	self.lapsbox0 = lapsbox0
	
	local nitrobox0 = LUI.UIText.new()
	nitrobox0:setLeftRight( true, false, 321, 368 )
	nitrobox0:setTopBottom( true, false, 4.86, 24.86 )
	nitrobox0:setRGB( 1, 1, 1 )
	nitrobox0:setTTF( "fonts/default.ttf" )
	nitrobox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	nitrobox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	nitrobox0:linkToElementModel( self, "boosts", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nitrobox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( nitrobox0 )
	self.nitrobox0 = nitrobox0
	
	local zombiesbox0 = LUI.UIText.new()
	zombiesbox0:setLeftRight( true, false, 396.5, 443.5 )
	zombiesbox0:setTopBottom( true, false, 4.86, 24.86 )
	zombiesbox0:setRGB( 1, 1, 1 )
	zombiesbox0:setTTF( "fonts/default.ttf" )
	zombiesbox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	zombiesbox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	zombiesbox0:linkToElementModel( self, "gpr", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			zombiesbox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( zombiesbox0 )
	self.zombiesbox0 = zombiesbox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				namebox0:completeAnimation()
				self.namebox0:setAlpha( 1 )
				self.clipFinished( namebox0, {} )
				lapsbox0:completeAnimation()
				self.lapsbox0:setAlpha( 1 )
				self.clipFinished( lapsbox0, {} )
				nitrobox0:completeAnimation()
				self.nitrobox0:setAlpha( 1 )
				self.clipFinished( nitrobox0, {} )
				zombiesbox0:completeAnimation()
				self.zombiesbox0:setAlpha( 1 )
				self.clipFinished( zombiesbox0, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
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
	self.close = function ( self )
		self.namebox0:close()
		self.lapsbox0:close()
		self.nitrobox0:close()
		self.zombiesbox0:close()
		CoD.redinsPlayerLine.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

