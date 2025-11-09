CoD.HeroWeaponWidgetProto = InheritFrom( LUI.UIElement )
CoD.HeroWeaponWidgetProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HeroWeaponWidgetProto )
	self.id = "HeroWeaponWidgetProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 20 )
	
	local hPromptText = LUI.UIText.new()
	hPromptText:setLeftRight( false, true, -270, -40 )
	hPromptText:setTopBottom( true, false, 0, 20 )
	hPromptText:setRGB( 1, 1, 1 )
	hPromptText:setText( Engine.Localize( "MENU_HERO_WEAPON_PROMPT" ) )
	hPromptText:setTTF( "fonts/default.ttf" )
	hPromptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	hPromptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( hPromptText )
	self.hPromptText = hPromptText
	
	local hAmmoCount = LUI.UIText.new()
	hAmmoCount:setLeftRight( true, false, 80, 100 )
	hAmmoCount:setTopBottom( true, false, 0, 20 )
	hAmmoCount:setRGB( 1, 1, 1 )
	hAmmoCount:setText( Engine.Localize( "" ) )
	hAmmoCount:setTTF( "fonts/default.ttf" )
	hAmmoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	hAmmoCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( hAmmoCount )
	self.hAmmoCount = hAmmoCount
	
	local hAmmoFrame = LUI.UIImage.new()
	hAmmoFrame:setLeftRight( true, false, 80, 100 )
	hAmmoFrame:setTopBottom( true, false, 0, 20 )
	hAmmoFrame:setRGB( 1, 1, 1 )
	hAmmoFrame:setImage( RegisterImage( "uie_progress_bar_frame_white" ) )
	hAmmoFrame:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( hAmmoFrame )
	self.hAmmoFrame = hAmmoFrame
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				hPromptText:completeAnimation()
				self.hPromptText:setAlpha( 1 )
				self.clipFinished( hPromptText, {} )
				hAmmoCount:completeAnimation()
				self.hAmmoCount:setAlpha( 1 )
				self.clipFinished( hAmmoCount, {} )
				hAmmoFrame:completeAnimation()
				self.hAmmoFrame:setAlpha( 1 )
				self.clipFinished( hAmmoFrame, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

