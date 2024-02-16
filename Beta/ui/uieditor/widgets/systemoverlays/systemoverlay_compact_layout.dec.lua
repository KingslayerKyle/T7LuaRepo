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
	self:addElement( background )
	self.background = background
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, false, 180, 414 )
	backing:setRGB( 0.07, 0.07, 0.08 )
	backing:setAlpha( 0.9 )
	self:addElement( backing )
	self.backing = backing
	
	local alertStatusBar = CoD.systemOverlay_alertStatusBar.new( menu, controller )
	alertStatusBar:setLeftRight( true, true, 0, 0 )
	alertStatusBar:setTopBottom( true, false, 180, 184 )
	alertStatusBar:linkToElementModel( self, nil, false, function ( model )
		alertStatusBar:setModel( model, controller )
	end )
	self:addElement( alertStatusBar )
	self.alertStatusBar = alertStatusBar
	
	local frameWidget = LUI.UIFrame.new( menu, controller, 0, 0, false )
	frameWidget:setLeftRight( true, true, 0, 0 )
	frameWidget:setTopBottom( true, false, 184, 368 )
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
	buttonBacking:setLeftRight( true, true, 0, 0 )
	buttonBacking:setTopBottom( false, true, -343, -307 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	buttonBacking:setAlpha( 0 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttons:setLeftRight( true, false, 408, 840 )
	buttons:setTopBottom( false, true, -340, -308 )
	self:addElement( buttons )
	self.buttons = buttons
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( true, true, 0, 0 )
	LineLeft:setTopBottom( false, true, -345, -340.85 )
	LineLeft:setAlpha( 0.9 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
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
								backing:setAlpha( 0.95 )
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
								backing:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								backing:setAlpha( 0 )
								backing:registerEventHandler( "transition_complete_keyframe", backingFrame5 )
							end
						end
						
						if event.interrupted then
							backingFrame4( backing, event )
							return 
						else
							backing:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
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
				local alertStatusBarFrame2 = function ( alertStatusBar, event )
					local alertStatusBarFrame3 = function ( alertStatusBar, event )
						local alertStatusBarFrame4 = function ( alertStatusBar, event )
							if not event.interrupted then
								alertStatusBar:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							end
							alertStatusBar:setLeftRight( true, true, 0, 0 )
							alertStatusBar:setTopBottom( true, false, 176, 180 )
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
							alertStatusBar:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
							alertStatusBar:setTopBottom( true, false, 175.4, 179.4 )
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
						frameWidget:beginAnimation( "keyframe", 79, true, true, CoD.TweenType.Linear )
						frameWidget:registerEventHandler( "transition_complete_keyframe", frameWidgetFrame3 )
					end
				end
				
				frameWidget:completeAnimation()
				self.frameWidget:setAlpha( 0 )
				frameWidgetFrame2( frameWidget, {} )
				local buttonBackingFrame2 = function ( buttonBacking, event )
					if not event.interrupted then
						buttonBacking:beginAnimation( "keyframe", 79, true, true, CoD.TweenType.Linear )
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
						buttons:beginAnimation( "keyframe", 79, true, true, CoD.TweenType.Linear )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.frameWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.alertStatusBar:close()
		self.buttons:close()
		self.frameWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

