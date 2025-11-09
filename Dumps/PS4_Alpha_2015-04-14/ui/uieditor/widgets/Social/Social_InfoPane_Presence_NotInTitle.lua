require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.Social_InfoPane_Presence_NotInTitle = InheritFrom( LUI.UIElement )
CoD.Social_InfoPane_Presence_NotInTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_InfoPane_Presence_NotInTitle )
	self.id = "Social_InfoPane_Presence_NotInTitle"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 411 )
	self:setTopBottom( true, false, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local platformPresence = LUI.UIText.new()
	platformPresence:setLeftRight( true, true, 10, -10 )
	platformPresence:setTopBottom( true, false, 42, 64 )
	platformPresence:setRGB( 1, 1, 1 )
	platformPresence:setAlpha( 0 )
	platformPresence:setText( Engine.Localize( PresenceActivityToLocalizedString( "not visible" ) ) )
	platformPresence:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( platformPresence )
	self.platformPresence = platformPresence
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, 1, 0 )
	cacItemTitleGlow0:setTopBottom( true, false, -1, 36 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local statusText = LUI.UIText.new()
	statusText:setLeftRight( true, true, 10, -5 )
	statusText:setTopBottom( true, false, 6, 31 )
	statusText:setRGB( 0, 0, 0 )
	statusText:setText( Engine.Localize( "MENU_OFFLINE" ) )
	statusText:setTTF( "fonts/Entovo.ttf" )
	statusText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	statusText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( statusText )
	self.statusText = statusText
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -57.93, 44.07 )
	Glow:setTopBottom( false, false, -73, 0 )
	Glow:setRGB( 1, 1, 1 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( false, false, 0, 36 )
	StartMenuframenoBG0:setRGB( 1, 1, 1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				platformPresence:completeAnimation()
				self.platformPresence:setAlpha( 1 )
				self.platformPresence:setText( Engine.Localize( PresenceActivityToLocalizedString( "Playing Advance Warfare" ) ) )
				self.clipFinished( platformPresence, {} )
				statusText:completeAnimation()
				self.statusText:setAlpha( 1 )
				self.statusText:setText( Engine.Localize( "MENU_ONLINE" ) )
				self.clipFinished( statusText, {} )
			end
		},
		Offline = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				platformPresence:completeAnimation()
				self.platformPresence:setRGB( 1, 1, 1 )
				self.platformPresence:setAlpha( 0 )
				self.platformPresence:setText( Engine.Localize( PresenceActivityToLocalizedString( "not visible" ) ) )
				self.clipFinished( platformPresence, {} )
				statusText:completeAnimation()
				self.statusText:setAlpha( 1 )
				self.statusText:setText( Engine.Localize( "MENU_OFFLINE" ) )
				self.clipFinished( statusText, {} )
			end
		}
	}
	self.close = function ( self )
		self.cacItemTitleGlow0:close()
		self.StartMenuframenoBG0:close()
		CoD.Social_InfoPane_Presence_NotInTitle.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

