CoD.Flyout_Btn_Multiplayer = InheritFrom( LUI.UIElement )
CoD.Flyout_Btn_Multiplayer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Flyout_Btn_Multiplayer )
	self.id = "Flyout_Btn_Multiplayer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 323 )
	self:setTopBottom( 0, 0, 0, 72 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local btnBottom = LUI.UIImage.new()
	btnBottom:setLeftRight( 0, 0, 1, 325 )
	btnBottom:setTopBottom( 0, 0, 0, 72 )
	btnBottom:setXRot( 180 )
	btnBottom:setImage( RegisterImage( "uie_menu_button_flyout_start_btn_top" ) )
	self:addElement( btnBottom )
	self.btnBottom = btnBottom
	
	local btnBottomHover = LUI.UIImage.new()
	btnBottomHover:setLeftRight( 0, 0, 1, 325 )
	btnBottomHover:setTopBottom( 0, 0, 0, 72 )
	btnBottomHover:setAlpha( 0 )
	btnBottomHover:setXRot( 180 )
	btnBottomHover:setImage( RegisterImage( "uie_menu_button_flyout_start_btn_top_hover" ) )
	self:addElement( btnBottomHover )
	self.btnBottomHover = btnBottomHover
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( 0, 0, -24, 351 )
	glow:setTopBottom( 0, 0, -28, 100 )
	glow:setAlpha( 0 )
	glow:setXRot( 180 )
	glow:setImage( RegisterImage( "uie_menu_button_flyout_start_btn_top_hover_glow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	local multiplayer = LUI.UITightText.new()
	multiplayer:setLeftRight( 0, 0, 125, 222 )
	multiplayer:setTopBottom( 0, 0, 22, 49 )
	multiplayer:setText( Engine.Localize( "MULTIPLAYER" ) )
	multiplayer:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( multiplayer )
	self.multiplayer = multiplayer
	
	self.resetProperties = function ()
		btnBottom:completeAnimation()
		btnBottomHover:completeAnimation()
		glow:completeAnimation()
		btnBottom:setAlpha( 1 )
		btnBottomHover:setAlpha( 0 )
		glow:setLeftRight( 0, 0, -24, 351 )
		glow:setTopBottom( 0, 0, -28, 100 )
		glow:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				btnBottom:completeAnimation()
				self.btnBottom:setAlpha( 0 )
				self.clipFinished( btnBottom, {} )
				btnBottomHover:completeAnimation()
				self.btnBottomHover:setAlpha( 0.8 )
				self.clipFinished( btnBottomHover, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( 0, 0, -2, 343 )
				self.glow:setTopBottom( 0, 0, -10, 87 )
				self.glow:setAlpha( 0.1 )
				self.clipFinished( glow, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

