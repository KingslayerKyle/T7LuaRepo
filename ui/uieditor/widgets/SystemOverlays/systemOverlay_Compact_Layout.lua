-- a914970ac096c952cff349f8062cee65
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_alertStatusBar" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Compact_BasicFrame" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

CoD.systemOverlay_Compact_Layout = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Compact_Layout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Compact_Layout )
	self.id = "systemOverlay_Compact_Layout"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0.8 )
	background:setImage( RegisterImage( "uie_default_white_255" ) )
	self:addElement( background )
	self.background = background
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, false, 180, 414 )
	backing:setRGB( 0.07, 0.07, 0.08 )
	backing:setAlpha( 0.8 )
	self:addElement( backing )
	self.backing = backing
	
	local Ambers = LUI.UIImage.new()
	Ambers:setLeftRight( false, false, -640, 640 )
	Ambers:setTopBottom( true, false, 184, 375 )
	Ambers:setAlpha( 0.25 )
	Ambers:setImage( RegisterImage( "uie_t7_icon_master0_overlays_bkg" ) )
	Ambers:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Ambers )
	self.Ambers = Ambers
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( true, true, 0, 0 )
	buttonBacking:setTopBottom( true, false, 377, 413 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	buttonBacking:setAlpha( 0 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local alertStatusBar = CoD.systemOverlay_alertStatusBar.new( menu, controller )
	alertStatusBar:setLeftRight( true, true, 0, 0 )
	alertStatusBar:setTopBottom( true, false, 180, 184 )
	alertStatusBar:linkToElementModel( self, nil, false, function ( model )
		alertStatusBar:setModel( model, controller )
	end )
	self:addElement( alertStatusBar )
	self.alertStatusBar = alertStatusBar
	
	local frameWidget = LUI.UIFrame.new( menu, controller, 0, 0, false )
	frameWidget:setLeftRight( false, false, -640, 640 )
	frameWidget:setTopBottom( true, false, 184, 368 )
	frameWidget:linkToElementModel( self, nil, false, function ( model )
		frameWidget:setModel( model, controller )
	end )
	frameWidget:linkToElementModel( self, "frameWidget", true, function ( model )
		local _frameWidget = Engine.GetModelValue( model )
		if _frameWidget then
			frameWidget:changeFrameWidget( _frameWidget )
		end
	end )
	self:addElement( frameWidget )
	self.frameWidget = frameWidget
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttons:setLeftRight( false, false, -232, 200 )
	buttons:setTopBottom( true, false, 380, 412 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( true, true, 0, 0 )
	LineLeft:setTopBottom( true, false, 375, 379.15 )
	LineLeft:setAlpha( 0.9 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 0, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.clipFinished( background, {} )
				local backingFrame2 = function ( backing, event )
					local backingFrame3 = function ( backing, event )
						local backingFrame4 = function ( backing, event )
							local backingFrame5 = function ( backing, event )
								if not event.interrupted then
									backing:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								end
								backing:setAlpha( 0.85 )
								if event.interrupted then
									self.clipFinished( backing, event )
								else
									backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								backingFrame5( backing, event )
								return 
							else
								backing:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								backing:setAlpha( 0 )
								backing:registerEventHandler( "transition_complete_keyframe", backingFrame5 )
							end
						end
						
						if event.interrupted then
							backingFrame4( backing, event )
							return 
						else
							backing:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							backing:setAlpha( 1 )
							backing:registerEventHandler( "transition_complete_keyframe", backingFrame4 )
						end
					end
					
					if event.interrupted then
						backingFrame3( backing, event )
						return 
					else
						backing:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						backing:registerEventHandler( "transition_complete_keyframe", backingFrame3 )
					end
				end
				
				backing:completeAnimation()
				self.backing:setAlpha( 0 )
				backingFrame2( backing, {} )
				local AmbersFrame2 = function ( Ambers, event )
					local AmbersFrame3 = function ( Ambers, event )
						local AmbersFrame4 = function ( Ambers, event )
							if not event.interrupted then
								Ambers:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							Ambers:setAlpha( 0.25 )
							Ambers:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
							if event.interrupted then
								self.clipFinished( Ambers, event )
							else
								Ambers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmbersFrame4( Ambers, event )
							return 
						else
							Ambers:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							Ambers:setAlpha( 0.25 )
							Ambers:registerEventHandler( "transition_complete_keyframe", AmbersFrame4 )
						end
					end
					
					if event.interrupted then
						AmbersFrame3( Ambers, event )
						return 
					else
						Ambers:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						Ambers:registerEventHandler( "transition_complete_keyframe", AmbersFrame3 )
					end
				end
				
				Ambers:completeAnimation()
				self.Ambers:setAlpha( 0 )
				self.Ambers:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				AmbersFrame2( Ambers, {} )
				local buttonBackingFrame2 = function ( buttonBacking, event )
					if not event.interrupted then
						buttonBacking:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
					end
					buttonBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( buttonBacking, event )
					else
						buttonBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				buttonBacking:completeAnimation()
				self.buttonBacking:setAlpha( 0 )
				buttonBackingFrame2( buttonBacking, {} )
				local alertStatusBarFrame2 = function ( alertStatusBar, event )
					local alertStatusBarFrame3 = function ( alertStatusBar, event )
						local alertStatusBarFrame4 = function ( alertStatusBar, event )
							if not event.interrupted then
								alertStatusBar:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							end
							alertStatusBar:setLeftRight( true, true, 0, 0 )
							alertStatusBar:setTopBottom( true, false, 180, 184 )
							alertStatusBar:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( alertStatusBar, event )
							else
								alertStatusBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							alertStatusBarFrame4( alertStatusBar, event )
							return 
						else
							alertStatusBar:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							alertStatusBar:setTopBottom( true, false, 177.06, 181.06 )
							alertStatusBar:setAlpha( 0 )
							alertStatusBar:registerEventHandler( "transition_complete_keyframe", alertStatusBarFrame4 )
						end
					end
					
					if event.interrupted then
						alertStatusBarFrame3( alertStatusBar, event )
						return 
					else
						alertStatusBar:beginAnimation( "keyframe", 29, true, false, CoD.TweenType.Linear )
						alertStatusBar:setTopBottom( true, false, 175, 179 )
						alertStatusBar:setAlpha( 1 )
						alertStatusBar:registerEventHandler( "transition_complete_keyframe", alertStatusBarFrame3 )
					end
				end
				
				alertStatusBar:completeAnimation()
				self.alertStatusBar:setLeftRight( true, true, 0, 0 )
				self.alertStatusBar:setTopBottom( true, false, -70, -66 )
				self.alertStatusBar:setAlpha( 0 )
				alertStatusBarFrame2( alertStatusBar, {} )
				local frameWidgetFrame2 = function ( frameWidget, event )
					local frameWidgetFrame3 = function ( frameWidget, event )
						if not event.interrupted then
							frameWidget:beginAnimation( "keyframe", 39, true, true, CoD.TweenType.Linear )
						end
						frameWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( frameWidget, event )
						else
							frameWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						frameWidgetFrame3( frameWidget, event )
						return 
					else
						frameWidget:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
						frameWidget:registerEventHandler( "transition_complete_keyframe", frameWidgetFrame3 )
					end
				end
				
				frameWidget:completeAnimation()
				self.frameWidget:setAlpha( 0 )
				frameWidgetFrame2( frameWidget, {} )
				local buttonsFrame2 = function ( buttons, event )
					local buttonsFrame3 = function ( buttons, event )
						if not event.interrupted then
							buttons:beginAnimation( "keyframe", 39, true, true, CoD.TweenType.Linear )
						end
						buttons:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( buttons, event )
						else
							buttons:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonsFrame3( buttons, event )
						return 
					else
						buttons:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
						buttons:registerEventHandler( "transition_complete_keyframe", buttonsFrame3 )
					end
				end
				
				buttons:completeAnimation()
				self.buttons:setAlpha( 0 )
				buttonsFrame2( buttons, {} )
			end
		}
	}
	frameWidget.id = "frameWidget"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.frameWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.alertStatusBar:close()
		element.buttons:close()
		element.frameWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

