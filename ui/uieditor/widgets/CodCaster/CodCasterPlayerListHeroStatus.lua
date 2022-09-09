-- 4a3f29a4967be2365fc3db724777e497
-- This hash is used for caching, delete to decompile the file again

CoD.CodCasterPlayerListHeroStatus = InheritFrom( LUI.UIElement )
CoD.CodCasterPlayerListHeroStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterPlayerListHeroStatus )
	self.id = "CodCasterPlayerListHeroStatus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 10 )
	self:setTopBottom( true, false, 0, 20 )
	
	local YellowFlash = LUI.UIImage.new()
	YellowFlash:setLeftRight( false, false, -313, 2.5 )
	YellowFlash:setTopBottom( false, false, 10, -10 )
	YellowFlash:setRGB( 1, 0.93, 0 )
	YellowFlash:setAlpha( 0.3 )
	YellowFlash:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_gradient" ) )
	YellowFlash:setShaderVector( 0, 0, 0, 0, 0 )
	YellowFlash:setShaderVector( 1, 1, 1, 0, 1 )
	YellowFlash:setShaderVector( 2, 0.4, 0, 0, 0 )
	self:addElement( YellowFlash )
	self.YellowFlash = YellowFlash
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( false, false, -5, 25.91 )
	GlowOrangeOver:setTopBottom( false, false, -64.52, 64.52 )
	GlowOrangeOver:setRGB( 1, 0.93, 0 )
	GlowOrangeOver:setAlpha( 0.2 )
	GlowOrangeOver:setZRot( 90 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -5, 0.5 )
	Background:setTopBottom( false, false, -9, 9 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.4 )
	self:addElement( Background )
	self.Background = Background
	
	local Pulse = LUI.UIImage.new()
	Pulse:setLeftRight( false, false, -3.5, -2 )
	Pulse:setTopBottom( false, false, -8, 8 )
	Pulse:setRGB( 1, 0.93, 0 )
	self:addElement( Pulse )
	self.Pulse = Pulse
	
	local Fill = LUI.UIImage.new()
	Fill:setLeftRight( false, false, -3.5, -2 )
	Fill:setTopBottom( false, false, -8, 8 )
	Fill:setZRot( 180 )
	Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	Fill:setShaderVector( 0, 1, 0, 0, 0 )
	Fill:setShaderVector( 1, 0, 0, 0, 0 )
	Fill:setShaderVector( 3, 0, 0, 0, 0 )
	Fill:linkToElementModel( self, "heroProgress", true, function ( model )
		local heroProgress = Engine.GetModelValue( model )
		if heroProgress then
			Fill:setShaderVector( 2, ScaleVector( 0.01, CoD.GetVectorComponentFromString( heroProgress, 1 ), CoD.GetVectorComponentFromString( heroProgress, 2 ), CoD.GetVectorComponentFromString( heroProgress, 3 ), CoD.GetVectorComponentFromString( heroProgress, 4 ) ) )
		end
	end )
	self:addElement( Fill )
	self.Fill = Fill
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				YellowFlash:completeAnimation()
				self.YellowFlash:setAlpha( 0 )
				self.clipFinished( YellowFlash, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				Pulse:completeAnimation()
				self.Pulse:setAlpha( 0 )
				self.clipFinished( Pulse, {} )

				Fill:completeAnimation()
				self.Fill:setAlpha( 1 )
				self.clipFinished( Fill, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local YellowFlashFrame2 = function ( YellowFlash, event )
					local YellowFlashFrame3 = function ( YellowFlash, event )
						if not event.interrupted then
							YellowFlash:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						end
						YellowFlash:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( YellowFlash, event )
						else
							YellowFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						YellowFlashFrame3( YellowFlash, event )
						return 
					else
						YellowFlash:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						YellowFlash:setAlpha( 0 )
						YellowFlash:registerEventHandler( "transition_complete_keyframe", YellowFlashFrame3 )
					end
				end
				
				YellowFlash:completeAnimation()
				self.YellowFlash:setAlpha( 0.3 )
				YellowFlashFrame2( YellowFlash, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					if not event.interrupted then
						GlowOrangeOver:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					GlowOrangeOver:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowOrangeOver, event )
					else
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.3 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				Pulse:completeAnimation()
				self.Pulse:setLeftRight( true, true, 0, 0 )
				self.Pulse:setTopBottom( true, true, 0, 0 )
				self.Pulse:setAlpha( 0 )
				self.Pulse:setScale( 1 )
				self.clipFinished( Pulse, {} )

				Fill:completeAnimation()
				self.Fill:setRGB( 1, 0.94, 0 )
				self.clipFinished( Fill, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Primed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local YellowFlashFrame2 = function ( YellowFlash, event )
					local YellowFlashFrame3 = function ( YellowFlash, event )
						if not event.interrupted then
							YellowFlash:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						end
						YellowFlash:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( YellowFlash, event )
						else
							YellowFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						YellowFlashFrame3( YellowFlash, event )
						return 
					else
						YellowFlash:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						YellowFlash:setAlpha( 0 )
						YellowFlash:registerEventHandler( "transition_complete_keyframe", YellowFlashFrame3 )
					end
				end
				
				YellowFlash:completeAnimation()
				self.YellowFlash:setAlpha( 0.3 )
				YellowFlashFrame2( YellowFlash, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					if not event.interrupted then
						GlowOrangeOver:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					GlowOrangeOver:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowOrangeOver, event )
					else
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.3 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				Pulse:completeAnimation()
				self.Pulse:setLeftRight( true, true, 0, 0 )
				self.Pulse:setTopBottom( true, true, 0, 0 )
				self.Pulse:setAlpha( 0 )
				self.Pulse:setScale( 1 )
				self.clipFinished( Pulse, {} )

				Fill:completeAnimation()
				self.Fill:setRGB( 1, 0.95, 0 )
				self.clipFinished( Fill, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				local YellowFlashFrame2 = function ( YellowFlash, event )
					if not event.interrupted then
						YellowFlash:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					YellowFlash:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( YellowFlash, event )
					else
						YellowFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				YellowFlash:completeAnimation()
				self.YellowFlash:setAlpha( 0 )
				YellowFlashFrame2( YellowFlash, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					if not event.interrupted then
						GlowOrangeOver:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					GlowOrangeOver:setAlpha( 0.3 )
					if event.interrupted then
						self.clipFinished( GlowOrangeOver, event )
					else
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				Pulse:completeAnimation()
				self.Pulse:setAlpha( 0 )
				self.clipFinished( Pulse, {} )
				local FillFrame2 = function ( Fill, event )
					if not event.interrupted then
						Fill:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					Fill:setRGB( 1, 0.97, 0 )
					Fill:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Fill, event )
					else
						Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 1 )
				FillFrame2( Fill, {} )
			end,
			Charging = function ()
				self:setupElementClipCounter( 4 )

				local YellowFlashFrame2 = function ( YellowFlash, event )
					local YellowFlashFrame3 = function ( YellowFlash, event )
						if not event.interrupted then
							YellowFlash:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						end
						YellowFlash:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( YellowFlash, event )
						else
							YellowFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						YellowFlashFrame3( YellowFlash, event )
						return 
					else
						YellowFlash:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						YellowFlash:setAlpha( 0 )
						YellowFlash:registerEventHandler( "transition_complete_keyframe", YellowFlashFrame3 )
					end
				end
				
				YellowFlash:completeAnimation()
				self.YellowFlash:setAlpha( 0.3 )
				YellowFlashFrame2( YellowFlash, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					if not event.interrupted then
						GlowOrangeOver:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					GlowOrangeOver:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GlowOrangeOver, event )
					else
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0.3 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )

				Pulse:completeAnimation()
				self.Pulse:setLeftRight( true, true, 0, 0 )
				self.Pulse:setTopBottom( true, true, 0, 0 )
				self.Pulse:setAlpha( 0 )
				self.Pulse:setScale( 1 )
				self.clipFinished( Pulse, {} )

				Fill:completeAnimation()
				self.Fill:setRGB( 1, 0.95, 0 )
				self.clipFinished( Fill, {} )
			end
		},
		Charging = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				YellowFlash:completeAnimation()
				self.YellowFlash:setAlpha( 0 )
				self.clipFinished( YellowFlash, {} )

				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )

				Pulse:completeAnimation()
				self.Pulse:setAlpha( 0 )
				self.clipFinished( Pulse, {} )

				Fill:completeAnimation()
				self.Fill:setRGB( 1, 1, 1 )
				self.Fill:setAlpha( 1 )
				self.clipFinished( Fill, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "heroState", Enum.HeroState.HERO_STATE_ACTIVE )
			end
		},
		{
			stateName = "Primed",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "heroState", Enum.HeroState.HERO_STATE_PRIMED )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "heroState", Enum.HeroState.HERO_STATE_READY )
			end
		},
		{
			stateName = "Charging",
			condition = function ( menu, element, event )
				return IsSelfModelValueEnumBitSet( element, controller, "heroState", Enum.HeroState.HERO_STATE_CHARGING )
			end
		}
	} )
	self:linkToElementModel( self, "heroState", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "heroState"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Fill:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
