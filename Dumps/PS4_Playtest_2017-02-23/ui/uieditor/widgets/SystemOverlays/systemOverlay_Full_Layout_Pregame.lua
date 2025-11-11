require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_alertStatusBar" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Full_BasicFrame" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )

CoD.systemOverlay_Full_Layout_Pregame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Full_Layout_Pregame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Full_Layout_Pregame )
	self.id = "systemOverlay_Full_Layout_Pregame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlackBackground = LUI.UIImage.new()
	BlackBackground:setLeftRight( 0, 1, 0, 0 )
	BlackBackground:setTopBottom( 0, 1, 0, 0 )
	BlackBackground:setRGB( 0, 0, 0 )
	self:addElement( BlackBackground )
	self.BlackBackground = BlackBackground
	
	local MapImage = LUI.UIImage.new()
	MapImage:setLeftRight( 0, 1, 0, 0 )
	MapImage:setTopBottom( 0, 1, 0, 0 )
	MapImage:setupUIStreamedImage( 0 )
	MapImage:subscribeToGlobalModel( controller, "MapInfo", "mapImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MapImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( MapImage )
	self.MapImage = MapImage
	
	local Darken = LUI.UIImage.new()
	Darken:setLeftRight( 0, 1, 0, 0 )
	Darken:setTopBottom( 0, 1, 0, 0 )
	Darken:setRGB( 0, 0, 0 )
	Darken:setAlpha( 0.47 )
	self:addElement( Darken )
	self.Darken = Darken
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( menu, controller )
	VignetteBack:setLeftRight( 0, 0, 0, 1920 )
	VignetteBack:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 1, 0, 0 )
	backing:setTopBottom( 0, 0, 270, 807 )
	backing:setRGB( 0.07, 0.07, 0.08 )
	backing:setAlpha( 0.8 )
	self:addElement( backing )
	self.backing = backing
	
	local Smokebkg = LUI.UIImage.new()
	Smokebkg:setLeftRight( 0, 0, 0, 1920 )
	Smokebkg:setTopBottom( 0, 0, 276, 828 )
	Smokebkg:setRGB( 0.63, 0.61, 0.61 )
	Smokebkg:setAlpha( 0.5 )
	Smokebkg:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Smokebkg )
	self.Smokebkg = Smokebkg
	
	local frameWidget = LUI.UIFrame.new( menu, controller, 0, 0, false )
	frameWidget:setLeftRight( 0, 1, 0, 0 )
	frameWidget:setTopBottom( 0, 0, 276, 828 )
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
	buttonBacking:setTopBottom( 1, 1, -274, -226 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttons:setLeftRight( 0, 0, 612, 1260 )
	buttons:setTopBottom( 1, 1, -274, -226 )
	buttons:linkToElementModel( self, nil, false, function ( model )
		buttons:setModel( model, controller )
	end )
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
	LineLeft:setTopBottom( 1, 1, -277, -271 )
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
		backing:setLeftRight( 0, 1, 0, 0 )
		backing:setTopBottom( 0, 0, 270, 807 )
		backing:setAlpha( 0.8 )
		frameWidget:setAlpha( 1 )
		buttonBacking:setAlpha( 1 )
		buttons:setAlpha( 1 )
		alertStatusBar:setLeftRight( 0, 1, 0, 0 )
		alertStatusBar:setTopBottom( 0, 0, 270, 276 )
		alertStatusBar:setAlpha( 1 )
		LineLeft:setAlpha( 0.9 )
		Smokebkg:setAlpha( 0.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
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
						buttonBacking:setAlpha( 1 )
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
		self.VignetteBack:close()
		self.buttons:close()
		self.alertStatusBar:close()
		self.MapImage:close()
		self.frameWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

