-- 24a7d04919f11224708885e94a0fba03
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_ClipContainerValue" )

CoD.AmmoWidgetMP_ClipContainerHero = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_ClipContainerHero.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_ClipContainerHero )
	self.id = "AmmoWidgetMP_ClipContainerHero"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 48 )
	
	local Clip = CoD.AmmoWidget_ClipContainerValue.new( menu, controller )
	Clip:setLeftRight( false, false, -57, 51 )
	Clip:setTopBottom( false, false, -22, 20 )
	Clip:setRGB( 0.74, 0.74, 0.74 )
	Clip:subscribeToGlobalModel( controller, "CurrentWeapon", "ammoInClip", function ( model )
		local ammoInClip = Engine.GetModelValue( model )
		if ammoInClip then
			Clip.Clip:setText( ammoInClip )
		end
	end )
	self:addElement( Clip )
	self.Clip = Clip
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Clip:completeAnimation()
				self.Clip:setAlpha( 0 )
				self.clipFinished( Clip, {} )
			end,
			Hero = function ()
				self:setupElementClipCounter( 1 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					Clip:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setAlpha( 0 )
				ClipFrame2( Clip, {} )
			end
		},
		Hero = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Clip:completeAnimation()
				self.Clip:setAlpha( 1 )
				self.clipFinished( Clip, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local ClipFrame2 = function ( Clip, event )
					if not event.interrupted then
						Clip:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					Clip:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Clip, event )
					else
						Clip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Clip:completeAnimation()
				self.Clip:setAlpha( 1 )
				ClipFrame2( Clip, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Clip:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

