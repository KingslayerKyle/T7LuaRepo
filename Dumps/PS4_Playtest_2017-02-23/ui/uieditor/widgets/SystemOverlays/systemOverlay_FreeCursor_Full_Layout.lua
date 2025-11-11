require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_alertStatusBar" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_FreeCursor_Full_BasicFrame" )

CoD.systemOverlay_FreeCursor_Full_Layout = InheritFrom( LUI.UIElement )
CoD.systemOverlay_FreeCursor_Full_Layout.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_FreeCursor_Full_Layout )
	self.id = "systemOverlay_FreeCursor_Full_Layout"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( 0, 1, 4, 0 )
	darkbg:setTopBottom( 0, 1, -30, 0 )
	darkbg:setRGB( 0, 0, 0 )
	darkbg:setAlpha( 0.85 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 1, 4, 0 )
	scorestreakVignetteContainer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 1, 0, 0 )
	backing:setTopBottom( 0, 0, 270, 807 )
	backing:setRGB( 0.07, 0.07, 0.08 )
	backing:setAlpha( 0.8 )
	self:addElement( backing )
	self.backing = backing
	
	local Smokebkg = LUI.UIImage.new()
	Smokebkg:setLeftRight( 0.5, 0.5, -960, 960 )
	Smokebkg:setTopBottom( 0, 0, 276, 759 )
	Smokebkg:setRGB( 0.63, 0.61, 0.61 )
	Smokebkg:setAlpha( 0.5 )
	Smokebkg:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Smokebkg )
	self.Smokebkg = Smokebkg
	
	local frameWidget = LUI.UIFrame.new( menu, controller, 0, 0, false )
	frameWidget:setLeftRight( 0.5, 0.5, -960, 960 )
	frameWidget:setTopBottom( 0, 0, 276, 756 )
	frameWidget:linkToElementModel( self, nil, false, function ( model )
		frameWidget:setModel( model, controller )
	end )
	frameWidget:linkToElementModel( self, "frameWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			frameWidget:changeFrameWidget( modelValue )
		end
	end )
	self:addElement( frameWidget )
	self.frameWidget = frameWidget
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( 0, 1, 0, 0 )
	buttonBacking:setTopBottom( 1, 1, -321, -273 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	buttonBacking:setAlpha( 0 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttons:setLeftRight( 0, 0, 614, 1262 )
	buttons:setTopBottom( 1, 1, -321, -273 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local alertStatusBar = CoD.systemOverlay_alertStatusBar.new( menu, controller )
	alertStatusBar:setLeftRight( 0, 1, 0, 0 )
	alertStatusBar:setTopBottom( 0, 0, 270, 276 )
	alertStatusBar:linkToElementModel( self, nil, false, function ( model )
		alertStatusBar:setModel( model, controller )
	end )
	self:addElement( alertStatusBar )
	self.alertStatusBar = alertStatusBar
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( 0, 1, 0, 0 )
	LineLeft:setTopBottom( 1, 1, -324, -318 )
	LineLeft:setAlpha( 0.9 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	self.resetProperties = function ()
		backing:completeAnimation()
		frameWidget:completeAnimation()
		buttonBacking:completeAnimation()
		buttons:completeAnimation()
		alertStatusBar:completeAnimation()
		LineLeft:completeAnimation()
		Smokebkg:completeAnimation()
		darkbg:completeAnimation()
		scorestreakVignetteContainer:completeAnimation()
		backing:setLeftRight( 0, 1, 0, 0 )
		backing:setTopBottom( 0, 0, 270, 807 )
		backing:setAlpha( 0.8 )
		frameWidget:setAlpha( 1 )
		buttonBacking:setAlpha( 0 )
		buttons:setAlpha( 1 )
		alertStatusBar:setLeftRight( 0, 1, 0, 0 )
		alertStatusBar:setTopBottom( 0, 0, 270, 276 )
		alertStatusBar:setAlpha( 1 )
		LineLeft:setAlpha( 0.9 )
		Smokebkg:setAlpha( 0.5 )
		darkbg:setAlpha( 0.85 )
		scorestreakVignetteContainer:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				local darkbgFrame2 = function ( darkbg, event )
					local darkbgFrame3 = function ( darkbg, event )
						if not event.interrupted then
							darkbg:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						darkbg:setAlpha( 0.85 )
						if event.interrupted then
							self.clipFinished( darkbg, event )
						else
							darkbg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						darkbgFrame3( darkbg, event )
						return 
					else
						darkbg:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						darkbg:setAlpha( 0.75 )
						darkbg:registerEventHandler( "transition_complete_keyframe", darkbgFrame3 )
					end
				end
				
				darkbg:completeAnimation()
				self.darkbg:setAlpha( 0 )
				darkbgFrame2( darkbg, {} )
				local scorestreakVignetteContainerFrame2 = function ( scorestreakVignetteContainer, event )
					local scorestreakVignetteContainerFrame3 = function ( scorestreakVignetteContainer, event )
						if not event.interrupted then
							scorestreakVignetteContainer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						scorestreakVignetteContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( scorestreakVignetteContainer, event )
						else
							scorestreakVignetteContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						scorestreakVignetteContainerFrame3( scorestreakVignetteContainer, event )
						return 
					else
						scorestreakVignetteContainer:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						scorestreakVignetteContainer:setAlpha( 0.5 )
						scorestreakVignetteContainer:registerEventHandler( "transition_complete_keyframe", scorestreakVignetteContainerFrame3 )
					end
				end
				
				scorestreakVignetteContainer:completeAnimation()
				self.scorestreakVignetteContainer:setAlpha( 0 )
				scorestreakVignetteContainerFrame2( scorestreakVignetteContainer, {} )
				local backingFrame2 = function ( backing, event )
					local backingFrame3 = function ( backing, event )
						local backingFrame4 = function ( backing, event )
							if not event.interrupted then
								backing:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							backing:setLeftRight( 0, 1, 0, 0 )
							backing:setTopBottom( 0, 0, 269.5, 809.5 )
							backing:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( backing, event )
							else
								backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							backingFrame4( backing, event )
							return 
						else
							backing:beginAnimation( "keyframe", 30, true, false, CoD.TweenType.Linear )
							backing:setAlpha( 1 )
							backing:registerEventHandler( "transition_complete_keyframe", backingFrame4 )
						end
					end
					
					if event.interrupted then
						backingFrame3( backing, event )
						return 
					else
						backing:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						backing:registerEventHandler( "transition_complete_keyframe", backingFrame3 )
					end
				end
				
				backing:completeAnimation()
				self.backing:setLeftRight( 0, 1, 0, 0 )
				self.backing:setTopBottom( 0, 0, 269.5, 809.5 )
				self.backing:setAlpha( 0 )
				backingFrame2( backing, {} )
				local SmokebkgFrame2 = function ( Smokebkg, event )
					local SmokebkgFrame3 = function ( Smokebkg, event )
						if not event.interrupted then
							Smokebkg:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						Smokebkg:setAlpha( 0.75 )
						if event.interrupted then
							self.clipFinished( Smokebkg, event )
						else
							Smokebkg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SmokebkgFrame3( Smokebkg, event )
						return 
					else
						Smokebkg:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Smokebkg:setAlpha( 0.5 )
						Smokebkg:registerEventHandler( "transition_complete_keyframe", SmokebkgFrame3 )
					end
				end
				
				Smokebkg:completeAnimation()
				self.Smokebkg:setAlpha( 0 )
				SmokebkgFrame2( Smokebkg, {} )
				local frameWidgetFrame2 = function ( frameWidget, event )
					local frameWidgetFrame3 = function ( frameWidget, event )
						local frameWidgetFrame4 = function ( frameWidget, event )
							local frameWidgetFrame5 = function ( frameWidget, event )
								local frameWidgetFrame6 = function ( frameWidget, event )
									if not event.interrupted then
										frameWidget:beginAnimation( "keyframe", 9, true, true, CoD.TweenType.Linear )
									end
									frameWidget:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( frameWidget, event )
									else
										frameWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									frameWidgetFrame6( frameWidget, event )
									return 
								else
									frameWidget:beginAnimation( "keyframe", 10, false, true, CoD.TweenType.Linear )
									frameWidget:setAlpha( 0 )
									frameWidget:registerEventHandler( "transition_complete_keyframe", frameWidgetFrame6 )
								end
							end
							
							if event.interrupted then
								frameWidgetFrame5( frameWidget, event )
								return 
							else
								frameWidget:beginAnimation( "keyframe", 9, false, true, CoD.TweenType.Linear )
								frameWidget:setAlpha( 1 )
								frameWidget:registerEventHandler( "transition_complete_keyframe", frameWidgetFrame5 )
							end
						end
						
						if event.interrupted then
							frameWidgetFrame4( frameWidget, event )
							return 
						else
							frameWidget:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							frameWidget:registerEventHandler( "transition_complete_keyframe", frameWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						frameWidgetFrame3( frameWidget, event )
						return 
					else
						frameWidget:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						frameWidget:registerEventHandler( "transition_complete_keyframe", frameWidgetFrame3 )
					end
				end
				
				frameWidget:completeAnimation()
				self.frameWidget:setAlpha( 0 )
				frameWidgetFrame2( frameWidget, {} )
				local buttonBackingFrame2 = function ( buttonBacking, event )
					local buttonBackingFrame3 = function ( buttonBacking, event )
						if not event.interrupted then
							buttonBacking:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						buttonBacking:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( buttonBacking, event )
						else
							buttonBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonBackingFrame3( buttonBacking, event )
						return 
					else
						buttonBacking:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						buttonBacking:registerEventHandler( "transition_complete_keyframe", buttonBackingFrame3 )
					end
				end
				
				buttonBacking:completeAnimation()
				self.buttonBacking:setAlpha( 0 )
				buttonBackingFrame2( buttonBacking, {} )
				local buttonsFrame2 = function ( buttons, event )
					local buttonsFrame3 = function ( buttons, event )
						local buttonsFrame4 = function ( buttons, event )
							if not event.interrupted then
								buttons:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							buttons:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( buttons, event )
							else
								buttons:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							buttonsFrame4( buttons, event )
							return 
						else
							buttons:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							buttons:setAlpha( 1 )
							buttons:registerEventHandler( "transition_complete_keyframe", buttonsFrame4 )
						end
					end
					
					if event.interrupted then
						buttonsFrame3( buttons, event )
						return 
					else
						buttons:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						buttons:registerEventHandler( "transition_complete_keyframe", buttonsFrame3 )
					end
				end
				
				buttons:completeAnimation()
				self.buttons:setAlpha( 0 )
				buttonsFrame2( buttons, {} )
				local alertStatusBarFrame2 = function ( alertStatusBar, event )
					local alertStatusBarFrame3 = function ( alertStatusBar, event )
						if not event.interrupted then
							alertStatusBar:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						alertStatusBar:setLeftRight( 0, 1, 0, 0 )
						alertStatusBar:setTopBottom( 0, 0, 270, 276 )
						alertStatusBar:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( alertStatusBar, event )
						else
							alertStatusBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						alertStatusBarFrame3( alertStatusBar, event )
						return 
					else
						alertStatusBar:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Linear )
						alertStatusBar:setTopBottom( 0, 0, 270, 276 )
						alertStatusBar:setAlpha( 1 )
						alertStatusBar:registerEventHandler( "transition_complete_keyframe", alertStatusBarFrame3 )
					end
				end
				
				alertStatusBar:completeAnimation()
				self.alertStatusBar:setLeftRight( 0, 1, 0, 0 )
				self.alertStatusBar:setTopBottom( 0, 0, -18, -12 )
				self.alertStatusBar:setAlpha( 0 )
				alertStatusBarFrame2( alertStatusBar, {} )
				local LineLeftFrame2 = function ( LineLeft, event )
					local LineLeftFrame3 = function ( LineLeft, event )
						if not event.interrupted then
							LineLeft:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						LineLeft:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LineLeft, event )
						else
							LineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineLeftFrame3( LineLeft, event )
						return 
					else
						LineLeft:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						LineLeft:registerEventHandler( "transition_complete_keyframe", LineLeftFrame3 )
					end
				end
				
				LineLeft:completeAnimation()
				self.LineLeft:setAlpha( 0 )
				LineLeftFrame2( LineLeft, {} )
			end
		}
	}
	frameWidget.id = "frameWidget"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.frameWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.scorestreakVignetteContainer:close()
		self.buttons:close()
		self.alertStatusBar:close()
		self.frameWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

