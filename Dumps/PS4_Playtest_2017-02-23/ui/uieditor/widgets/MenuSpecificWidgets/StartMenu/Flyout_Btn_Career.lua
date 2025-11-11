CoD.Flyout_Btn_Career = InheritFrom( LUI.UIElement )
CoD.Flyout_Btn_Career.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Flyout_Btn_Career )
	self.id = "Flyout_Btn_Career"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 324 )
	self:setTopBottom( 0, 0, 0, 72 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local btnTop = LUI.UIImage.new()
	btnTop:setLeftRight( 0, 0, 0, 324 )
	btnTop:setTopBottom( 0, 0, 0, 72 )
	btnTop:setImage( RegisterImage( "uie_menu_button_flyout_start_btn_top" ) )
	self:addElement( btnTop )
	self.btnTop = btnTop
	
	local btnTopHover = LUI.UIImage.new()
	btnTopHover:setLeftRight( 0, 0, 0, 324 )
	btnTopHover:setTopBottom( 0, 0, 0, 72 )
	btnTopHover:setAlpha( 0 )
	btnTopHover:setImage( RegisterImage( "uie_menu_button_flyout_start_btn_top_hover" ) )
	self:addElement( btnTopHover )
	self.btnTopHover = btnTopHover
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( 0, 0, -24, 351 )
	glow:setTopBottom( 0, 0, -28, 100 )
	glow:setAlpha( 0 )
	glow:setImage( RegisterImage( "uie_menu_button_flyout_start_btn_top_hover_glow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	local Career = LUI.UITightText.new()
	Career:setLeftRight( 0, 0, 124, 180 )
	Career:setTopBottom( 0, 0, 22, 49 )
	Career:setText( Engine.Localize( "CAREER" ) )
	Career:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	self:addElement( Career )
	self.Career = Career
	
	self.resetProperties = function ()
		btnTop:completeAnimation()
		btnTopHover:completeAnimation()
		glow:completeAnimation()
		btnTop:setAlpha( 1 )
		btnTopHover:setAlpha( 0 )
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
				btnTop:completeAnimation()
				self.btnTop:setAlpha( 0 )
				self.clipFinished( btnTop, {} )
				btnTopHover:completeAnimation()
				self.btnTopHover:setAlpha( 0.8 )
				self.clipFinished( btnTopHover, {} )
				glow:completeAnimation()
				self.glow:setLeftRight( 0, 0, 0, 340 )
				self.glow:setTopBottom( 0, 0, -16, 80 )
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

