-- 24fae2b50f15fbd50a62885869493814
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetElemSide" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenHeroListWidget" )
require( "ui.uieditor.widgets.LoadingAnimation.LoadingScreenHeaderFooter" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 160 * f1_arg1 + 2 * (f1_arg1 - 1)
	local f1_local1 = 640 - f1_local0 / 2
	f1_arg0:setLeftRight( true, false, f1_local1, f1_local1 + f1_local0 )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.LoadingScreenHeaderFooter.LoadingBar:subscribeToGlobalModel( f2_arg1, "LoadingScreenTeamInfo", "loadedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f2_arg0.LoadingScreenHeaderFooter.LoadingBar:setShaderVector( 0, modelValue, 0, 0, 0 )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( f2_arg0, "close", function ( element )
		element.LoadingScreenHeaderFooter.LoadingBar:close()
	end )
	local f2_local0 = DataSources.LoadingScreenPlayerListTeam1.getCount( f2_arg0.Team1PlayerList )
	local f2_local1 = 4
	if f2_local0 > 8 and f2_local0 < 11 then
		f2_arg0.Team1PlayerList:setHorizontalCount( 5 )
		f2_local1 = 5
	elseif f2_local0 > 10 then
		f2_arg0.Team1PlayerList:setHorizontalCount( 6 )
		f2_local1 = 6
	else
		f2_arg0.Team1PlayerList:setHorizontalCount( 4 )
	end
	if f2_local0 < 4 then
		f2_local1 = f2_local0
	end
	f0_local0( f2_arg0.Team1PlayerList, f2_local1 )
end

LUI.createMenu.LoadingScreenOverlayForNonTeamGames = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LoadingScreenOverlayForNonTeamGames" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LoadingScreenOverlayForNonTeamGames.buttonPrompts" )
	local f5_local1 = self
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
	Fade:setLeftRight( false, false, -669, 651 )
	Fade:setTopBottom( false, false, -376, 372 )
	Fade:setRGB( 0, 0, 0 )
	Fade:setAlpha( 0 )
	self:addElement( Fade )
	self.Fade = Fade
	
	local BLACKfade = LUI.UIImage.new()
	BLACKfade:setLeftRight( true, true, 0, 0 )
	BLACKfade:setTopBottom( true, true, 0, 0 )
	BLACKfade:setRGB( 0, 0, 0 )
	BLACKfade:setAlpha( 0 )
	self:addElement( BLACKfade )
	self.BLACKfade = BLACKfade
	
	local Team1Vignette = LUI.UIImage.new()
	Team1Vignette:setLeftRight( true, false, 0, 1280 )
	Team1Vignette:setTopBottom( true, false, 370, 554 )
	Team1Vignette:setAlpha( 0.44 )
	Team1Vignette:setXRot( -180 )
	Team1Vignette:setImage( RegisterImage( "uie_t7_mp_menu_startflow_vignette" ) )
	Team1Vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Team1Vignette )
	self.Team1Vignette = Team1Vignette
	
	local LoadingElem2 = CoD.TeamIconAndNameWidgetElemSide.new( f5_local1, controller )
	LoadingElem2:setLeftRight( false, true, -66.1, -37.1 )
	LoadingElem2:setTopBottom( true, false, 674, 700 )
	LoadingElem2:setYRot( -180 )
	self:addElement( LoadingElem2 )
	self.LoadingElem2 = LoadingElem2
	
	local LoadingElem1 = CoD.TeamIconAndNameWidgetElemSide.new( f5_local1, controller )
	LoadingElem1:setLeftRight( false, true, -1241.1, -1212.1 )
	LoadingElem1:setTopBottom( true, false, 673.5, 700.5 )
	self:addElement( LoadingElem1 )
	self.LoadingElem1 = LoadingElem1
	
	local LoadingStatusBox = CoD.FE_TitleNumBrdr.new( f5_local1, controller )
	LoadingStatusBox:setLeftRight( true, false, 64, 232 )
	LoadingStatusBox:setTopBottom( false, false, 308, 332 )
	LoadingStatusBox:setAlpha( 0 )
	self:addElement( LoadingStatusBox )
	self.LoadingStatusBox = LoadingStatusBox
	
	local Team1Line = LUI.UIImage.new()
	Team1Line:setLeftRight( true, true, -11, 11 )
	Team1Line:setTopBottom( false, false, 6, 14 )
	Team1Line:setAlpha( 0.2 )
	Team1Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line )
	self.Team1Line = Team1Line
	
	local Team1PlayerList = LUI.UIList.new( f5_local1, controller, 5, 0, nil, false, false, 0, 0, false, false )
	Team1PlayerList:makeFocusable()
	Team1PlayerList:setLeftRight( false, false, -492.5, 492.5 )
	Team1PlayerList:setTopBottom( true, false, 278, 623 )
	Team1PlayerList:setDataSource( "LoadingScreenPlayerListTeam1" )
	Team1PlayerList:setWidgetType( CoD.LoadingScreenHeroListWidget )
	Team1PlayerList:setHorizontalCount( 6 )
	Team1PlayerList:setVerticalCount( 2 )
	Team1PlayerList:setSpacing( 5 )
	Team1PlayerList:mergeStateConditions( {
		{
			stateName = "FFA",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Team1PlayerList )
	self.Team1PlayerList = Team1PlayerList
	
	local LoadingScreenHeaderFooter = CoD.LoadingScreenHeaderFooter.new( f5_local1, controller )
	LoadingScreenHeaderFooter:setLeftRight( false, false, -640, 640 )
	LoadingScreenHeaderFooter:setTopBottom( false, false, -360, 360 )
	LoadingScreenHeaderFooter:registerEventHandler( "menu_loaded", function ( element, event )
		local f7_local0 = nil
		SizeToSafeArea( element, controller )
		PlayClipOnElement( self, {
			elementName = "LoadingScreenHeaderFooter",
			clipName = "StartLoading"
		}, controller )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:addElement( LoadingScreenHeaderFooter )
	self.LoadingScreenHeaderFooter = LoadingScreenHeaderFooter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self:setupElementClipCounter( 9 )
				local f9_local0 = function ( f10_arg0, f10_arg1 )
					if not f10_arg1.interrupted then
						f10_arg0:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
					end
					f10_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_expensive_blur" ) )
					f10_arg0:setShaderVector( 0, 1, 0, 0, 0 )
					f10_arg0:setShaderVector( 1, 2, 0, 0, 0 )
					if f10_arg1.interrupted then
						self.clipFinished( f10_arg0, f10_arg1 )
					else
						f10_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				backgroundImage:beginAnimation( "keyframe", 790, false, false, CoD.TweenType.Linear )
				backgroundImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_expensive_blur" ) )
				backgroundImage:setShaderVector( 0, 0, 0, 0, 0 )
				backgroundImage:setShaderVector( 1, 2, 0, 0, 0 )
				backgroundImage:registerEventHandler( "transition_complete_keyframe", f9_local0 )
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
				local BLACKfadeFrame2 = function ( BLACKfade, event )
					local BLACKfadeFrame3 = function ( BLACKfade, event )
						if not event.interrupted then
							BLACKfade:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
						end
						BLACKfade:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( BLACKfade, event )
						else
							BLACKfade:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BLACKfadeFrame3( BLACKfade, event )
						return 
					else
						BLACKfade:beginAnimation( "keyframe", 1070, false, false, CoD.TweenType.Linear )
						BLACKfade:registerEventHandler( "transition_complete_keyframe", BLACKfadeFrame3 )
					end
				end
				
				BLACKfade:completeAnimation()
				self.BLACKfade:setAlpha( 0 )
				BLACKfadeFrame2( BLACKfade, {} )
				local Team1VignetteFrame2 = function ( Team1Vignette, event )
					local Team1VignetteFrame3 = function ( Team1Vignette, event )
						if not event.interrupted then
							Team1Vignette:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
						end
						Team1Vignette:setAlpha( 0.44 )
						if event.interrupted then
							self.clipFinished( Team1Vignette, event )
						else
							Team1Vignette:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1VignetteFrame3( Team1Vignette, event )
						return 
					else
						Team1Vignette:beginAnimation( "keyframe", 1360, false, false, CoD.TweenType.Linear )
						Team1Vignette:registerEventHandler( "transition_complete_keyframe", Team1VignetteFrame3 )
					end
				end
				
				Team1Vignette:completeAnimation()
				self.Team1Vignette:setAlpha( 0 )
				Team1VignetteFrame2( Team1Vignette, {} )
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
				local Team1LineFrame2 = function ( Team1Line, event )
					local Team1LineFrame3 = function ( Team1Line, event )
						if not event.interrupted then
							Team1Line:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						end
						Team1Line:setLeftRight( true, true, -11, 11 )
						Team1Line:setTopBottom( false, false, 6, 14 )
						Team1Line:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( Team1Line, event )
						else
							Team1Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1LineFrame3( Team1Line, event )
						return 
					else
						Team1Line:beginAnimation( "keyframe", 1389, false, false, CoD.TweenType.Linear )
						Team1Line:registerEventHandler( "transition_complete_keyframe", Team1LineFrame3 )
					end
				end
				
				Team1Line:completeAnimation()
				self.Team1Line:setLeftRight( true, true, -11, 11 )
				self.Team1Line:setTopBottom( false, false, 6, 14 )
				self.Team1Line:setAlpha( 0 )
				Team1LineFrame2( Team1Line, {} )
				local Team1PlayerListFrame2 = function ( Team1PlayerList, event )
					local Team1PlayerListFrame3 = function ( Team1PlayerList, event )
						if not event.interrupted then
							Team1PlayerList:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Bounce )
						end
						Team1PlayerList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1PlayerList, event )
						else
							Team1PlayerList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1PlayerListFrame3( Team1PlayerList, event )
						return 
					else
						Team1PlayerList:beginAnimation( "keyframe", 1100, false, false, CoD.TweenType.Linear )
						Team1PlayerList:registerEventHandler( "transition_complete_keyframe", Team1PlayerListFrame3 )
					end
				end
				
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setAlpha( 0 )
				Team1PlayerListFrame2( Team1PlayerList, {} )
			end
		},
		Demo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Team1PlayerList:completeAnimation()
				self.Team1PlayerList:setAlpha( 0 )
				self.clipFinished( Team1PlayerList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Demo",
			condition = function ( menu, element, event )
				return IsDemoPlaying()
			end
		}
	} )
	Team1PlayerList.id = "Team1PlayerList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f5_local1
	} )
	if not self:restoreState() then
		self.Team1PlayerList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LoadingElem2:close()
		element.LoadingElem1:close()
		element.LoadingStatusBox:close()
		element.Team1PlayerList:close()
		element.LoadingScreenHeaderFooter:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LoadingScreenOverlayForNonTeamGames.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

