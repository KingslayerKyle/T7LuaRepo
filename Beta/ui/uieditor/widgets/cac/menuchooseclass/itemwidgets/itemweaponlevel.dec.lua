CoD.ItemWeaponLevel = InheritFrom( LUI.UIElement )
CoD.ItemWeaponLevel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ItemWeaponLevel )
	self.id = "ItemWeaponLevel"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 33 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( false, true, -16, 0 )
	bg:setRGB( 0.97, 0.93, 0.07 )
	self:addElement( bg )
	self.bg = bg
	
	local weaponLevel = LUI.UIText.new()
	weaponLevel:setLeftRight( false, false, -16, 16 )
	weaponLevel:setTopBottom( false, true, -17, 1 )
	weaponLevel:setRGB( 0, 0, 0 )
	weaponLevel:setTTF( "fonts/default.ttf" )
	weaponLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	weaponLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	weaponLevel:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponLevel:setText( Engine.Localize( GetCurrentWeaponLevel( controller, modelValue ) ) )
		end
	end )
	self:addElement( weaponLevel )
	self.weaponLevel = weaponLevel
	
	local levelLabel = LUI.UIText.new()
	levelLabel:setLeftRight( false, false, -16, 16 )
	levelLabel:setTopBottom( true, false, 0, 18 )
	levelLabel:setRGB( 0.97, 0.93, 0.07 )
	levelLabel:setText( Engine.Localize( "MENU_LEVEL_CAPS" ) )
	levelLabel:setTTF( "fonts/default.ttf" )
	levelLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	levelLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( levelLabel )
	self.levelLabel = levelLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				weaponLevel:completeAnimation()
				self.weaponLevel:setAlpha( 0 )
				self.clipFinished( weaponLevel, {} )
				levelLabel:completeAnimation()
				self.levelLabel:setAlpha( 0 )
				self.clipFinished( levelLabel, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				weaponLevel:completeAnimation()
				self.weaponLevel:setAlpha( 1 )
				self.clipFinished( weaponLevel, {} )
				levelLabel:completeAnimation()
				self.levelLabel:setAlpha( 1 )
				self.clipFinished( levelLabel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsCACGunLevelExists( self, element, controller )
			end
		}
	} )
	self:linkToElementModel( "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.weaponLevel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

