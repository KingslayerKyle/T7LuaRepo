require( "ui.uieditor.widgets.HUD.MP_VoipWidget.Voip_Entry" )

CoD.Voip_Container = InheritFrom( LUI.UIElement )
CoD.Voip_Container.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Voip_Container )
	self.id = "Voip_Container"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 273 )
	self:setTopBottom( true, false, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local VoipEntry0 = CoD.Voip_Entry.new( menu, controller )
	VoipEntry0:setLeftRight( true, false, 0, 273 )
	VoipEntry0:setTopBottom( true, false, 0, 18 )
	VoipEntry0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	VoipEntry0:setShaderVector( 0, 0, 1, 0, 0 )
	VoipEntry0:setShaderVector( 1, 0, 0, 0, 0 )
	VoipEntry0:setShaderVector( 2, 0, 0, 0, 0 )
	VoipEntry0:setShaderVector( 3, 0, 0, 0, 0 )
	VoipEntry0:setShaderVector( 4, 0, 0, 0, 0 )
	VoipEntry0:subscribeToGlobalModel( controller, "HUDItems", "voipInfo.voip1", function ( model )
		VoipEntry0:setModel( model, controller )
	end )
	self:addElement( VoipEntry0 )
	self.VoipEntry0 = VoipEntry0
	
	local VoipEntry1 = CoD.Voip_Entry.new( menu, controller )
	VoipEntry1:setLeftRight( true, false, 0, 273 )
	VoipEntry1:setTopBottom( true, false, 18, 36 )
	VoipEntry1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	VoipEntry1:setShaderVector( 0, 0, 1, 0, 0 )
	VoipEntry1:setShaderVector( 1, 0, 0, 0, 0 )
	VoipEntry1:setShaderVector( 2, 0, 0, 0, 0 )
	VoipEntry1:setShaderVector( 3, 0, 0, 0, 0 )
	VoipEntry1:setShaderVector( 4, 0, 0, 0, 0 )
	VoipEntry1:subscribeToGlobalModel( controller, "HUDItems", "voipInfo.voip2", function ( model )
		VoipEntry1:setModel( model, controller )
	end )
	self:addElement( VoipEntry1 )
	self.VoipEntry1 = VoipEntry1
	
	local VoipEntry2 = CoD.Voip_Entry.new( menu, controller )
	VoipEntry2:setLeftRight( true, false, 0, 273 )
	VoipEntry2:setTopBottom( true, false, 36, 54 )
	VoipEntry2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	VoipEntry2:setShaderVector( 0, 0, 1, 0, 0 )
	VoipEntry2:setShaderVector( 1, 0, 0, 0, 0 )
	VoipEntry2:setShaderVector( 2, 0, 0, 0, 0 )
	VoipEntry2:setShaderVector( 3, 0, 0, 0, 0 )
	VoipEntry2:setShaderVector( 4, 0, 0, 0, 0 )
	VoipEntry2:subscribeToGlobalModel( controller, "HUDItems", "voipInfo.voip3", function ( model )
		VoipEntry2:setModel( model, controller )
	end )
	self:addElement( VoipEntry2 )
	self.VoipEntry2 = VoipEntry2
	
	local VoipEntry3 = CoD.Voip_Entry.new( menu, controller )
	VoipEntry3:setLeftRight( true, false, 0, 273 )
	VoipEntry3:setTopBottom( true, false, 54, 72 )
	VoipEntry3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	VoipEntry3:setShaderVector( 0, 0, 1, 0, 0 )
	VoipEntry3:setShaderVector( 1, 0, 0, 0, 0 )
	VoipEntry3:setShaderVector( 2, 0, 0, 0, 0 )
	VoipEntry3:setShaderVector( 3, 0, 0, 0, 0 )
	VoipEntry3:setShaderVector( 4, 0, 0, 0, 0 )
	VoipEntry3:subscribeToGlobalModel( controller, "HUDItems", "voipInfo.voip4", function ( model )
		VoipEntry3:setModel( model, controller )
	end )
	self:addElement( VoipEntry3 )
	self.VoipEntry3 = VoipEntry3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				VoipEntry0:completeAnimation()
				self.VoipEntry0:setAlpha( 0 )
				self.clipFinished( VoipEntry0, {} )
				VoipEntry1:completeAnimation()
				self.VoipEntry1:setAlpha( 0 )
				self.clipFinished( VoipEntry1, {} )
				VoipEntry2:completeAnimation()
				self.VoipEntry2:setAlpha( 0 )
				self.clipFinished( VoipEntry2, {} )
				VoipEntry3:completeAnimation()
				self.VoipEntry3:setAlpha( 0 )
				self.clipFinished( VoipEntry3, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				VoipEntry0:completeAnimation()
				self.VoipEntry0:setAlpha( 1 )
				self.clipFinished( VoipEntry0, {} )
				VoipEntry1:completeAnimation()
				self.VoipEntry1:setAlpha( 1 )
				self.clipFinished( VoipEntry1, {} )
				VoipEntry2:completeAnimation()
				self.VoipEntry2:setAlpha( 1 )
				self.clipFinished( VoipEntry2, {} )
				VoipEntry3:completeAnimation()
				self.VoipEntry3:setAlpha( 1 )
				self.clipFinished( VoipEntry3, {} )
			end
		},
		ShowForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				VoipEntry0:completeAnimation()
				self.VoipEntry0:setAlpha( 1 )
				self.clipFinished( VoipEntry0, {} )
				VoipEntry1:completeAnimation()
				self.VoipEntry1:setAlpha( 1 )
				self.clipFinished( VoipEntry1, {} )
				VoipEntry2:completeAnimation()
				self.VoipEntry2:setAlpha( 1 )
				self.clipFinished( VoipEntry2, {} )
				VoipEntry3:completeAnimation()
				self.VoipEntry3:setAlpha( 1 )
				self.clipFinished( VoipEntry3, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "ShowForCodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and IsCodCasterProfileValueEqualTo( controller, "shoutcaster_voipdock", 1 )
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
		element.VoipEntry0:close()
		element.VoipEntry1:close()
		element.VoipEntry2:close()
		element.VoipEntry3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

