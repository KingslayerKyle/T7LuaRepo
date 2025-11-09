CoD.OutOfBounds = InheritFrom( LUI.UIElement )
CoD.OutOfBounds.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OutOfBounds )
	self.id = "OutOfBounds"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 80 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, -332.07, 327.93 )
	Image2:setTopBottom( false, false, -240.6, 215.4 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setAlpha( 0 )
	Image2:setZoom( -50 )
	Image2:setImage( RegisterImage( "uie_t7_hud_outofbounds_notification" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -332.98, 327.02 )
	Image1:setTopBottom( false, false, -240.6, 215.4 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setAlpha( 0 )
	Image1:setImage( RegisterImage( "uie_t7_hud_outofbounds_notification" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -332.98, 327.02 )
	Image0:setTopBottom( false, false, -240.6, 215.4 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_hud_outofbounds_notification" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Timer = LUI.UITightText.new()
	Timer:setLeftRight( true, true, 157.93, -162.07 )
	Timer:setTopBottom( false, true, -130, -95.71 )
	Timer:setRGB( 1, 1, 1 )
	Timer:setAlpha( 0 )
	Timer:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Timer:subscribeToGlobalModel( controller, "HUDItems", "outOfBoundsEndTime", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Timer:setupEndTimer( modelValue )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 9.23, 382.23 )
	TextBox0:setTopBottom( true, false, 28.78, 57.11 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setAlpha( 0 )
	TextBox0:setText( Engine.Localize( "RETURN TO COMBAT ZONE" ) )
	TextBox0:setTTF( "fonts/Entovo.ttf" )
	TextBox0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox0:setShaderVector( 0, 0.1, 0, 0, 0 )
	TextBox0:setShaderVector( 1, 0.15, 0, 0, 0 )
	TextBox0:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox0:setLetterSpacing( 3.9 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		},
		IsOutOfBounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local Image1Frame2 = function ( Image1, event )
					if not event.interrupted then
						Image1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Image1:setAlpha( 0.3 )
					Image1:setZoom( -60 )
					if event.interrupted then
						self.clipFinished( Image1, event )
					else
						Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.Image1:setZoom( -60 )
				Image1Frame2( Image1, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local TimerFrame2 = function ( Timer, event )
					if not event.interrupted then
						Timer:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Timer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Timer, event )
					else
						Timer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				TimerFrame2( Timer, {} )
				local TextBox0Frame2 = function ( TextBox0, event )
					if not event.interrupted then
						TextBox0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					TextBox0:setLeftRight( true, false, 9.23, 382.23 )
					TextBox0:setTopBottom( true, false, 28.78, 57.11 )
					TextBox0:setRGB( 1, 1, 1 )
					TextBox0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TextBox0, event )
					else
						TextBox0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox0:completeAnimation()
				self.TextBox0:setLeftRight( true, false, 9.23, 382.23 )
				self.TextBox0:setTopBottom( true, false, 28.78, 57.11 )
				self.TextBox0:setRGB( 1, 1, 1 )
				self.TextBox0:setAlpha( 0 )
				TextBox0Frame2( TextBox0, {} )
			end
		}
	}
	self.close = function ( self )
		self.Timer:close()
		CoD.OutOfBounds.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

