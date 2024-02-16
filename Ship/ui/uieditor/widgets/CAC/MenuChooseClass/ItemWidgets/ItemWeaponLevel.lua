-- e6ace9ca44b00adff54e4267f20c2597
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.onOffImage" )

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
	self.anyChildUsesUpdateState = true
	
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
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			weaponLevel:setText( Engine.Localize( GetCurrentWeaponLevel( controller, itemIndex ) ) )
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
	
	local prestigeStar1 = CoD.onOffImage.new( menu, controller )
	prestigeStar1:setLeftRight( true, false, -8.5, -1 )
	prestigeStar1:setTopBottom( false, true, -16, -8.5 )
	prestigeStar1:setRGB( 0.97, 0.93, 0.07 )
	prestigeStar1.image:setImage( RegisterImage( "uie_t7_arena_star_petit_white" ) )
	prestigeStar1:linkToElementModel( self, nil, false, function ( model )
		prestigeStar1:setModel( model, controller )
	end )
	prestigeStar1:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsWeaponPrestigeLevelAtLeast( element, controller, 1 )
			end
		}
	} )
	prestigeStar1:linkToElementModel( prestigeStar1, "itemIndex", true, function ( model )
		menu:updateElementState( prestigeStar1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( prestigeStar1 )
	self.prestigeStar1 = prestigeStar1
	
	local prestigeStar2 = CoD.onOffImage.new( menu, controller )
	prestigeStar2:setLeftRight( true, false, -8.5, -1 )
	prestigeStar2:setTopBottom( false, true, -7.5, 0 )
	prestigeStar2:setRGB( 0.97, 0.93, 0.07 )
	prestigeStar2.image:setImage( RegisterImage( "uie_t7_arena_star_petit_white" ) )
	prestigeStar2:linkToElementModel( self, nil, false, function ( model )
		prestigeStar2:setModel( model, controller )
	end )
	prestigeStar2:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return IsWeaponPrestigeLevelAtLeast( element, controller, 2 )
			end
		}
	} )
	prestigeStar2:linkToElementModel( prestigeStar2, "itemIndex", true, function ( model )
		menu:updateElementState( prestigeStar2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( prestigeStar2 )
	self.prestigeStar2 = prestigeStar2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )

				weaponLevel:completeAnimation()
				self.weaponLevel:setAlpha( 0 )
				self.clipFinished( weaponLevel, {} )

				levelLabel:completeAnimation()
				self.levelLabel:setAlpha( 0 )
				self.clipFinished( levelLabel, {} )

				prestigeStar1:completeAnimation()
				self.prestigeStar1:setAlpha( 0 )
				self.clipFinished( prestigeStar1, {} )

				prestigeStar2:completeAnimation()
				self.prestigeStar2:setAlpha( 0 )
				self.clipFinished( prestigeStar2, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				bg:completeAnimation()
				self.bg:setRGB( 0.97, 0.93, 0.07 )
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				weaponLevel:completeAnimation()
				self.weaponLevel:setRGB( 0, 0, 0 )
				self.weaponLevel:setAlpha( 1 )
				self.clipFinished( weaponLevel, {} )

				levelLabel:completeAnimation()
				self.levelLabel:setRGB( 0.97, 0.93, 0.07 )
				self.levelLabel:setAlpha( 1 )
				self.clipFinished( levelLabel, {} )

				prestigeStar1:completeAnimation()
				self.prestigeStar1:setRGB( 0.97, 0.93, 0.07 )
				self.prestigeStar1:setAlpha( 1 )
				self.clipFinished( prestigeStar1, {} )

				prestigeStar2:completeAnimation()
				self.prestigeStar2:setRGB( 0.97, 0.93, 0.07 )
				self.prestigeStar2:setAlpha( 1 )
				self.clipFinished( prestigeStar2, {} )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				bg:completeAnimation()
				self.bg:setRGB( 0.31, 0.13, 0.47 )
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				weaponLevel:completeAnimation()
				self.weaponLevel:setRGB( 1, 1, 1 )
				self.weaponLevel:setAlpha( 1 )
				self.clipFinished( weaponLevel, {} )

				levelLabel:completeAnimation()
				self.levelLabel:setRGB( 0.59, 0.36, 0.89 )
				self.levelLabel:setAlpha( 1 )
				self.clipFinished( levelLabel, {} )

				prestigeStar1:completeAnimation()
				self.prestigeStar1:setRGB( 0.59, 0.36, 0.89 )
				self.prestigeStar1:setAlpha( 1 )
				self.clipFinished( prestigeStar1, {} )

				prestigeStar2:completeAnimation()
				self.prestigeStar2:setRGB( 0.59, 0.36, 0.89 )
				self.prestigeStar2:setAlpha( 1 )
				self.clipFinished( prestigeStar2, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "DoubleWeaponXP",
			condition = function ( menu, element, event )
				return IsCACGunLevelExists( self, element, controller ) and IsDoubleWeaponXP( controller )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsCACGunLevelExists( self, element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.prestigeStar1:close()
		element.prestigeStar2:close()
		element.weaponLevel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
