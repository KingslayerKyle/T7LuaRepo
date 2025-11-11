require( "ui.uieditor.widgets.FooterButtonPrompt" )
require( "ui.uieditor.widgets.onOffImage" )

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
	self:setLeftRight( 0, 0, 0, 24 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local prestigeStar1 = CoD.onOffImage.new( menu, controller )
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
	prestigeStar1:setLeftRight( 0, 0, 0, 24 )
	prestigeStar1:setTopBottom( 0, 0, 0, 24 )
	prestigeStar1:setRGB( 0.97, 0.93, 0.07 )
	prestigeStar1.image:setImage( RegisterImage( "uie_t7_arena_star_petit_white" ) )
	prestigeStar1:linkToElementModel( self, nil, false, function ( model )
		prestigeStar1:setModel( model, controller )
	end )
	self:addElement( prestigeStar1 )
	self.prestigeStar1 = prestigeStar1
	
	local prestigeStar2 = CoD.onOffImage.new( menu, controller )
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
	prestigeStar2:setLeftRight( 0, 0, 0, 24 )
	prestigeStar2:setTopBottom( 0, 0, 24, 48 )
	prestigeStar2:setRGB( 0.97, 0.93, 0.07 )
	prestigeStar2.image:setImage( RegisterImage( "uie_t7_arena_star_petit_white" ) )
	prestigeStar2:linkToElementModel( self, nil, false, function ( model )
		prestigeStar2:setModel( model, controller )
	end )
	self:addElement( prestigeStar2 )
	self.prestigeStar2 = prestigeStar2
	
	local prestigeButton = CoD.FooterButtonPrompt.new( menu, controller )
	prestigeButton:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsSelfModelValueEnumFlagSet( element, controller, "flags", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL ) then
					f8_local0 = AlwaysFalse()
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				local f9_local0 = IsGamepad( controller )
				if f9_local0 then
					if not IsSelfModelValueEnumFlagSet( element, controller, "flags", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL ) then
						f9_local0 = CanPrestigeWeapon( element, controller )
						if f9_local0 then
							f9_local0 = IsCACCategoryWeapon( controller )
						end
					else
						f9_local0 = false
					end
				end
				return f9_local0
			end
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsSelfModelValueEnumFlagSet( element, controller, "flags", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL ) then
					f10_local0 = IsPC()
					if f10_local0 then
						f10_local0 = AlwaysFalse()
					end
				else
					f10_local0 = false
				end
				return f10_local0
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f11_local0
				if not IsGamepad( controller ) and not IsSelfModelValueEnumFlagSet( element, controller, "flags", Enum.LUIButtonPromptFlags.BPF_CONTEXTUAL ) then
					f11_local0 = IsPC()
					if f11_local0 then
						f11_local0 = CanPrestigeWeapon( element, controller )
						if f11_local0 then
							f11_local0 = IsCACCategoryWeapon( controller )
						end
					end
				else
					f11_local0 = false
				end
				return f11_local0
			end
		}
	} )
	prestigeButton:linkToElementModel( prestigeButton, "flags", true, function ( model )
		menu:updateElementState( prestigeButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "flags"
		} )
	end )
	if prestigeButton.m_eventHandlers.input_source_changed then
		local currentEv = prestigeButton.m_eventHandlers.input_source_changed
		prestigeButton:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
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
	prestigeButton:setLeftRight( 0, 0, 24, 156 )
	prestigeButton:setTopBottom( 0, 0, 0, 48 )
	prestigeButton.label:setText( Engine.Localize( "MENU_PRESTIGE_WEAPON" ) )
	prestigeButton.keyPrompt.keybind:setText( Engine.Localize( "P" ) )
	prestigeButton:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			prestigeButton.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	prestigeButton:linkToElementModel( self, nil, false, function ( model )
		prestigeButton:setModel( model, controller )
	end )
	self:addElement( prestigeButton )
	self.prestigeButton = prestigeButton
	
	self.resetProperties = function ()
		prestigeStar1:completeAnimation()
		prestigeStar2:completeAnimation()
		prestigeStar1:setRGB( 0.97, 0.93, 0.07 )
		prestigeStar2:setRGB( 0.97, 0.93, 0.07 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.prestigeStar1:close()
		self.prestigeStar2:close()
		self.prestigeButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

