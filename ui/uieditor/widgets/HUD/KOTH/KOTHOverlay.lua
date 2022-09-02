-- 7256258ba4c377d9241927a02a2cedc7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.KOTH.HardpointTimer" )

CoD.KOTHOverlay = InheritFrom( LUI.UIElement )
CoD.KOTHOverlay.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.KOTHOverlay )
	self.id = "KOTHOverlay"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local HardpointStatus = CoD.HardpointTimer.new( menu, controller )
	HardpointStatus:setLeftRight( true, false, 37, 344 )
	HardpointStatus:setTopBottom( true, false, 192, 224 )
	HardpointStatus:setYRot( 21 )
	HardpointStatus:registerEventHandler( "hud_boot", function ( element, event )
		local f2_local0 = nil
		if ShouldBootUpHUD( menu ) then
			PlayClipOnElement( self, {
				elementName = "HardpointStatus",
				clipName = "DefaultClip"
			}, controller )
			SetHudHasBooted( self )
		end
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( HardpointStatus )
	self.HardpointStatus = HardpointStatus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				HardpointStatus:completeAnimation()
				self.HardpointStatus:setLeftRight( true, false, 37, 344 )
				self.HardpointStatus:setTopBottom( true, false, 192, 224 )
				self.HardpointStatus:setAlpha( 1 )
				self.clipFinished( HardpointStatus, {} )
			end
		},
		HideForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				HardpointStatus:completeAnimation()
				self.HardpointStatus:setAlpha( 0 )
				self.clipFinished( HardpointStatus, {} )
			end
		},
		CodCasterLargeMinimap = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				HardpointStatus:completeAnimation()
				self.HardpointStatus:setLeftRight( true, false, 37, 344 )
				self.HardpointStatus:setTopBottom( true, false, 245, 277 )
				self.HardpointStatus:setAlpha( 1 )
				self.clipFinished( HardpointStatus, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				HardpointStatus:completeAnimation()
				self.HardpointStatus:setLeftRight( true, false, 37, 344 )
				self.HardpointStatus:setTopBottom( true, false, 192, 224 )
				self.HardpointStatus:setAlpha( 1 )
				self.clipFinished( HardpointStatus, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "HideForCodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playerhud", 1 )
			end
		},
		{
			stateName = "CodCasterLargeMinimap",
			condition = function ( menu, element, event )
				return IsCodCasterProfileValueEqualTo( controller, "shoutcaster_minimap", Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_FULL ) and IsCodCaster( controller )
			end
		},
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HardpointStatus:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

