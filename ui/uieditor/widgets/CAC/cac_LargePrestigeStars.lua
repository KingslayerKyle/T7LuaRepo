-- da377a1eb3d51d442ea2d37302ddab74
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.onOffImage" )
require( "ui.uieditor.widgets.FooterButtonPrompt" )

CoD.cac_LargePrestigeStars = InheritFrom( LUI.UIElement )
CoD.cac_LargePrestigeStars.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.cac_LargePrestigeStars )
	self.id = "cac_LargePrestigeStars"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local prestigeStar1 = CoD.onOffImage.new( menu, controller )
	prestigeStar1:setLeftRight( true, false, 0, 16 )
	prestigeStar1:setTopBottom( true, false, 0, 16 )
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
	prestigeStar2:setLeftRight( true, false, 0, 16 )
	prestigeStar2:setTopBottom( true, false, 16, 32 )
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
	
	local prestigeButton = CoD.FooterButtonPrompt.new( menu, controller )
	prestigeButton:setLeftRight( true, false, 16, 104 )
	prestigeButton:setTopBottom( true, false, 0, 32 )
	prestigeButton.label:setText( Engine.Localize( "MENU_PRESTIGE_WEAPON" ) )
	prestigeButton.keyPrompt.keybind:setText( Engine.Localize( "P" ) )
	prestigeButton:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			prestigeButton.buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	prestigeButton:linkToElementModel( self, nil, false, function ( model )
		prestigeButton:setModel( model, controller )
	end )
	prestigeButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				local f11_local0 = IsGamepad( controller )
				if f11_local0 then
					f11_local0 = CanPrestigeWeapon( element, controller )
					if f11_local0 then
						f11_local0 = IsCACCategoryWeapon( controller )
					end
				end
				return f11_local0
			end
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f13_local0
				if not IsGamepad( controller ) then
					f13_local0 = CanPrestigeWeapon( element, controller )
					if f13_local0 then
						f13_local0 = IsCACCategoryWeapon( controller )
					end
				else
					f13_local0 = false
				end
				return f13_local0
			end
		}
	} )
	if prestigeButton.m_eventHandlers.input_source_changed then
		local f1_local4 = prestigeButton.m_eventHandlers.input_source_changed
		prestigeButton:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local4( element, event )
		end )
	else
		prestigeButton:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	prestigeButton:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( prestigeButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	prestigeButton:linkToElementModel( prestigeButton, "itemIndex", true, function ( model )
		menu:updateElementState( prestigeButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	self:addElement( prestigeButton )
	self.prestigeButton = prestigeButton
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				prestigeStar1:completeAnimation()
				self.prestigeStar1:setRGB( 0.97, 0.93, 0.07 )
				self.clipFinished( prestigeStar1, {} )

				prestigeStar2:completeAnimation()
				self.prestigeStar2:setRGB( 0.97, 0.93, 0.07 )
				self.clipFinished( prestigeStar2, {} )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				prestigeStar1:completeAnimation()
				self.prestigeStar1:setRGB( 0.59, 0.36, 0.89 )
				self.clipFinished( prestigeStar1, {} )

				prestigeStar2:completeAnimation()
				self.prestigeStar2:setRGB( 0.59, 0.36, 0.89 )
				self.clipFinished( prestigeStar2, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "DoubleWeaponXP",
			condition = function ( menu, element, event )
				return IsDoubleWeaponXP( controller )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.prestigeStar1:close()
		element.prestigeStar2:close()
		element.prestigeButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

