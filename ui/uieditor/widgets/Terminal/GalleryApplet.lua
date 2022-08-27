-- c0e18923ac621812ba78382258bb8a19
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )

CoD.GalleryApplet = InheritFrom( LUI.UIElement )
CoD.GalleryApplet.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GalleryApplet )
	self.id = "GalleryApplet"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 303 )
	self:setTopBottom( true, false, 0, 176 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Generalframe = CoD.Generalframe.new( menu, controller )
	Generalframe:setLeftRight( true, true, 0, 0 )
	Generalframe:setTopBottom( true, true, 0, 0 )
	self:addElement( Generalframe )
	self.Generalframe = Generalframe
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 0, 303 )
	Image:setTopBottom( true, false, 1, 175 )
	Image:setAlpha( 0.85 )
	Image:setImage( RegisterImage( "uie_t7_menu_cp_datavault_galleryimage" ) )
	self:addElement( Image )
	self.Image = Image
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -9, 7.71 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setAlpha( 0 )
	FocusWidget.Name:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	local CallingCardLines000 = LUI.UIImage.new()
	CallingCardLines000:setLeftRight( true, false, 0, 304 )
	CallingCardLines000:setTopBottom( true, false, 176, 194.08 )
	CallingCardLines000:setImage( RegisterImage( "uie_t7_menu_cp_datavault_galleryimage_bottombar" ) )
	self:addElement( CallingCardLines000 )
	self.CallingCardLines000 = CallingCardLines000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 4 )
				local GeneralframeFrame2 = function ( Generalframe, event )
					if not event.interrupted then
						Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Generalframe:setLeftRight( true, true, 0, 0 )
					Generalframe:setTopBottom( true, true, 15, 15 )
					if event.interrupted then
						self.clipFinished( Generalframe, event )
					else
						Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 0, 0 )
				GeneralframeFrame2( Generalframe, {} )
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Image:setLeftRight( true, false, 0, 303 )
					Image:setTopBottom( true, false, 16, 190 )
					Image:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setLeftRight( true, false, 0, 303 )
				self.Image:setTopBottom( true, false, 0, 176 )
				self.Image:setAlpha( 0.85 )
				ImageFrame2( Image, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -9, 7.71 )
					FocusWidget:setTopBottom( true, false, -10, 10 )
					FocusWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, 0, 20 )
				self.FocusWidget:setAlpha( 0 )
				FocusWidgetFrame2( FocusWidget, {} )
				local CallingCardLines000Frame2 = function ( CallingCardLines000, event )
					if not event.interrupted then
						CallingCardLines000:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CallingCardLines000:setLeftRight( true, false, 0, 304 )
					CallingCardLines000:setTopBottom( true, false, 191, 209.08 )
					if event.interrupted then
						self.clipFinished( CallingCardLines000, event )
					else
						CallingCardLines000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCardLines000:completeAnimation()
				self.CallingCardLines000:setLeftRight( true, false, 0, 304 )
				self.CallingCardLines000:setTopBottom( true, false, 176, 194.08 )
				CallingCardLines000Frame2( CallingCardLines000, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 15, 15 )
				self.clipFinished( Generalframe, {} )
				Image:completeAnimation()
				self.Image:setLeftRight( true, false, 0, 303 )
				self.Image:setTopBottom( true, false, 16, 190 )
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				self.clipFinished( FocusWidget, {} )
				CallingCardLines000:completeAnimation()
				self.CallingCardLines000:setLeftRight( true, false, 0, 304 )
				self.CallingCardLines000:setTopBottom( true, false, 191, 209.08 )
				self.clipFinished( CallingCardLines000, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )
				local GeneralframeFrame2 = function ( Generalframe, event )
					if not event.interrupted then
						Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Generalframe:setLeftRight( true, true, 0, 0 )
					Generalframe:setTopBottom( true, true, 0, 0 )
					if event.interrupted then
						self.clipFinished( Generalframe, event )
					else
						Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 15, 15 )
				GeneralframeFrame2( Generalframe, {} )
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Image:setLeftRight( true, false, 0, 303 )
					Image:setTopBottom( true, false, 0, 176 )
					Image:setAlpha( 0.85 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setLeftRight( true, false, 0, 303 )
				self.Image:setTopBottom( true, false, 16, 190 )
				self.Image:setAlpha( 1 )
				ImageFrame2( Image, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -9, 7.71 )
					FocusWidget:setTopBottom( true, false, 0, 20 )
					FocusWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -9, 7.71 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				FocusWidgetFrame2( FocusWidget, {} )
				local CallingCardLines000Frame2 = function ( CallingCardLines000, event )
					if not event.interrupted then
						CallingCardLines000:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					CallingCardLines000:setLeftRight( true, false, 0, 304 )
					CallingCardLines000:setTopBottom( true, false, 176, 194.08 )
					if event.interrupted then
						self.clipFinished( CallingCardLines000, event )
					else
						CallingCardLines000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CallingCardLines000:completeAnimation()
				self.CallingCardLines000:setLeftRight( true, false, 0, 304 )
				self.CallingCardLines000:setTopBottom( true, false, 191, 209.08 )
				CallingCardLines000Frame2( CallingCardLines000, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Generalframe:close()
		element.FocusWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

