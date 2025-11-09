require( "ui.uieditor.widgets.HUD.Killcam.KillcamKilledByImage" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.ImageContainer:subscribeToGlobalModel( f1_arg1, "HUDItems", "killcamWeapon.killfeedicon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.ImageContainer.Image:setImage( RegisterImage( modelValue ) )
			local f2_local1, f2_local2, f2_local3, f2_local4 = f1_arg0.ImageContainer:getLocalLeftRight()
			local f2_local5, f2_local6, f2_local7, f2_local8 = f1_arg0.ImageContainer:getLocalTopBottom()
			local f2_local9, f2_local10 = f1_arg0.ImageContainer.Image:getImageDimensions()
			if f2_local9 ~= 0 and f2_local10 ~= 0 then
				local f2_local11 = (f2_local8 - f2_local7) / f2_local10 * f2_local9
				f1_arg0.ImageContainer:setLeftRight( true, false, f2_local3, f2_local3 + f2_local11 )
				if CoD.SafeGetModelValue( Engine.GetModelForController( f1_arg1 ), "hudItems.killcamWeapon.flip" ) then
					f1_arg0.ImageContainer.Image:setLeftRight( true, false, f2_local11, 0 )
				else
					f1_arg0.ImageContainer.Image:setLeftRight( true, false, 0, f2_local11 )
				end
				f1_arg0:setLayoutCached( false )
			end
		end
	end )
end

CoD.KillcamKilledBy = InheritFrom( LUI.UIElement )
CoD.KillcamKilledBy.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamKilledBy )
	self.id = "KillcamKilledBy"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 492 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local KilledByAttachment5 = LUI.UITightText.new()
	KilledByAttachment5:setLeftRight( true, false, 450.53, 492 )
	KilledByAttachment5:setTopBottom( true, false, 0, 20 )
	KilledByAttachment5:setTTF( "fonts/default.ttf" )
	KilledByAttachment5:subscribeToGlobalModel( controller, "HUDItems", "killcamWeapon.attachment5", function ( model )
		local killcamWeaponAttachment5 = Engine.GetModelValue( model )
		if killcamWeaponAttachment5 then
			KilledByAttachment5:setText( Engine.Localize( PrependToLocalizeStringIfNotEmpty( " + ", killcamWeaponAttachment5 ) ) )
		end
	end )
	self:addElement( KilledByAttachment5 )
	self.KilledByAttachment5 = KilledByAttachment5
	
	local KilledByAttachment4 = LUI.UITightText.new()
	KilledByAttachment4:setLeftRight( true, false, 409.05, 450.53 )
	KilledByAttachment4:setTopBottom( true, false, 0, 20 )
	KilledByAttachment4:setTTF( "fonts/default.ttf" )
	KilledByAttachment4:subscribeToGlobalModel( controller, "HUDItems", "killcamWeapon.attachment4", function ( model )
		local killcamWeaponAttachment4 = Engine.GetModelValue( model )
		if killcamWeaponAttachment4 then
			KilledByAttachment4:setText( Engine.Localize( PrependToLocalizeStringIfNotEmpty( " + ", killcamWeaponAttachment4 ) ) )
		end
	end )
	self:addElement( KilledByAttachment4 )
	self.KilledByAttachment4 = KilledByAttachment4
	
	local KilledByAttachment3 = LUI.UITightText.new()
	KilledByAttachment3:setLeftRight( true, false, 367.58, 409.05 )
	KilledByAttachment3:setTopBottom( true, false, 0, 20 )
	KilledByAttachment3:setTTF( "fonts/default.ttf" )
	KilledByAttachment3:subscribeToGlobalModel( controller, "HUDItems", "killcamWeapon.attachment3", function ( model )
		local killcamWeaponAttachment3 = Engine.GetModelValue( model )
		if killcamWeaponAttachment3 then
			KilledByAttachment3:setText( Engine.Localize( PrependToLocalizeStringIfNotEmpty( " + ", killcamWeaponAttachment3 ) ) )
		end
	end )
	self:addElement( KilledByAttachment3 )
	self.KilledByAttachment3 = KilledByAttachment3
	
	local KilledByAttachment2 = LUI.UITightText.new()
	KilledByAttachment2:setLeftRight( true, false, 326.1, 367.58 )
	KilledByAttachment2:setTopBottom( true, false, 0, 20 )
	KilledByAttachment2:setTTF( "fonts/default.ttf" )
	KilledByAttachment2:subscribeToGlobalModel( controller, "HUDItems", "killcamWeapon.attachment2", function ( model )
		local killcamWeaponAttachment2 = Engine.GetModelValue( model )
		if killcamWeaponAttachment2 then
			KilledByAttachment2:setText( Engine.Localize( PrependToLocalizeStringIfNotEmpty( " + ", killcamWeaponAttachment2 ) ) )
		end
	end )
	self:addElement( KilledByAttachment2 )
	self.KilledByAttachment2 = KilledByAttachment2
	
	local KilledByAttachment1 = LUI.UITightText.new()
	KilledByAttachment1:setLeftRight( true, false, 284.63, 326.1 )
	KilledByAttachment1:setTopBottom( true, false, 0, 20 )
	KilledByAttachment1:setTTF( "fonts/default.ttf" )
	KilledByAttachment1:subscribeToGlobalModel( controller, "HUDItems", "killcamWeapon.attachment1", function ( model )
		local killcamWeaponAttachment1 = Engine.GetModelValue( model )
		if killcamWeaponAttachment1 then
			KilledByAttachment1:setText( Engine.Localize( PrependToLocalizeStringIfNotEmpty( " + ", killcamWeaponAttachment1 ) ) )
		end
	end )
	self:addElement( KilledByAttachment1 )
	self.KilledByAttachment1 = KilledByAttachment1
	
	local KilledByAttachment0 = LUI.UITightText.new()
	KilledByAttachment0:setLeftRight( true, false, 243.16, 284.63 )
	KilledByAttachment0:setTopBottom( true, false, 0, 20 )
	KilledByAttachment0:setTTF( "fonts/default.ttf" )
	KilledByAttachment0:subscribeToGlobalModel( controller, "HUDItems", "killcamWeapon.attachment0", function ( model )
		local killcamWeaponAttachment0 = Engine.GetModelValue( model )
		if killcamWeaponAttachment0 then
			KilledByAttachment0:setText( Engine.Localize( killcamWeaponAttachment0 ) )
		end
	end )
	self:addElement( KilledByAttachment0 )
	self.KilledByAttachment0 = KilledByAttachment0
	
	local spacer1 = LUI.UIImage.new()
	spacer1:setLeftRight( true, false, 232.16, 243.16 )
	spacer1:setTopBottom( true, false, 0, 25 )
	spacer1:setAlpha( 0 )
	self:addElement( spacer1 )
	self.spacer1 = spacer1
	
	local KilledByWeapon = LUI.UITightText.new()
	KilledByWeapon:setLeftRight( true, false, 128.63, 232.16 )
	KilledByWeapon:setTopBottom( true, false, -1, 19 )
	KilledByWeapon:setTTF( "fonts/default.ttf" )
	KilledByWeapon:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	KilledByWeapon:setShaderVector( 0, 0.15, 0, 0, 0 )
	KilledByWeapon:setShaderVector( 1, 0.05, 0, 0, 0 )
	KilledByWeapon:setShaderVector( 2, 1, 0, 0, 0 )
	KilledByWeapon:subscribeToGlobalModel( controller, "HUDItems", "killcamWeapon.weaponName", function ( model )
		local killcamWeaponWeaponName = Engine.GetModelValue( model )
		if killcamWeaponWeaponName then
			KilledByWeapon:setText( Engine.Localize( killcamWeaponWeaponName ) )
		end
	end )
	self:addElement( KilledByWeapon )
	self.KilledByWeapon = KilledByWeapon
	
	local spacer2 = LUI.UIImage.new()
	spacer2:setLeftRight( true, false, 122.63, 128.63 )
	spacer2:setTopBottom( true, false, 0, 25 )
	spacer2:setAlpha( 0 )
	self:addElement( spacer2 )
	self.spacer2 = spacer2
	
	local ImageContainer = CoD.KillcamKilledByImage.new( menu, controller )
	ImageContainer:setLeftRight( true, false, 91.63, 122.63 )
	ImageContainer:setTopBottom( true, false, 0, 20 )
	self:addElement( ImageContainer )
	self.ImageContainer = ImageContainer
	
	local spacer0 = LUI.UIImage.new()
	spacer0:setLeftRight( true, false, 85.63, 91.63 )
	spacer0:setTopBottom( true, false, 0, 25 )
	spacer0:setAlpha( 0 )
	self:addElement( spacer0 )
	self.spacer0 = spacer0
	
	local KilledBy = LUI.UITightText.new()
	KilledBy:setLeftRight( true, false, 24.63, 85.63 )
	KilledBy:setTopBottom( true, false, 0, 20 )
	KilledBy:setText( Engine.Localize( "MPUI_KILLED_BY_PRE_CAPS" ) )
	KilledBy:setTTF( "fonts/default.ttf" )
	self:addElement( KilledBy )
	self.KilledBy = KilledBy
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Killcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		FinalKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NemesisKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		RoundEndingKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Killcam",
			condition = function ( menu, element, event )
				local f16_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM )
				if f16_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) then
						f16_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
					else
						f16_local0 = false
					end
				end
				return f16_local0
			end
		},
		{
			stateName = "FinalKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
			end
		},
		{
			stateName = "NemesisKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM )
			end
		},
		{
			stateName = "RoundEndingKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ImageContainer:close()
		element.KilledByAttachment5:close()
		element.KilledByAttachment4:close()
		element.KilledByAttachment3:close()
		element.KilledByAttachment2:close()
		element.KilledByAttachment1:close()
		element.KilledByAttachment0:close()
		element.KilledByWeapon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

