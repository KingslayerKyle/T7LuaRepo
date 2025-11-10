require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetElemSide" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.LoadingAnimation.LoadingScreenHeaderFooter" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.LoadingScreenHeaderFooter.LoadingBar:subscribeToGlobalModel( f1_arg1, "LoadingScreenTeamInfo", "loadedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.LoadingScreenHeaderFooter.LoadingBar:setShaderVector( 0, modelValue, 0, 0, 0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( f1_arg0, "close", function ( element )
		element.LoadingScreenHeaderFooter.LoadingBar:close()
	end )
end

LUI.createMenu.LoadingScreenOverlayForFreeRun = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LoadingScreenOverlayForFreeRun" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LoadingScreenOverlayForFreeRun.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local backgroundImage = LUI.UIImage.new()
	backgroundImage:setLeftRight( true, true, 0, 0 )
	backgroundImage:setTopBottom( true, true, 0, 0 )
	backgroundImage:setImage( RegisterImage( MapNameToMapLoadingImage( GetCurrentMapID( "uie_img_t7_menu_mp_loadscreen_sector" ) ) ) )
	backgroundImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_expensive_blur" ) )
	backgroundImage:setShaderVector( 0, 0, 0, 0, 0 )
	backgroundImage:setShaderVector( 1, 1, 0, 0, 0 )
	self:addElement( backgroundImage )
	self.backgroundImage = backgroundImage
	
	local Fade = LUI.UIImage.new()
	Fade:setLeftRight( false, false, -651, 651 )
	Fade:setTopBottom( false, false, -376, 372 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local LoadingElem2 = CoD.TeamIconAndNameWidgetElemSide.new( self, controller )
	LoadingElem2:setLeftRight( false, true, -66.1, -37.1 )
	LoadingElem2:setTopBottom( true, false, 674, 700 )
	LoadingElem2:setYRot( -180 )
	self:addElement( LoadingElem2 )
	self.LoadingElem2 = LoadingElem2
	
	local LoadingElem1 = CoD.TeamIconAndNameWidgetElemSide.new( self, controller )
	LoadingElem1:setLeftRight( false, true, -1240.1, -1211.1 )
	LoadingElem1:setTopBottom( true, false, 674.5, 701.5 )
	self:addElement( LoadingElem1 )
	self.LoadingElem1 = LoadingElem1
	
	local LoadingStatusBox = CoD.FE_TitleNumBrdr.new( self, controller )
	LoadingStatusBox:setLeftRight( true, false, 64, 232 )
	LoadingStatusBox:setTopBottom( false, false, 308, 332 )
	LoadingStatusBox:setAlpha( 0 )
	self:addElement( LoadingStatusBox )
	self.LoadingStatusBox = LoadingStatusBox
	
	local LoadingStatus = LUI.UIText.new()
	LoadingStatus:setLeftRight( true, false, 64, 231 )
	LoadingStatus:setTopBottom( false, false, 311, 327 )
	LoadingStatus:setRGB( 0.52, 0.58, 0.6 )
	LoadingStatus:setAlpha( 0 )
	LoadingStatus:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LoadingStatus:setLetterSpacing( 0.5 )
	LoadingStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LoadingStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	LoadingStatus:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "statusText", function ( model )
		local statusText = Engine.GetModelValue( model )
		if statusText then
			LoadingStatus:setText( Engine.Localize( statusText ) )
		end
	end )
	self:addElement( LoadingStatus )
	self.LoadingStatus = LoadingStatus
	
	local LoadingScreenHeaderFooter = CoD.LoadingScreenHeaderFooter.new( self, controller )
	LoadingScreenHeaderFooter:setLeftRight( true, false, 0, 1280 )
	LoadingScreenHeaderFooter:setTopBottom( true, false, 0, 720 )
	LoadingScreenHeaderFooter:registerEventHandler( "menu_loaded", function ( element, event )
		local f6_local0 = nil
		SizeToSafeArea( element, controller )
		PlayClipOnElement( self, {
			elementName = "LoadingScreenHeaderFooter",
			clipName = "StartLoading"
		}, controller )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:addElement( LoadingScreenHeaderFooter )
	self.LoadingScreenHeaderFooter = LoadingScreenHeaderFooter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self:setupElementClipCounter( 5 )
				local FadeFrame2 = function ( Fade, event )
					if not event.interrupted then
						Fade:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Fade:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fade, event )
					else
						Fade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fade:completeAnimation()
				self.Fade:setAlpha( 1 )
				FadeFrame2( Fade, {} )
				local LoadingElem2Frame2 = function ( LoadingElem2, event )
					local LoadingElem2Frame3 = function ( LoadingElem2, event )
						if not event.interrupted then
							LoadingElem2:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						LoadingElem2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingElem2, event )
						else
							LoadingElem2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingElem2Frame3( LoadingElem2, event )
						return 
					else
						LoadingElem2:beginAnimation( "keyframe", 2210, false, false, CoD.TweenType.Linear )
						LoadingElem2:registerEventHandler( "transition_complete_keyframe", LoadingElem2Frame3 )
					end
				end
				
				LoadingElem2:completeAnimation()
				self.LoadingElem2:setAlpha( 0 )
				LoadingElem2Frame2( LoadingElem2, {} )
				local LoadingElem1Frame2 = function ( LoadingElem1, event )
					local LoadingElem1Frame3 = function ( LoadingElem1, event )
						if not event.interrupted then
							LoadingElem1:beginAnimation( "keyframe", 130, false, true, CoD.TweenType.Linear )
						end
						LoadingElem1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingElem1, event )
						else
							LoadingElem1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingElem1Frame3( LoadingElem1, event )
						return 
					else
						LoadingElem1:beginAnimation( "keyframe", 2250, false, false, CoD.TweenType.Linear )
						LoadingElem1:registerEventHandler( "transition_complete_keyframe", LoadingElem1Frame3 )
					end
				end
				
				LoadingElem1:completeAnimation()
				self.LoadingElem1:setAlpha( 0 )
				LoadingElem1Frame2( LoadingElem1, {} )
				local LoadingStatusBoxFrame2 = function ( LoadingStatusBox, event )
					local LoadingStatusBoxFrame3 = function ( LoadingStatusBox, event )
						if not event.interrupted then
							LoadingStatusBox:beginAnimation( "keyframe", 240, false, true, CoD.TweenType.Linear )
						end
						LoadingStatusBox:setLeftRight( true, false, 64, 232 )
						LoadingStatusBox:setTopBottom( false, false, 308, 332 )
						LoadingStatusBox:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LoadingStatusBox, event )
						else
							LoadingStatusBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingStatusBoxFrame3( LoadingStatusBox, event )
						return 
					else
						LoadingStatusBox:beginAnimation( "keyframe", 1919, false, false, CoD.TweenType.Linear )
						LoadingStatusBox:registerEventHandler( "transition_complete_keyframe", LoadingStatusBoxFrame3 )
					end
				end
				
				LoadingStatusBox:completeAnimation()
				self.LoadingStatusBox:setLeftRight( true, false, 64, 232 )
				self.LoadingStatusBox:setTopBottom( false, false, 347, 371 )
				self.LoadingStatusBox:setAlpha( 0 )
				LoadingStatusBoxFrame2( LoadingStatusBox, {} )
				local LoadingStatusFrame2 = function ( LoadingStatus, event )
					local LoadingStatusFrame3 = function ( LoadingStatus, event )
						if not event.interrupted then
							LoadingStatus:beginAnimation( "keyframe", 220, false, true, CoD.TweenType.Linear )
						end
						LoadingStatus:setLeftRight( true, false, 64, 232 )
						LoadingStatus:setTopBottom( false, false, 310, 329 )
						LoadingStatus:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( LoadingStatus, event )
						else
							LoadingStatus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingStatusFrame3( LoadingStatus, event )
						return 
					else
						LoadingStatus:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						LoadingStatus:registerEventHandler( "transition_complete_keyframe", LoadingStatusFrame3 )
					end
				end
				
				LoadingStatus:completeAnimation()
				self.LoadingStatus:setLeftRight( true, false, 64, 231 )
				self.LoadingStatus:setTopBottom( false, false, 351, 369 )
				self.LoadingStatus:setAlpha( 0 )
				LoadingStatusFrame2( LoadingStatus, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LoadingElem2:close()
		element.LoadingElem1:close()
		element.LoadingStatusBox:close()
		element.LoadingScreenHeaderFooter:close()
		element.LoadingStatus:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LoadingScreenOverlayForFreeRun.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

