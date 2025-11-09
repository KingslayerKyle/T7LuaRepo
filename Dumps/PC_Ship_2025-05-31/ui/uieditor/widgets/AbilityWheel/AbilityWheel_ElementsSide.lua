require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_Pixel" )

CoD.AbilityWheel_ElementsSide = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_ElementsSide.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_ElementsSide )
	self.id = "AbilityWheel_ElementsSide"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 469 )
	self:setTopBottom( true, false, 0, 616 )
	
	local SideLine = LUI.UIImage.new()
	SideLine:setLeftRight( false, true, -469, -237 )
	SideLine:setTopBottom( false, false, 49, 57 )
	SideLine:setAlpha( 0.5 )
	SideLine:setYRot( -180 )
	SideLine:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_outtercontextline" ) )
	SideLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( SideLine )
	self.SideLine = SideLine
	
	local Diag2 = LUI.UIImage.new()
	Diag2:setLeftRight( false, true, -258, -154 )
	Diag2:setTopBottom( false, false, -181, -117 )
	Diag2:setAlpha( 0.2 )
	Diag2:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_outterdiag" ) )
	Diag2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Diag2 )
	self.Diag2 = Diag2
	
	local Dots = LUI.UIImage.new()
	Dots:setLeftRight( false, true, -236, -204 )
	Dots:setTopBottom( false, false, -80, 184 )
	Dots:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_outterdots" ) )
	Dots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Dots )
	self.Dots = Dots
	
	local Semi = LUI.UIImage.new()
	Semi:setLeftRight( false, true, -171, -115 )
	Semi:setTopBottom( false, false, -85, 195 )
	Semi:setAlpha( 0.6 )
	Semi:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_outterline" ) )
	Semi:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Semi )
	self.Semi = Semi
	
	local AbilityWheelPixel6 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel6:setLeftRight( false, true, -84.5, -76.5 )
	AbilityWheelPixel6:setTopBottom( false, false, -308, -300 )
	AbilityWheelPixel6:setAlpha( 0.8 )
	self:addElement( AbilityWheelPixel6 )
	self.AbilityWheelPixel6 = AbilityWheelPixel6
	
	local AbilityWheelPixel7 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel7:setLeftRight( false, true, -9.5, -1.5 )
	AbilityWheelPixel7:setTopBottom( false, false, -179, -171 )
	AbilityWheelPixel7:setAlpha( 0.8 )
	self:addElement( AbilityWheelPixel7 )
	self.AbilityWheelPixel7 = AbilityWheelPixel7
	
	local AbilityWheelPixel8 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel8:setLeftRight( false, true, -8.5, -0.5 )
	AbilityWheelPixel8:setTopBottom( false, false, 279, 287 )
	AbilityWheelPixel8:setAlpha( 0.8 )
	self:addElement( AbilityWheelPixel8 )
	self.AbilityWheelPixel8 = AbilityWheelPixel8
	
	local AbilityWheelPixel9 = CoD.AbilityWheel_Pixel.new( menu, controller )
	AbilityWheelPixel9:setLeftRight( false, true, -90.5, -82.5 )
	AbilityWheelPixel9:setTopBottom( false, false, 300, 308 )
	AbilityWheelPixel9:setAlpha( 0.8 )
	self:addElement( AbilityWheelPixel9 )
	self.AbilityWheelPixel9 = AbilityWheelPixel9
	
	local Diag = LUI.UIImage.new()
	Diag:setLeftRight( false, true, -258, -154 )
	Diag:setTopBottom( false, false, 228, 292 )
	Diag:setAlpha( 0.2 )
	Diag:setXRot( -180 )
	Diag:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_outterdiag" ) )
	Diag:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Diag )
	self.Diag = Diag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				SideLine:completeAnimation()
				self.SideLine:setAlpha( 0.5 )
				self.clipFinished( SideLine, {} )
				Diag2:completeAnimation()
				self.Diag2:setAlpha( 0.2 )
				self.clipFinished( Diag2, {} )
				Dots:completeAnimation()
				self.Dots:setAlpha( 1 )
				self.clipFinished( Dots, {} )
				Semi:completeAnimation()
				self.Semi:setAlpha( 0.6 )
				self.clipFinished( Semi, {} )
				AbilityWheelPixel6:completeAnimation()
				self.AbilityWheelPixel6:setAlpha( 0.8 )
				self.clipFinished( AbilityWheelPixel6, {} )
				AbilityWheelPixel7:completeAnimation()
				self.AbilityWheelPixel7:setAlpha( 0.8 )
				self.clipFinished( AbilityWheelPixel7, {} )
				AbilityWheelPixel8:completeAnimation()
				self.AbilityWheelPixel8:setAlpha( 0.8 )
				self.clipFinished( AbilityWheelPixel8, {} )
				AbilityWheelPixel9:completeAnimation()
				self.AbilityWheelPixel9:setAlpha( 0.8 )
				self.clipFinished( AbilityWheelPixel9, {} )
				Diag:completeAnimation()
				self.Diag:setAlpha( 0.2 )
				self.clipFinished( Diag, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelPixel6:close()
		element.AbilityWheelPixel7:close()
		element.AbilityWheelPixel8:close()
		element.AbilityWheelPixel9:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

