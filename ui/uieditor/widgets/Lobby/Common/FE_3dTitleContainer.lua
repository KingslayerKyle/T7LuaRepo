-- 3b144dbf12c0a5f15719ccbd83c48f96
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemBackB" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemBackA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeB" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemMid" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeC" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeD" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemBaseA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemTopC" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemTopB" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemTopA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitle" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingA" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC and Dvar.ui_execdemo_gamescom:get() then
		self.Local.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	end
end

CoD.FE_3dTitleContainer = InheritFrom( LUI.UIElement )
CoD.FE_3dTitleContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_3dTitleContainer )
	self.id = "FE_3dTitleContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 578 )
	self:setTopBottom( true, false, 0, 146 )
	self.anyChildUsesUpdateState = true
	
	local circles = LUI.UIImage.new()
	circles:setLeftRight( true, false, 78, 174 )
	circles:setTopBottom( true, false, 10, 103.33 )
	circles:setAlpha( 0 )
	circles:setZoom( -40 )
	circles:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles )
	self.circles = circles
	
	local diaglrg = LUI.UIImage.new()
	diaglrg:setLeftRight( true, false, 38, 190 )
	diaglrg:setTopBottom( true, false, 54.67, 62.67 )
	diaglrg:setAlpha( 0 )
	diaglrg:setZRot( 45 )
	diaglrg:setImage( RegisterImage( "uie_t7_menu_frontend_titlebacklinediaga" ) )
	diaglrg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( diaglrg )
	self.diaglrg = diaglrg
	
	local diagsm = LUI.UIImage.new()
	diagsm:setLeftRight( true, false, 161, 197 )
	diagsm:setTopBottom( true, false, 14.67, 22.67 )
	diagsm:setAlpha( 0.23 )
	diagsm:setZRot( 45 )
	diagsm:setImage( RegisterImage( "uie_t7_menu_frontend_titlebacklinediagb" ) )
	diagsm:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( diagsm )
	self.diagsm = diagsm
	
	local pixela = LUI.UIImage.new()
	pixela:setLeftRight( true, false, 32, 44 )
	pixela:setTopBottom( true, false, 29, 81 )
	pixela:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixela" ) )
	pixela:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixela )
	self.pixela = pixela
	
	local pixelb = LUI.UIImage.new()
	pixelb:setLeftRight( true, false, 68, 100 )
	pixelb:setTopBottom( true, false, 29, 81 )
	pixelb:setZoom( 10 )
	pixelb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelb )
	self.pixelb = pixelb
	
	local pixelc = LUI.UIImage.new()
	pixelc:setLeftRight( true, false, 42, 58 )
	pixelc:setTopBottom( true, false, 29, 81 )
	pixelc:setZoom( -5 )
	pixelc:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc )
	self.pixelc = pixelc
	
	local pixeld = LUI.UIImage.new()
	pixeld:setLeftRight( true, false, 94, 134 )
	pixeld:setTopBottom( true, false, 28.5, 80.5 )
	pixeld:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixeld" ) )
	pixeld:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixeld )
	self.pixeld = pixeld
	
	local centersquare = LUI.UIImage.new()
	centersquare:setLeftRight( true, false, 114, 134 )
	centersquare:setTopBottom( true, false, 49, 61 )
	centersquare:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackthickc" ) )
	centersquare:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( centersquare )
	self.centersquare = centersquare
	
	local ElemBackB = CoD.FE_TitleElemBackB.new( menu, controller )
	ElemBackB:setLeftRight( true, false, 108, 136 )
	ElemBackB:setTopBottom( true, false, -5, 115 )
	self:addElement( ElemBackB )
	self.ElemBackB = ElemBackB
	
	local ElemBackA0 = CoD.FE_TitleElemBackA.new( menu, controller )
	ElemBackA0:setLeftRight( true, false, 110, 146 )
	ElemBackA0:setTopBottom( true, false, -4.32, 115.68 )
	self:addElement( ElemBackA0 )
	self.ElemBackA0 = ElemBackA0
	
	local ElemForeB0 = CoD.FE_TitleElemForeB.new( menu, controller )
	ElemForeB0:setLeftRight( true, false, 106, 114 )
	ElemForeB0:setTopBottom( true, false, 22.5, 86.5 )
	self:addElement( ElemForeB0 )
	self.ElemForeB0 = ElemForeB0
	
	local ElemMid0 = CoD.FE_TitleElemMid.new( menu, controller )
	ElemMid0:setLeftRight( true, false, 24, 144 )
	ElemMid0:setTopBottom( true, false, 22.5, 86.5 )
	self:addElement( ElemMid0 )
	self.ElemMid0 = ElemMid0
	
	local ElemForeA0 = CoD.FE_TitleElemForeA.new( menu, controller )
	ElemForeA0:setLeftRight( true, false, 110, 138 )
	ElemForeA0:setTopBottom( true, false, 22.67, 86.67 )
	self:addElement( ElemForeA0 )
	self.ElemForeA0 = ElemForeA0
	
	local ElemForeC0 = CoD.FE_TitleElemForeC.new( menu, controller )
	ElemForeC0:setLeftRight( true, false, 102, 118 )
	ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
	self:addElement( ElemForeC0 )
	self.ElemForeC0 = ElemForeC0
	
	local ElemForeD0 = CoD.FE_TitleElemForeD.new( menu, controller )
	ElemForeD0:setLeftRight( true, false, 76, 104 )
	ElemForeD0:setTopBottom( true, false, 22.5, 86.5 )
	self:addElement( ElemForeD0 )
	self.ElemForeD0 = ElemForeD0
	
	local ElemBaseA0 = CoD.FE_TitleElemBaseA.new( menu, controller )
	ElemBaseA0:setLeftRight( true, false, 66, 122 )
	ElemBaseA0:setTopBottom( true, false, 86.67, 102.67 )
	self:addElement( ElemBaseA0 )
	self.ElemBaseA0 = ElemBaseA0
	
	local ElemTopC0 = CoD.FE_TitleElemTopC.new( menu, controller )
	ElemTopC0:setLeftRight( true, false, 122, 146 )
	ElemTopC0:setTopBottom( true, false, 15, 19 )
	self:addElement( ElemTopC0 )
	self.ElemTopC0 = ElemTopC0
	
	local ElemTopB0 = CoD.FE_TitleElemTopB.new( menu, controller )
	ElemTopB0:setLeftRight( true, false, 116, 172 )
	ElemTopB0:setTopBottom( true, false, 15, 19 )
	self:addElement( ElemTopB0 )
	self.ElemTopB0 = ElemTopB0
	
	local ElemTopA0 = CoD.FE_TitleElemTopA.new( menu, controller )
	ElemTopA0:setLeftRight( true, false, 60, 116 )
	ElemTopA0:setTopBottom( true, false, 15, 19 )
	self:addElement( ElemTopA0 )
	self.ElemTopA0 = ElemTopA0
	
	local MenuTitle = CoD.FE_3dTitle.new( menu, controller )
	MenuTitle:setLeftRight( true, false, 136, 454 )
	MenuTitle:setTopBottom( true, false, 29.39, 80.5 )
	MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	MenuTitle:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		PlayClipOnElement( self, {
			elementName = "MenuTitle",
			clipName = "Intro"
		}, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local Local = CoD.FE_LabelSubHeadingA.new( menu, controller )
	Local:setLeftRight( true, false, 136, 210 )
	Local:setTopBottom( true, false, 84.11, 113.11 )
	Local:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Local:setShaderVector( 0, 0.05, 0, 0, 0 )
	Local:setShaderVector( 1, 0, 0, 0, 0 )
	Local:setShaderVector( 2, 0, 0, 0, 0 )
	Local:setShaderVector( 3, 0, 0, 0, 0 )
	Local:setShaderVector( 4, 0, 0, 0, 0 )
	Local.Label0:setRGB( 0.74, 0.78, 0.79 )
	Local.Label0:setText( Engine.Localize( "MENU_LOCAL_CAPS" ) )
	Local.Label0:setTTF( "fonts/escom.ttf" )
	Local:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyNetworkMode", function ( model )
		local lobbyNetworkMode = Engine.GetModelValue( model )
		if lobbyNetworkMode then
			Local:setAlpha( GetOfflineAlpha( lobbyNetworkMode ) )
		end
	end )
	self:addElement( Local )
	self.Local = Local
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				circles:completeAnimation()
				self.circles:setAlpha( 1 )
				self.clipFinished( circles, {} )
				diaglrg:completeAnimation()
				self.diaglrg:setLeftRight( true, false, 38, 190 )
				self.diaglrg:setTopBottom( true, false, 54.67, 62.67 )
				self.diaglrg:setAlpha( 1 )
				self.clipFinished( diaglrg, {} )
				diagsm:completeAnimation()
				self.diagsm:setLeftRight( true, false, 161, 197 )
				self.diagsm:setTopBottom( true, false, 14.67, 22.67 )
				self.diagsm:setAlpha( 1 )
				self.clipFinished( diagsm, {} )
				pixela:completeAnimation()
				self.pixela:setLeftRight( true, false, 32, 44 )
				self.pixela:setTopBottom( true, false, 29, 81 )
				self.pixela:setAlpha( 1 )
				self.clipFinished( pixela, {} )
				pixelb:completeAnimation()
				self.pixelb:setLeftRight( true, false, 68, 100 )
				self.pixelb:setTopBottom( true, false, 29, 81 )
				self.pixelb:setAlpha( 1 )
				self.clipFinished( pixelb, {} )
				pixelc:completeAnimation()
				self.pixelc:setLeftRight( true, false, 42, 58 )
				self.pixelc:setTopBottom( true, false, 29, 81 )
				self.pixelc:setAlpha( 1 )
				self.clipFinished( pixelc, {} )
				pixeld:completeAnimation()
				self.pixeld:setLeftRight( true, false, 94, 134 )
				self.pixeld:setTopBottom( true, false, 28.5, 80.5 )
				self.pixeld:setAlpha( 1 )
				self.clipFinished( pixeld, {} )
				centersquare:completeAnimation()
				self.centersquare:setAlpha( 1 )
				self.clipFinished( centersquare, {} )
				ElemBackB:completeAnimation()
				self.ElemBackB:setAlpha( 1 )
				self.clipFinished( ElemBackB, {} )
				ElemBackA0:completeAnimation()
				self.ElemBackA0:setLeftRight( true, false, 110, 146 )
				self.ElemBackA0:setTopBottom( true, false, -4.32, 115.68 )
				self.ElemBackA0:setAlpha( 1 )
				self.clipFinished( ElemBackA0, {} )
				ElemForeB0:completeAnimation()
				self.ElemForeB0:setLeftRight( true, false, 106, 114 )
				self.ElemForeB0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemForeB0:setAlpha( 1 )
				self.clipFinished( ElemForeB0, {} )
				ElemMid0:completeAnimation()
				self.ElemMid0:setLeftRight( true, false, 24, 144 )
				self.ElemMid0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemMid0:setAlpha( 1 )
				self.clipFinished( ElemMid0, {} )
				ElemForeA0:completeAnimation()
				self.ElemForeA0:setLeftRight( true, false, 110, 138 )
				self.ElemForeA0:setTopBottom( true, false, 22.67, 86.67 )
				self.ElemForeA0:setAlpha( 1 )
				self.clipFinished( ElemForeA0, {} )
				ElemForeC0:completeAnimation()
				self.ElemForeC0:setLeftRight( true, false, 102, 118 )
				self.ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
				self.ElemForeC0:setAlpha( 1 )
				self.clipFinished( ElemForeC0, {} )
				ElemForeD0:completeAnimation()
				self.ElemForeD0:setLeftRight( true, false, 76, 104 )
				self.ElemForeD0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemForeD0:setAlpha( 1 )
				self.clipFinished( ElemForeD0, {} )
				ElemBaseA0:completeAnimation()
				self.ElemBaseA0:setLeftRight( true, false, 66, 122 )
				self.ElemBaseA0:setTopBottom( true, false, 86.67, 102.67 )
				self.ElemBaseA0:setAlpha( 1 )
				self.clipFinished( ElemBaseA0, {} )
				ElemTopC0:completeAnimation()
				self.ElemTopC0:setLeftRight( true, false, 122, 146 )
				self.ElemTopC0:setTopBottom( true, false, 15, 19 )
				self.ElemTopC0:setAlpha( 1 )
				self.clipFinished( ElemTopC0, {} )
				ElemTopB0:completeAnimation()
				self.ElemTopB0:setLeftRight( true, false, 116, 172 )
				self.ElemTopB0:setTopBottom( true, false, 15, 19 )
				self.ElemTopB0:setAlpha( 1 )
				self.clipFinished( ElemTopB0, {} )
				ElemTopA0:completeAnimation()
				self.ElemTopA0:setLeftRight( true, false, 60, 116 )
				self.ElemTopA0:setTopBottom( true, false, 15, 19 )
				self.ElemTopA0:setAlpha( 1 )
				self.clipFinished( ElemTopA0, {} )
				MenuTitle:completeAnimation()
				self.clipFinished( MenuTitle, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 20 )
				local circlesFrame2 = function ( circles, event )
					local circlesFrame3 = function ( circles, event )
						if not event.interrupted then
							circles:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Bounce )
						end
						circles:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( circles, event )
						else
							circles:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						circlesFrame3( circles, event )
						return 
					else
						circles:beginAnimation( "keyframe", 1049, false, false, CoD.TweenType.Linear )
						circles:registerEventHandler( "transition_complete_keyframe", circlesFrame3 )
					end
				end
				
				circles:completeAnimation()
				self.circles:setAlpha( 0 )
				circlesFrame2( circles, {} )
				local diaglrgFrame2 = function ( diaglrg, event )
					local diaglrgFrame3 = function ( diaglrg, event )
						if not event.interrupted then
							diaglrg:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Bounce )
						end
						diaglrg:setLeftRight( true, false, 38, 190 )
						diaglrg:setTopBottom( true, false, 54.67, 62.67 )
						diaglrg:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( diaglrg, event )
						else
							diaglrg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						diaglrgFrame3( diaglrg, event )
						return 
					else
						diaglrg:beginAnimation( "keyframe", 949, false, false, CoD.TweenType.Linear )
						diaglrg:registerEventHandler( "transition_complete_keyframe", diaglrgFrame3 )
					end
				end
				
				diaglrg:completeAnimation()
				self.diaglrg:setLeftRight( true, false, 38, 190 )
				self.diaglrg:setTopBottom( true, false, 54.67, 62.67 )
				self.diaglrg:setAlpha( 0 )
				diaglrgFrame2( diaglrg, {} )
				local diagsmFrame2 = function ( diagsm, event )
					local diagsmFrame3 = function ( diagsm, event )
						if not event.interrupted then
							diagsm:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
						end
						diagsm:setLeftRight( true, false, 161, 197 )
						diagsm:setTopBottom( true, false, 14.67, 22.67 )
						diagsm:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( diagsm, event )
						else
							diagsm:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						diagsmFrame3( diagsm, event )
						return 
					else
						diagsm:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						diagsm:registerEventHandler( "transition_complete_keyframe", diagsmFrame3 )
					end
				end
				
				diagsm:completeAnimation()
				self.diagsm:setLeftRight( true, false, 161, 197 )
				self.diagsm:setTopBottom( true, false, 14.67, 22.67 )
				self.diagsm:setAlpha( 0 )
				diagsmFrame2( diagsm, {} )
				local pixelaFrame2 = function ( pixela, event )
					local pixelaFrame3 = function ( pixela, event )
						local pixelaFrame4 = function ( pixela, event )
							local pixelaFrame5 = function ( pixela, event )
								if not event.interrupted then
									pixela:beginAnimation( "keyframe", 320, true, true, CoD.TweenType.Linear )
								end
								pixela:setLeftRight( true, false, 32, 44 )
								pixela:setTopBottom( true, false, 29, 81 )
								pixela:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( pixela, event )
								else
									pixela:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								pixelaFrame5( pixela, event )
								return 
							else
								pixela:beginAnimation( "keyframe", 299, true, true, CoD.TweenType.Linear )
								pixela:setLeftRight( true, false, 78, 90 )
								pixela:registerEventHandler( "transition_complete_keyframe", pixelaFrame5 )
							end
						end
						
						if event.interrupted then
							pixelaFrame4( pixela, event )
							return 
						else
							pixela:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Bounce )
							pixela:setAlpha( 1 )
							pixela:registerEventHandler( "transition_complete_keyframe", pixelaFrame4 )
						end
					end
					
					if event.interrupted then
						pixelaFrame3( pixela, event )
						return 
					else
						pixela:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						pixela:registerEventHandler( "transition_complete_keyframe", pixelaFrame3 )
					end
				end
				
				pixela:completeAnimation()
				self.pixela:setLeftRight( true, false, 32, 44 )
				self.pixela:setTopBottom( true, false, 29, 81 )
				self.pixela:setAlpha( 0 )
				pixelaFrame2( pixela, {} )
				local pixelbFrame2 = function ( pixelb, event )
					local pixelbFrame3 = function ( pixelb, event )
						local pixelbFrame4 = function ( pixelb, event )
							local pixelbFrame5 = function ( pixelb, event )
								if not event.interrupted then
									pixelb:beginAnimation( "keyframe", 259, true, true, CoD.TweenType.Linear )
								end
								pixelb:setLeftRight( true, false, 68, 100 )
								pixelb:setTopBottom( true, false, 29, 81 )
								pixelb:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( pixelb, event )
								else
									pixelb:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								pixelbFrame5( pixelb, event )
								return 
							else
								pixelb:beginAnimation( "keyframe", 379, true, true, CoD.TweenType.Linear )
								pixelb:setLeftRight( true, false, 157, 189 )
								pixelb:registerEventHandler( "transition_complete_keyframe", pixelbFrame5 )
							end
						end
						
						if event.interrupted then
							pixelbFrame4( pixelb, event )
							return 
						else
							pixelb:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
							pixelb:setAlpha( 1 )
							pixelb:registerEventHandler( "transition_complete_keyframe", pixelbFrame4 )
						end
					end
					
					if event.interrupted then
						pixelbFrame3( pixelb, event )
						return 
					else
						pixelb:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						pixelb:registerEventHandler( "transition_complete_keyframe", pixelbFrame3 )
					end
				end
				
				pixelb:completeAnimation()
				self.pixelb:setLeftRight( true, false, 68, 100 )
				self.pixelb:setTopBottom( true, false, 29, 81 )
				self.pixelb:setAlpha( 0 )
				pixelbFrame2( pixelb, {} )
				local pixelcFrame2 = function ( pixelc, event )
					local pixelcFrame3 = function ( pixelc, event )
						local pixelcFrame4 = function ( pixelc, event )
							local pixelcFrame5 = function ( pixelc, event )
								if not event.interrupted then
									pixelc:beginAnimation( "keyframe", 419, true, true, CoD.TweenType.Back )
								end
								pixelc:setLeftRight( true, false, 42, 58 )
								pixelc:setTopBottom( true, false, 29, 81 )
								pixelc:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( pixelc, event )
								else
									pixelc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								pixelcFrame5( pixelc, event )
								return 
							else
								pixelc:beginAnimation( "keyframe", 210, true, true, CoD.TweenType.Back )
								pixelc:setLeftRight( true, false, 66.52, 82.52 )
								pixelc:registerEventHandler( "transition_complete_keyframe", pixelcFrame5 )
							end
						end
						
						if event.interrupted then
							pixelcFrame4( pixelc, event )
							return 
						else
							pixelc:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
							pixelc:setAlpha( 1 )
							pixelc:registerEventHandler( "transition_complete_keyframe", pixelcFrame4 )
						end
					end
					
					if event.interrupted then
						pixelcFrame3( pixelc, event )
						return 
					else
						pixelc:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						pixelc:registerEventHandler( "transition_complete_keyframe", pixelcFrame3 )
					end
				end
				
				pixelc:completeAnimation()
				self.pixelc:setLeftRight( true, false, 42, 58 )
				self.pixelc:setTopBottom( true, false, 29, 81 )
				self.pixelc:setAlpha( 0 )
				pixelcFrame2( pixelc, {} )
				local pixeldFrame2 = function ( pixeld, event )
					local pixeldFrame3 = function ( pixeld, event )
						local pixeldFrame4 = function ( pixeld, event )
							local pixeldFrame5 = function ( pixeld, event )
								if not event.interrupted then
									pixeld:beginAnimation( "keyframe", 269, true, true, CoD.TweenType.Back )
								end
								pixeld:setLeftRight( true, false, 94, 134 )
								pixeld:setTopBottom( true, false, 28.5, 80.5 )
								pixeld:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( pixeld, event )
								else
									pixeld:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								pixeldFrame5( pixeld, event )
								return 
							else
								pixeld:beginAnimation( "keyframe", 399, true, true, CoD.TweenType.Back )
								pixeld:setLeftRight( true, false, 167.2, 207.2 )
								pixeld:registerEventHandler( "transition_complete_keyframe", pixeldFrame5 )
							end
						end
						
						if event.interrupted then
							pixeldFrame4( pixeld, event )
							return 
						else
							pixeld:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
							pixeld:setAlpha( 1 )
							pixeld:registerEventHandler( "transition_complete_keyframe", pixeldFrame4 )
						end
					end
					
					if event.interrupted then
						pixeldFrame3( pixeld, event )
						return 
					else
						pixeld:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						pixeld:registerEventHandler( "transition_complete_keyframe", pixeldFrame3 )
					end
				end
				
				pixeld:completeAnimation()
				self.pixeld:setLeftRight( true, false, 94, 134 )
				self.pixeld:setTopBottom( true, false, 28.5, 80.5 )
				self.pixeld:setAlpha( 0 )
				pixeldFrame2( pixeld, {} )
				local centersquareFrame2 = function ( centersquare, event )
					local centersquareFrame3 = function ( centersquare, event )
						if not event.interrupted then
							centersquare:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						end
						centersquare:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( centersquare, event )
						else
							centersquare:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						centersquareFrame3( centersquare, event )
						return 
					else
						centersquare:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						centersquare:registerEventHandler( "transition_complete_keyframe", centersquareFrame3 )
					end
				end
				
				centersquare:completeAnimation()
				self.centersquare:setAlpha( 0 )
				centersquareFrame2( centersquare, {} )
				local ElemBackBFrame2 = function ( ElemBackB, event )
					local ElemBackBFrame3 = function ( ElemBackB, event )
						local ElemBackBFrame4 = function ( ElemBackB, event )
							local ElemBackBFrame5 = function ( ElemBackB, event )
								local ElemBackBFrame6 = function ( ElemBackB, event )
									if not event.interrupted then
										ElemBackB:beginAnimation( "keyframe", 370, true, true, CoD.TweenType.Linear )
									end
									ElemBackB:setLeftRight( true, false, 110, 138 )
									ElemBackB:setTopBottom( true, false, -5, 115 )
									ElemBackB:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemBackB, event )
									else
										ElemBackB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemBackBFrame6( ElemBackB, event )
									return 
								else
									ElemBackB:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
									ElemBackB:registerEventHandler( "transition_complete_keyframe", ElemBackBFrame6 )
								end
							end
							
							if event.interrupted then
								ElemBackBFrame5( ElemBackB, event )
								return 
							else
								ElemBackB:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Linear )
								ElemBackB:setLeftRight( true, false, 557, 585 )
								ElemBackB:registerEventHandler( "transition_complete_keyframe", ElemBackBFrame5 )
							end
						end
						
						if event.interrupted then
							ElemBackBFrame4( ElemBackB, event )
							return 
						else
							ElemBackB:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Bounce )
							ElemBackB:setAlpha( 1 )
							ElemBackB:registerEventHandler( "transition_complete_keyframe", ElemBackBFrame4 )
						end
					end
					
					if event.interrupted then
						ElemBackBFrame3( ElemBackB, event )
						return 
					else
						ElemBackB:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
						ElemBackB:registerEventHandler( "transition_complete_keyframe", ElemBackBFrame3 )
					end
				end
				
				ElemBackB:completeAnimation()
				self.ElemBackB:setLeftRight( true, false, 158, 186 )
				self.ElemBackB:setTopBottom( true, false, -5, 115 )
				self.ElemBackB:setAlpha( 0 )
				ElemBackBFrame2( ElemBackB, {} )
				local ElemBackA0Frame2 = function ( ElemBackA0, event )
					local ElemBackA0Frame3 = function ( ElemBackA0, event )
						local ElemBackA0Frame4 = function ( ElemBackA0, event )
							local ElemBackA0Frame5 = function ( ElemBackA0, event )
								local ElemBackA0Frame6 = function ( ElemBackA0, event )
									if not event.interrupted then
										ElemBackA0:beginAnimation( "keyframe", 110, true, true, CoD.TweenType.Linear )
									end
									ElemBackA0:setLeftRight( true, false, 110, 146 )
									ElemBackA0:setTopBottom( true, false, -4.32, 115.68 )
									ElemBackA0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemBackA0, event )
									else
										ElemBackA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemBackA0Frame6( ElemBackA0, event )
									return 
								else
									ElemBackA0:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
									ElemBackA0:registerEventHandler( "transition_complete_keyframe", ElemBackA0Frame6 )
								end
							end
							
							if event.interrupted then
								ElemBackA0Frame5( ElemBackA0, event )
								return 
							else
								ElemBackA0:beginAnimation( "keyframe", 269, true, true, CoD.TweenType.Linear )
								ElemBackA0:setLeftRight( true, false, 545, 581 )
								ElemBackA0:setTopBottom( true, false, -5, 115 )
								ElemBackA0:registerEventHandler( "transition_complete_keyframe", ElemBackA0Frame5 )
							end
						end
						
						if event.interrupted then
							ElemBackA0Frame4( ElemBackA0, event )
							return 
						else
							ElemBackA0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
							ElemBackA0:setAlpha( 1 )
							ElemBackA0:registerEventHandler( "transition_complete_keyframe", ElemBackA0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemBackA0Frame3( ElemBackA0, event )
						return 
					else
						ElemBackA0:beginAnimation( "keyframe", 689, false, false, CoD.TweenType.Linear )
						ElemBackA0:registerEventHandler( "transition_complete_keyframe", ElemBackA0Frame3 )
					end
				end
				
				ElemBackA0:completeAnimation()
				self.ElemBackA0:setLeftRight( true, false, 110, 146 )
				self.ElemBackA0:setTopBottom( true, false, -4.32, 115.68 )
				self.ElemBackA0:setAlpha( 0 )
				ElemBackA0Frame2( ElemBackA0, {} )
				local ElemForeB0Frame2 = function ( ElemForeB0, event )
					local ElemForeB0Frame3 = function ( ElemForeB0, event )
						local ElemForeB0Frame4 = function ( ElemForeB0, event )
							local ElemForeB0Frame5 = function ( ElemForeB0, event )
								local ElemForeB0Frame6 = function ( ElemForeB0, event )
									if not event.interrupted then
										ElemForeB0:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
									end
									ElemForeB0:setLeftRight( true, false, 106, 114 )
									ElemForeB0:setTopBottom( true, false, 22.5, 86.5 )
									ElemForeB0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemForeB0, event )
									else
										ElemForeB0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemForeB0Frame6( ElemForeB0, event )
									return 
								else
									ElemForeB0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
									ElemForeB0:registerEventHandler( "transition_complete_keyframe", ElemForeB0Frame6 )
								end
							end
							
							if event.interrupted then
								ElemForeB0Frame5( ElemForeB0, event )
								return 
							else
								ElemForeB0:beginAnimation( "keyframe", 220, true, true, CoD.TweenType.Linear )
								ElemForeB0:setLeftRight( true, false, 529, 537 )
								ElemForeB0:registerEventHandler( "transition_complete_keyframe", ElemForeB0Frame5 )
							end
						end
						
						if event.interrupted then
							ElemForeB0Frame4( ElemForeB0, event )
							return 
						else
							ElemForeB0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
							ElemForeB0:setAlpha( 1 )
							ElemForeB0:registerEventHandler( "transition_complete_keyframe", ElemForeB0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemForeB0Frame3( ElemForeB0, event )
						return 
					else
						ElemForeB0:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						ElemForeB0:registerEventHandler( "transition_complete_keyframe", ElemForeB0Frame3 )
					end
				end
				
				ElemForeB0:completeAnimation()
				self.ElemForeB0:setLeftRight( true, false, 106, 114 )
				self.ElemForeB0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemForeB0:setAlpha( 0 )
				ElemForeB0Frame2( ElemForeB0, {} )
				local ElemMid0Frame2 = function ( ElemMid0, event )
					local ElemMid0Frame3 = function ( ElemMid0, event )
						local ElemMid0Frame4 = function ( ElemMid0, event )
							local ElemMid0Frame5 = function ( ElemMid0, event )
								local ElemMid0Frame6 = function ( ElemMid0, event )
									if not event.interrupted then
										ElemMid0:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
									end
									ElemMid0:setLeftRight( true, false, 24, 144 )
									ElemMid0:setTopBottom( true, false, 22.5, 86.5 )
									ElemMid0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemMid0, event )
									else
										ElemMid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemMid0Frame6( ElemMid0, event )
									return 
								else
									ElemMid0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
									ElemMid0:registerEventHandler( "transition_complete_keyframe", ElemMid0Frame6 )
								end
							end
							
							if event.interrupted then
								ElemMid0Frame5( ElemMid0, event )
								return 
							else
								ElemMid0:beginAnimation( "keyframe", 299, true, true, CoD.TweenType.Linear )
								ElemMid0:setLeftRight( true, false, 473, 593 )
								ElemMid0:registerEventHandler( "transition_complete_keyframe", ElemMid0Frame5 )
							end
						end
						
						if event.interrupted then
							ElemMid0Frame4( ElemMid0, event )
							return 
						else
							ElemMid0:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Bounce )
							ElemMid0:setAlpha( 1 )
							ElemMid0:registerEventHandler( "transition_complete_keyframe", ElemMid0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemMid0Frame3( ElemMid0, event )
						return 
					else
						ElemMid0:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						ElemMid0:registerEventHandler( "transition_complete_keyframe", ElemMid0Frame3 )
					end
				end
				
				ElemMid0:completeAnimation()
				self.ElemMid0:setLeftRight( true, false, 24, 144 )
				self.ElemMid0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemMid0:setAlpha( 0 )
				ElemMid0Frame2( ElemMid0, {} )
				local ElemForeA0Frame2 = function ( ElemForeA0, event )
					local ElemForeA0Frame3 = function ( ElemForeA0, event )
						local ElemForeA0Frame4 = function ( ElemForeA0, event )
							local ElemForeA0Frame5 = function ( ElemForeA0, event )
								local ElemForeA0Frame6 = function ( ElemForeA0, event )
									if not event.interrupted then
										ElemForeA0:beginAnimation( "keyframe", 269, true, true, CoD.TweenType.Linear )
									end
									ElemForeA0:setLeftRight( true, false, 110, 138 )
									ElemForeA0:setTopBottom( true, false, 22.67, 86.67 )
									ElemForeA0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemForeA0, event )
									else
										ElemForeA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemForeA0Frame6( ElemForeA0, event )
									return 
								else
									ElemForeA0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									ElemForeA0:registerEventHandler( "transition_complete_keyframe", ElemForeA0Frame6 )
								end
							end
							
							if event.interrupted then
								ElemForeA0Frame5( ElemForeA0, event )
								return 
							else
								ElemForeA0:beginAnimation( "keyframe", 240, true, true, CoD.TweenType.Linear )
								ElemForeA0:setLeftRight( true, false, 543, 571 )
								ElemForeA0:registerEventHandler( "transition_complete_keyframe", ElemForeA0Frame5 )
							end
						end
						
						if event.interrupted then
							ElemForeA0Frame4( ElemForeA0, event )
							return 
						else
							ElemForeA0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
							ElemForeA0:setAlpha( 1 )
							ElemForeA0:registerEventHandler( "transition_complete_keyframe", ElemForeA0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemForeA0Frame3( ElemForeA0, event )
						return 
					else
						ElemForeA0:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
						ElemForeA0:registerEventHandler( "transition_complete_keyframe", ElemForeA0Frame3 )
					end
				end
				
				ElemForeA0:completeAnimation()
				self.ElemForeA0:setLeftRight( true, false, 110, 138 )
				self.ElemForeA0:setTopBottom( true, false, 22.67, 86.67 )
				self.ElemForeA0:setAlpha( 0 )
				ElemForeA0Frame2( ElemForeA0, {} )
				local ElemForeC0Frame2 = function ( ElemForeC0, event )
					local ElemForeC0Frame3 = function ( ElemForeC0, event )
						local ElemForeC0Frame4 = function ( ElemForeC0, event )
							local ElemForeC0Frame5 = function ( ElemForeC0, event )
								local ElemForeC0Frame6 = function ( ElemForeC0, event )
									if not event.interrupted then
										ElemForeC0:beginAnimation( "keyframe", 199, true, true, CoD.TweenType.Linear )
									end
									ElemForeC0:setLeftRight( true, false, 102, 118 )
									ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
									ElemForeC0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemForeC0, event )
									else
										ElemForeC0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemForeC0Frame6( ElemForeC0, event )
									return 
								else
									ElemForeC0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
									ElemForeC0:registerEventHandler( "transition_complete_keyframe", ElemForeC0Frame6 )
								end
							end
							
							if event.interrupted then
								ElemForeC0Frame5( ElemForeC0, event )
								return 
							else
								ElemForeC0:beginAnimation( "keyframe", 299, true, true, CoD.TweenType.Linear )
								ElemForeC0:setLeftRight( true, false, 571, 587 )
								ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
								ElemForeC0:registerEventHandler( "transition_complete_keyframe", ElemForeC0Frame5 )
							end
						end
						
						if event.interrupted then
							ElemForeC0Frame4( ElemForeC0, event )
							return 
						else
							ElemForeC0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
							ElemForeC0:setAlpha( 1 )
							ElemForeC0:registerEventHandler( "transition_complete_keyframe", ElemForeC0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemForeC0Frame3( ElemForeC0, event )
						return 
					else
						ElemForeC0:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
						ElemForeC0:registerEventHandler( "transition_complete_keyframe", ElemForeC0Frame3 )
					end
				end
				
				ElemForeC0:completeAnimation()
				self.ElemForeC0:setLeftRight( true, false, 102, 118 )
				self.ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
				self.ElemForeC0:setAlpha( 0 )
				ElemForeC0Frame2( ElemForeC0, {} )
				local ElemForeD0Frame2 = function ( ElemForeD0, event )
					local ElemForeD0Frame3 = function ( ElemForeD0, event )
						local ElemForeD0Frame4 = function ( ElemForeD0, event )
							local ElemForeD0Frame5 = function ( ElemForeD0, event )
								local ElemForeD0Frame6 = function ( ElemForeD0, event )
									if not event.interrupted then
										ElemForeD0:beginAnimation( "keyframe", 350, true, true, CoD.TweenType.Linear )
									end
									ElemForeD0:setLeftRight( true, false, 76, 104 )
									ElemForeD0:setTopBottom( true, false, 22.5, 86.5 )
									ElemForeD0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemForeD0, event )
									else
										ElemForeD0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemForeD0Frame6( ElemForeD0, event )
									return 
								else
									ElemForeD0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									ElemForeD0:registerEventHandler( "transition_complete_keyframe", ElemForeD0Frame6 )
								end
							end
							
							if event.interrupted then
								ElemForeD0Frame5( ElemForeD0, event )
								return 
							else
								ElemForeD0:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Linear )
								ElemForeD0:setLeftRight( true, false, 549, 577 )
								ElemForeD0:registerEventHandler( "transition_complete_keyframe", ElemForeD0Frame5 )
							end
						end
						
						if event.interrupted then
							ElemForeD0Frame4( ElemForeD0, event )
							return 
						else
							ElemForeD0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Bounce )
							ElemForeD0:setAlpha( 1 )
							ElemForeD0:registerEventHandler( "transition_complete_keyframe", ElemForeD0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemForeD0Frame3( ElemForeD0, event )
						return 
					else
						ElemForeD0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						ElemForeD0:registerEventHandler( "transition_complete_keyframe", ElemForeD0Frame3 )
					end
				end
				
				ElemForeD0:completeAnimation()
				self.ElemForeD0:setLeftRight( true, false, 76, 104 )
				self.ElemForeD0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemForeD0:setAlpha( 0 )
				ElemForeD0Frame2( ElemForeD0, {} )
				local ElemBaseA0Frame2 = function ( ElemBaseA0, event )
					local ElemBaseA0Frame3 = function ( ElemBaseA0, event )
						local ElemBaseA0Frame4 = function ( ElemBaseA0, event )
							local ElemBaseA0Frame5 = function ( ElemBaseA0, event )
								local ElemBaseA0Frame6 = function ( ElemBaseA0, event )
									if not event.interrupted then
										ElemBaseA0:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
									end
									ElemBaseA0:setLeftRight( true, false, 66, 122 )
									ElemBaseA0:setTopBottom( true, false, 86.67, 102.67 )
									ElemBaseA0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemBaseA0, event )
									else
										ElemBaseA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemBaseA0Frame6( ElemBaseA0, event )
									return 
								else
									ElemBaseA0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
									ElemBaseA0:registerEventHandler( "transition_complete_keyframe", ElemBaseA0Frame6 )
								end
							end
							
							if event.interrupted then
								ElemBaseA0Frame5( ElemBaseA0, event )
								return 
							else
								ElemBaseA0:beginAnimation( "keyframe", 240, true, true, CoD.TweenType.Linear )
								ElemBaseA0:setLeftRight( true, false, 529, 585 )
								ElemBaseA0:registerEventHandler( "transition_complete_keyframe", ElemBaseA0Frame5 )
							end
						end
						
						if event.interrupted then
							ElemBaseA0Frame4( ElemBaseA0, event )
							return 
						else
							ElemBaseA0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Bounce )
							ElemBaseA0:setAlpha( 1 )
							ElemBaseA0:registerEventHandler( "transition_complete_keyframe", ElemBaseA0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemBaseA0Frame3( ElemBaseA0, event )
						return 
					else
						ElemBaseA0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
						ElemBaseA0:registerEventHandler( "transition_complete_keyframe", ElemBaseA0Frame3 )
					end
				end
				
				ElemBaseA0:completeAnimation()
				self.ElemBaseA0:setLeftRight( true, false, 66, 122 )
				self.ElemBaseA0:setTopBottom( true, false, 86.67, 102.67 )
				self.ElemBaseA0:setAlpha( 0 )
				ElemBaseA0Frame2( ElemBaseA0, {} )
				local ElemTopC0Frame2 = function ( ElemTopC0, event )
					local ElemTopC0Frame3 = function ( ElemTopC0, event )
						local ElemTopC0Frame4 = function ( ElemTopC0, event )
							local ElemTopC0Frame5 = function ( ElemTopC0, event )
								local ElemTopC0Frame6 = function ( ElemTopC0, event )
									if not event.interrupted then
										ElemTopC0:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
									end
									ElemTopC0:setLeftRight( true, false, 122, 146 )
									ElemTopC0:setTopBottom( true, false, 15, 19 )
									ElemTopC0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemTopC0, event )
									else
										ElemTopC0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemTopC0Frame6( ElemTopC0, event )
									return 
								else
									ElemTopC0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									ElemTopC0:registerEventHandler( "transition_complete_keyframe", ElemTopC0Frame6 )
								end
							end
							
							if event.interrupted then
								ElemTopC0Frame5( ElemTopC0, event )
								return 
							else
								ElemTopC0:beginAnimation( "keyframe", 370, true, true, CoD.TweenType.Linear )
								ElemTopC0:setLeftRight( true, false, 521, 545 )
								ElemTopC0:registerEventHandler( "transition_complete_keyframe", ElemTopC0Frame5 )
							end
						end
						
						if event.interrupted then
							ElemTopC0Frame4( ElemTopC0, event )
							return 
						else
							ElemTopC0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
							ElemTopC0:setAlpha( 1 )
							ElemTopC0:registerEventHandler( "transition_complete_keyframe", ElemTopC0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemTopC0Frame3( ElemTopC0, event )
						return 
					else
						ElemTopC0:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						ElemTopC0:registerEventHandler( "transition_complete_keyframe", ElemTopC0Frame3 )
					end
				end
				
				ElemTopC0:completeAnimation()
				self.ElemTopC0:setLeftRight( true, false, 122, 146 )
				self.ElemTopC0:setTopBottom( true, false, 15, 19 )
				self.ElemTopC0:setAlpha( 0 )
				ElemTopC0Frame2( ElemTopC0, {} )
				local ElemTopB0Frame2 = function ( ElemTopB0, event )
					local ElemTopB0Frame3 = function ( ElemTopB0, event )
						local ElemTopB0Frame4 = function ( ElemTopB0, event )
							local ElemTopB0Frame5 = function ( ElemTopB0, event )
								local ElemTopB0Frame6 = function ( ElemTopB0, event )
									if not event.interrupted then
										ElemTopB0:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
									end
									ElemTopB0:setLeftRight( true, false, 116, 172 )
									ElemTopB0:setTopBottom( true, false, 15, 19 )
									ElemTopB0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemTopB0, event )
									else
										ElemTopB0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemTopB0Frame6( ElemTopB0, event )
									return 
								else
									ElemTopB0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									ElemTopB0:registerEventHandler( "transition_complete_keyframe", ElemTopB0Frame6 )
								end
							end
							
							if event.interrupted then
								ElemTopB0Frame5( ElemTopB0, event )
								return 
							else
								ElemTopB0:beginAnimation( "keyframe", 299, true, true, CoD.TweenType.Linear )
								ElemTopB0:setLeftRight( true, false, 515, 571 )
								ElemTopB0:registerEventHandler( "transition_complete_keyframe", ElemTopB0Frame5 )
							end
						end
						
						if event.interrupted then
							ElemTopB0Frame4( ElemTopB0, event )
							return 
						else
							ElemTopB0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Bounce )
							ElemTopB0:setAlpha( 1 )
							ElemTopB0:registerEventHandler( "transition_complete_keyframe", ElemTopB0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemTopB0Frame3( ElemTopB0, event )
						return 
					else
						ElemTopB0:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						ElemTopB0:registerEventHandler( "transition_complete_keyframe", ElemTopB0Frame3 )
					end
				end
				
				ElemTopB0:completeAnimation()
				self.ElemTopB0:setLeftRight( true, false, 116, 172 )
				self.ElemTopB0:setTopBottom( true, false, 15, 19 )
				self.ElemTopB0:setAlpha( 0 )
				ElemTopB0Frame2( ElemTopB0, {} )
				local ElemTopA0Frame2 = function ( ElemTopA0, event )
					local ElemTopA0Frame3 = function ( ElemTopA0, event )
						local ElemTopA0Frame4 = function ( ElemTopA0, event )
							local ElemTopA0Frame5 = function ( ElemTopA0, event )
								local ElemTopA0Frame6 = function ( ElemTopA0, event )
									if not event.interrupted then
										ElemTopA0:beginAnimation( "keyframe", 269, true, true, CoD.TweenType.Linear )
									end
									ElemTopA0:setLeftRight( true, false, 60, 116 )
									ElemTopA0:setTopBottom( true, false, 15, 19 )
									ElemTopA0:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( ElemTopA0, event )
									else
										ElemTopA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									ElemTopA0Frame6( ElemTopA0, event )
									return 
								else
									ElemTopA0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
									ElemTopA0:registerEventHandler( "transition_complete_keyframe", ElemTopA0Frame6 )
								end
							end
							
							if event.interrupted then
								ElemTopA0Frame5( ElemTopA0, event )
								return 
							else
								ElemTopA0:beginAnimation( "keyframe", 299, true, true, CoD.TweenType.Linear )
								ElemTopA0:setLeftRight( true, false, 526.5, 582.5 )
								ElemTopA0:registerEventHandler( "transition_complete_keyframe", ElemTopA0Frame5 )
							end
						end
						
						if event.interrupted then
							ElemTopA0Frame4( ElemTopA0, event )
							return 
						else
							ElemTopA0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
							ElemTopA0:setAlpha( 1 )
							ElemTopA0:registerEventHandler( "transition_complete_keyframe", ElemTopA0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemTopA0Frame3( ElemTopA0, event )
						return 
					else
						ElemTopA0:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						ElemTopA0:registerEventHandler( "transition_complete_keyframe", ElemTopA0Frame3 )
					end
				end
				
				ElemTopA0:completeAnimation()
				self.ElemTopA0:setLeftRight( true, false, 60, 116 )
				self.ElemTopA0:setTopBottom( true, false, 15, 19 )
				self.ElemTopA0:setAlpha( 0 )
				ElemTopA0Frame2( ElemTopA0, {} )
				local MenuTitleFrame2 = function ( MenuTitle, event )
					local MenuTitleFrame3 = function ( MenuTitle, event )
						local MenuTitleFrame4 = function ( MenuTitle, event )
							local MenuTitleFrame5 = function ( MenuTitle, event )
								local MenuTitleFrame6 = function ( MenuTitle, event )
									local MenuTitleFrame7 = function ( MenuTitle, event )
										local MenuTitleFrame8 = function ( MenuTitle, event )
											local MenuTitleFrame9 = function ( MenuTitle, event )
												local MenuTitleFrame10 = function ( MenuTitle, event )
													local MenuTitleFrame11 = function ( MenuTitle, event )
														local MenuTitleFrame12 = function ( MenuTitle, event )
															local MenuTitleFrame13 = function ( MenuTitle, event )
																local MenuTitleFrame14 = function ( MenuTitle, event )
																	local MenuTitleFrame15 = function ( MenuTitle, event )
																		local MenuTitleFrame16 = function ( MenuTitle, event )
																			local MenuTitleFrame17 = function ( MenuTitle, event )
																				local MenuTitleFrame18 = function ( MenuTitle, event )
																					local MenuTitleFrame19 = function ( MenuTitle, event )
																						local MenuTitleFrame20 = function ( MenuTitle, event )
																							local MenuTitleFrame21 = function ( MenuTitle, event )
																								local MenuTitleFrame22 = function ( MenuTitle, event )
																									local MenuTitleFrame23 = function ( MenuTitle, event )
																										local MenuTitleFrame24 = function ( MenuTitle, event )
																											local MenuTitleFrame25 = function ( MenuTitle, event )
																												local MenuTitleFrame26 = function ( MenuTitle, event )
																													local MenuTitleFrame27 = function ( MenuTitle, event )
																														local MenuTitleFrame28 = function ( MenuTitle, event )
																															if not event.interrupted then
																																MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																															end
																															MenuTitle:setAlpha( 1 )
																															if event.interrupted then
																																self.clipFinished( MenuTitle, event )
																															else
																																MenuTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																															end
																														end
																														
																														if event.interrupted then
																															MenuTitleFrame28( MenuTitle, event )
																															return 
																														else
																															MenuTitle:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
																															MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame28 )
																														end
																													end
																													
																													if event.interrupted then
																														MenuTitleFrame27( MenuTitle, event )
																														return 
																													else
																														MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame27 )
																													end
																												end
																												
																												if event.interrupted then
																													MenuTitleFrame26( MenuTitle, event )
																													return 
																												else
																													MenuTitle:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																													MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame26 )
																												end
																											end
																											
																											if event.interrupted then
																												MenuTitleFrame25( MenuTitle, event )
																												return 
																											else
																												MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																												MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame25 )
																											end
																										end
																										
																										if event.interrupted then
																											MenuTitleFrame24( MenuTitle, event )
																											return 
																										else
																											MenuTitle:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
																											MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame24 )
																										end
																									end
																									
																									if event.interrupted then
																										MenuTitleFrame23( MenuTitle, event )
																										return 
																									else
																										MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									MenuTitleFrame22( MenuTitle, event )
																									return 
																								else
																									MenuTitle:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
																									MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								MenuTitleFrame21( MenuTitle, event )
																								return 
																							else
																								MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							MenuTitleFrame20( MenuTitle, event )
																							return 
																						else
																							MenuTitle:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
																							MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						MenuTitleFrame19( MenuTitle, event )
																						return 
																					else
																						MenuTitle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
																						MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					MenuTitleFrame18( MenuTitle, event )
																					return 
																				else
																					MenuTitle:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Bounce )
																					MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				MenuTitleFrame17( MenuTitle, event )
																				return 
																			else
																				MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			MenuTitleFrame16( MenuTitle, event )
																			return 
																		else
																			MenuTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																			MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		MenuTitleFrame15( MenuTitle, event )
																		return 
																	else
																		MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame15 )
																	end
																end
																
																if event.interrupted then
																	MenuTitleFrame14( MenuTitle, event )
																	return 
																else
																	MenuTitle:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
																	MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame14 )
																end
															end
															
															if event.interrupted then
																MenuTitleFrame13( MenuTitle, event )
																return 
															else
																MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame13 )
															end
														end
														
														if event.interrupted then
															MenuTitleFrame12( MenuTitle, event )
															return 
														else
															MenuTitle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
															MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame12 )
														end
													end
													
													if event.interrupted then
														MenuTitleFrame11( MenuTitle, event )
														return 
													else
														MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame11 )
													end
												end
												
												if event.interrupted then
													MenuTitleFrame10( MenuTitle, event )
													return 
												else
													MenuTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
													MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame10 )
												end
											end
											
											if event.interrupted then
												MenuTitleFrame9( MenuTitle, event )
												return 
											else
												MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame9 )
											end
										end
										
										if event.interrupted then
											MenuTitleFrame8( MenuTitle, event )
											return 
										else
											MenuTitle:beginAnimation( "keyframe", 390, false, true, CoD.TweenType.Back )
											MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame8 )
										end
									end
									
									if event.interrupted then
										MenuTitleFrame7( MenuTitle, event )
										return 
									else
										MenuTitle:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame7 )
									end
								end
								
								if event.interrupted then
									MenuTitleFrame6( MenuTitle, event )
									return 
								else
									MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame6 )
								end
							end
							
							if event.interrupted then
								MenuTitleFrame5( MenuTitle, event )
								return 
							else
								MenuTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame5 )
							end
						end
						
						if event.interrupted then
							MenuTitleFrame4( MenuTitle, event )
							return 
						else
							MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame4 )
						end
					end
					
					if event.interrupted then
						MenuTitleFrame3( MenuTitle, event )
						return 
					else
						MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame3 )
					end
				end
				
				MenuTitle:completeAnimation()
				self.MenuTitle:setAlpha( 1 )
				MenuTitleFrame2( MenuTitle, {} )
			end,
			Update = function ()
				self:setupElementClipCounter( 20 )
				circles:completeAnimation()
				self.circles:setAlpha( 1 )
				self.clipFinished( circles, {} )
				diaglrg:completeAnimation()
				self.diaglrg:setLeftRight( true, false, 38, 190 )
				self.diaglrg:setTopBottom( true, false, 54.67, 62.67 )
				self.diaglrg:setAlpha( 1 )
				self.clipFinished( diaglrg, {} )
				diagsm:completeAnimation()
				self.diagsm:setLeftRight( true, false, 161, 197 )
				self.diagsm:setTopBottom( true, false, 14.67, 22.67 )
				self.diagsm:setAlpha( 1 )
				self.clipFinished( diagsm, {} )
				local pixelaFrame2 = function ( pixela, event )
					local pixelaFrame3 = function ( pixela, event )
						if not event.interrupted then
							pixela:beginAnimation( "keyframe", 319, true, true, CoD.TweenType.Linear )
						end
						pixela:setLeftRight( true, false, 32, 44 )
						pixela:setTopBottom( true, false, 29, 81 )
						pixela:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pixela, event )
						else
							pixela:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelaFrame3( pixela, event )
						return 
					else
						pixela:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						pixela:setLeftRight( true, false, 78, 90 )
						pixela:registerEventHandler( "transition_complete_keyframe", pixelaFrame3 )
					end
				end
				
				pixela:completeAnimation()
				self.pixela:setLeftRight( true, false, 32, 44 )
				self.pixela:setTopBottom( true, false, 29, 81 )
				self.pixela:setAlpha( 1 )
				pixelaFrame2( pixela, {} )
				local pixelbFrame2 = function ( pixelb, event )
					local pixelbFrame3 = function ( pixelb, event )
						if not event.interrupted then
							pixelb:beginAnimation( "keyframe", 259, true, true, CoD.TweenType.Linear )
						end
						pixelb:setLeftRight( true, false, 68, 100 )
						pixelb:setTopBottom( true, false, 29, 81 )
						pixelb:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pixelb, event )
						else
							pixelb:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelbFrame3( pixelb, event )
						return 
					else
						pixelb:beginAnimation( "keyframe", 379, true, true, CoD.TweenType.Linear )
						pixelb:setLeftRight( true, false, 157, 189 )
						pixelb:registerEventHandler( "transition_complete_keyframe", pixelbFrame3 )
					end
				end
				
				pixelb:completeAnimation()
				self.pixelb:setLeftRight( true, false, 68, 100 )
				self.pixelb:setTopBottom( true, false, 29, 81 )
				self.pixelb:setAlpha( 1 )
				pixelbFrame2( pixelb, {} )
				local pixelcFrame2 = function ( pixelc, event )
					local pixelcFrame3 = function ( pixelc, event )
						if not event.interrupted then
							pixelc:beginAnimation( "keyframe", 420, true, true, CoD.TweenType.Back )
						end
						pixelc:setLeftRight( true, false, 42, 58 )
						pixelc:setTopBottom( true, false, 29, 81 )
						pixelc:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pixelc, event )
						else
							pixelc:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixelcFrame3( pixelc, event )
						return 
					else
						pixelc:beginAnimation( "keyframe", 209, true, true, CoD.TweenType.Back )
						pixelc:setLeftRight( true, false, 66.52, 82.52 )
						pixelc:registerEventHandler( "transition_complete_keyframe", pixelcFrame3 )
					end
				end
				
				pixelc:completeAnimation()
				self.pixelc:setLeftRight( true, false, 42, 58 )
				self.pixelc:setTopBottom( true, false, 29, 81 )
				self.pixelc:setAlpha( 1 )
				pixelcFrame2( pixelc, {} )
				local pixeldFrame2 = function ( pixeld, event )
					local pixeldFrame3 = function ( pixeld, event )
						if not event.interrupted then
							pixeld:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Back )
						end
						pixeld:setLeftRight( true, false, 94, 134 )
						pixeld:setTopBottom( true, false, 28.5, 80.5 )
						pixeld:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( pixeld, event )
						else
							pixeld:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						pixeldFrame3( pixeld, event )
						return 
					else
						pixeld:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Back )
						pixeld:setLeftRight( true, false, 167.2, 207.2 )
						pixeld:registerEventHandler( "transition_complete_keyframe", pixeldFrame3 )
					end
				end
				
				pixeld:completeAnimation()
				self.pixeld:setLeftRight( true, false, 94, 134 )
				self.pixeld:setTopBottom( true, false, 28.5, 80.5 )
				self.pixeld:setAlpha( 1 )
				pixeldFrame2( pixeld, {} )
				centersquare:completeAnimation()
				self.centersquare:setAlpha( 1 )
				self.clipFinished( centersquare, {} )
				local ElemBackBFrame2 = function ( ElemBackB, event )
					local ElemBackBFrame3 = function ( ElemBackB, event )
						local ElemBackBFrame4 = function ( ElemBackB, event )
							if not event.interrupted then
								ElemBackB:beginAnimation( "keyframe", 339, true, true, CoD.TweenType.Linear )
							end
							ElemBackB:setLeftRight( true, false, 108, 136 )
							ElemBackB:setTopBottom( true, false, -5, 115 )
							ElemBackB:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemBackB, event )
							else
								ElemBackB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemBackBFrame4( ElemBackB, event )
							return 
						else
							ElemBackB:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							ElemBackB:registerEventHandler( "transition_complete_keyframe", ElemBackBFrame4 )
						end
					end
					
					if event.interrupted then
						ElemBackBFrame3( ElemBackB, event )
						return 
					else
						ElemBackB:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Linear )
						ElemBackB:setLeftRight( true, false, 557, 585 )
						ElemBackB:registerEventHandler( "transition_complete_keyframe", ElemBackBFrame3 )
					end
				end
				
				ElemBackB:completeAnimation()
				self.ElemBackB:setLeftRight( true, false, 158, 186 )
				self.ElemBackB:setTopBottom( true, false, -5, 115 )
				self.ElemBackB:setAlpha( 1 )
				ElemBackBFrame2( ElemBackB, {} )
				local ElemBackA0Frame2 = function ( ElemBackA0, event )
					local ElemBackA0Frame3 = function ( ElemBackA0, event )
						local ElemBackA0Frame4 = function ( ElemBackA0, event )
							if not event.interrupted then
								ElemBackA0:beginAnimation( "keyframe", 110, true, true, CoD.TweenType.Linear )
							end
							ElemBackA0:setLeftRight( true, false, 110, 146 )
							ElemBackA0:setTopBottom( true, false, -4.32, 115.68 )
							ElemBackA0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemBackA0, event )
							else
								ElemBackA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemBackA0Frame4( ElemBackA0, event )
							return 
						else
							ElemBackA0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
							ElemBackA0:registerEventHandler( "transition_complete_keyframe", ElemBackA0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemBackA0Frame3( ElemBackA0, event )
						return 
					else
						ElemBackA0:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
						ElemBackA0:setLeftRight( true, false, 545, 581 )
						ElemBackA0:setTopBottom( true, false, -5, 115 )
						ElemBackA0:registerEventHandler( "transition_complete_keyframe", ElemBackA0Frame3 )
					end
				end
				
				ElemBackA0:completeAnimation()
				self.ElemBackA0:setLeftRight( true, false, 110, 146 )
				self.ElemBackA0:setTopBottom( true, false, -4.32, 115.68 )
				self.ElemBackA0:setAlpha( 1 )
				ElemBackA0Frame2( ElemBackA0, {} )
				local ElemForeB0Frame2 = function ( ElemForeB0, event )
					local ElemForeB0Frame3 = function ( ElemForeB0, event )
						local ElemForeB0Frame4 = function ( ElemForeB0, event )
							if not event.interrupted then
								ElemForeB0:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
							end
							ElemForeB0:setLeftRight( true, false, 106, 114 )
							ElemForeB0:setTopBottom( true, false, 22.5, 86.5 )
							ElemForeB0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemForeB0, event )
							else
								ElemForeB0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemForeB0Frame4( ElemForeB0, event )
							return 
						else
							ElemForeB0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
							ElemForeB0:registerEventHandler( "transition_complete_keyframe", ElemForeB0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemForeB0Frame3( ElemForeB0, event )
						return 
					else
						ElemForeB0:beginAnimation( "keyframe", 219, true, true, CoD.TweenType.Linear )
						ElemForeB0:setLeftRight( true, false, 529, 537 )
						ElemForeB0:registerEventHandler( "transition_complete_keyframe", ElemForeB0Frame3 )
					end
				end
				
				ElemForeB0:completeAnimation()
				self.ElemForeB0:setLeftRight( true, false, 106, 114 )
				self.ElemForeB0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemForeB0:setAlpha( 1 )
				ElemForeB0Frame2( ElemForeB0, {} )
				local ElemMid0Frame2 = function ( ElemMid0, event )
					local ElemMid0Frame3 = function ( ElemMid0, event )
						local ElemMid0Frame4 = function ( ElemMid0, event )
							if not event.interrupted then
								ElemMid0:beginAnimation( "keyframe", 199, true, true, CoD.TweenType.Linear )
							end
							ElemMid0:setLeftRight( true, false, 24, 144 )
							ElemMid0:setTopBottom( true, false, 22.5, 86.5 )
							ElemMid0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemMid0, event )
							else
								ElemMid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemMid0Frame4( ElemMid0, event )
							return 
						else
							ElemMid0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
							ElemMid0:registerEventHandler( "transition_complete_keyframe", ElemMid0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemMid0Frame3( ElemMid0, event )
						return 
					else
						ElemMid0:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						ElemMid0:setLeftRight( true, false, 473, 593 )
						ElemMid0:registerEventHandler( "transition_complete_keyframe", ElemMid0Frame3 )
					end
				end
				
				ElemMid0:completeAnimation()
				self.ElemMid0:setLeftRight( true, false, 24, 144 )
				self.ElemMid0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemMid0:setAlpha( 1 )
				ElemMid0Frame2( ElemMid0, {} )
				local ElemForeA0Frame2 = function ( ElemForeA0, event )
					local ElemForeA0Frame3 = function ( ElemForeA0, event )
						local ElemForeA0Frame4 = function ( ElemForeA0, event )
							if not event.interrupted then
								ElemForeA0:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
							end
							ElemForeA0:setLeftRight( true, false, 110, 138 )
							ElemForeA0:setTopBottom( true, false, 22.67, 86.67 )
							ElemForeA0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemForeA0, event )
							else
								ElemForeA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemForeA0Frame4( ElemForeA0, event )
							return 
						else
							ElemForeA0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							ElemForeA0:registerEventHandler( "transition_complete_keyframe", ElemForeA0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemForeA0Frame3( ElemForeA0, event )
						return 
					else
						ElemForeA0:beginAnimation( "keyframe", 239, true, true, CoD.TweenType.Linear )
						ElemForeA0:setLeftRight( true, false, 543, 571 )
						ElemForeA0:registerEventHandler( "transition_complete_keyframe", ElemForeA0Frame3 )
					end
				end
				
				ElemForeA0:completeAnimation()
				self.ElemForeA0:setLeftRight( true, false, 110, 138 )
				self.ElemForeA0:setTopBottom( true, false, 22.67, 86.67 )
				self.ElemForeA0:setAlpha( 1 )
				ElemForeA0Frame2( ElemForeA0, {} )
				local ElemForeC0Frame2 = function ( ElemForeC0, event )
					local ElemForeC0Frame3 = function ( ElemForeC0, event )
						local ElemForeC0Frame4 = function ( ElemForeC0, event )
							if not event.interrupted then
								ElemForeC0:beginAnimation( "keyframe", 199, true, true, CoD.TweenType.Linear )
							end
							ElemForeC0:setLeftRight( true, false, 102, 118 )
							ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
							ElemForeC0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemForeC0, event )
							else
								ElemForeC0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemForeC0Frame4( ElemForeC0, event )
							return 
						else
							ElemForeC0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							ElemForeC0:registerEventHandler( "transition_complete_keyframe", ElemForeC0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemForeC0Frame3( ElemForeC0, event )
						return 
					else
						ElemForeC0:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						ElemForeC0:setLeftRight( true, false, 571, 587 )
						ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
						ElemForeC0:registerEventHandler( "transition_complete_keyframe", ElemForeC0Frame3 )
					end
				end
				
				ElemForeC0:completeAnimation()
				self.ElemForeC0:setLeftRight( true, false, 102, 118 )
				self.ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
				self.ElemForeC0:setAlpha( 1 )
				ElemForeC0Frame2( ElemForeC0, {} )
				local ElemForeD0Frame2 = function ( ElemForeD0, event )
					local ElemForeD0Frame3 = function ( ElemForeD0, event )
						local ElemForeD0Frame4 = function ( ElemForeD0, event )
							if not event.interrupted then
								ElemForeD0:beginAnimation( "keyframe", 349, true, true, CoD.TweenType.Linear )
							end
							ElemForeD0:setLeftRight( true, false, 76, 104 )
							ElemForeD0:setTopBottom( true, false, 22.5, 86.5 )
							ElemForeD0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemForeD0, event )
							else
								ElemForeD0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemForeD0Frame4( ElemForeD0, event )
							return 
						else
							ElemForeD0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							ElemForeD0:registerEventHandler( "transition_complete_keyframe", ElemForeD0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemForeD0Frame3( ElemForeD0, event )
						return 
					else
						ElemForeD0:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Linear )
						ElemForeD0:setLeftRight( true, false, 549, 577 )
						ElemForeD0:registerEventHandler( "transition_complete_keyframe", ElemForeD0Frame3 )
					end
				end
				
				ElemForeD0:completeAnimation()
				self.ElemForeD0:setLeftRight( true, false, 76, 104 )
				self.ElemForeD0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemForeD0:setAlpha( 1 )
				ElemForeD0Frame2( ElemForeD0, {} )
				local ElemBaseA0Frame2 = function ( ElemBaseA0, event )
					local ElemBaseA0Frame3 = function ( ElemBaseA0, event )
						local ElemBaseA0Frame4 = function ( ElemBaseA0, event )
							if not event.interrupted then
								ElemBaseA0:beginAnimation( "keyframe", 269, true, true, CoD.TweenType.Linear )
							end
							ElemBaseA0:setLeftRight( true, false, 66, 122 )
							ElemBaseA0:setTopBottom( true, false, 86.67, 102.67 )
							ElemBaseA0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemBaseA0, event )
							else
								ElemBaseA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemBaseA0Frame4( ElemBaseA0, event )
							return 
						else
							ElemBaseA0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							ElemBaseA0:registerEventHandler( "transition_complete_keyframe", ElemBaseA0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemBaseA0Frame3( ElemBaseA0, event )
						return 
					else
						ElemBaseA0:beginAnimation( "keyframe", 239, true, true, CoD.TweenType.Linear )
						ElemBaseA0:setLeftRight( true, false, 529, 585 )
						ElemBaseA0:registerEventHandler( "transition_complete_keyframe", ElemBaseA0Frame3 )
					end
				end
				
				ElemBaseA0:completeAnimation()
				self.ElemBaseA0:setLeftRight( true, false, 66, 122 )
				self.ElemBaseA0:setTopBottom( true, false, 86.67, 102.67 )
				self.ElemBaseA0:setAlpha( 1 )
				ElemBaseA0Frame2( ElemBaseA0, {} )
				local ElemTopC0Frame2 = function ( ElemTopC0, event )
					local ElemTopC0Frame3 = function ( ElemTopC0, event )
						local ElemTopC0Frame4 = function ( ElemTopC0, event )
							if not event.interrupted then
								ElemTopC0:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
							end
							ElemTopC0:setLeftRight( true, false, 122, 146 )
							ElemTopC0:setTopBottom( true, false, 15, 19 )
							ElemTopC0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemTopC0, event )
							else
								ElemTopC0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemTopC0Frame4( ElemTopC0, event )
							return 
						else
							ElemTopC0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							ElemTopC0:registerEventHandler( "transition_complete_keyframe", ElemTopC0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemTopC0Frame3( ElemTopC0, event )
						return 
					else
						ElemTopC0:beginAnimation( "keyframe", 370, true, true, CoD.TweenType.Linear )
						ElemTopC0:setLeftRight( true, false, 521, 545 )
						ElemTopC0:registerEventHandler( "transition_complete_keyframe", ElemTopC0Frame3 )
					end
				end
				
				ElemTopC0:completeAnimation()
				self.ElemTopC0:setLeftRight( true, false, 122, 146 )
				self.ElemTopC0:setTopBottom( true, false, 15, 19 )
				self.ElemTopC0:setAlpha( 1 )
				ElemTopC0Frame2( ElemTopC0, {} )
				local ElemTopB0Frame2 = function ( ElemTopB0, event )
					local ElemTopB0Frame3 = function ( ElemTopB0, event )
						local ElemTopB0Frame4 = function ( ElemTopB0, event )
							if not event.interrupted then
								ElemTopB0:beginAnimation( "keyframe", 249, true, true, CoD.TweenType.Linear )
							end
							ElemTopB0:setLeftRight( true, false, 116, 172 )
							ElemTopB0:setTopBottom( true, false, 15, 19 )
							ElemTopB0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemTopB0, event )
							else
								ElemTopB0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemTopB0Frame4( ElemTopB0, event )
							return 
						else
							ElemTopB0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							ElemTopB0:registerEventHandler( "transition_complete_keyframe", ElemTopB0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemTopB0Frame3( ElemTopB0, event )
						return 
					else
						ElemTopB0:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						ElemTopB0:setLeftRight( true, false, 515, 571 )
						ElemTopB0:registerEventHandler( "transition_complete_keyframe", ElemTopB0Frame3 )
					end
				end
				
				ElemTopB0:completeAnimation()
				self.ElemTopB0:setLeftRight( true, false, 116, 172 )
				self.ElemTopB0:setTopBottom( true, false, 15, 19 )
				self.ElemTopB0:setAlpha( 1 )
				ElemTopB0Frame2( ElemTopB0, {} )
				local ElemTopA0Frame2 = function ( ElemTopA0, event )
					local ElemTopA0Frame3 = function ( ElemTopA0, event )
						local ElemTopA0Frame4 = function ( ElemTopA0, event )
							if not event.interrupted then
								ElemTopA0:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
							end
							ElemTopA0:setLeftRight( true, false, 60, 116 )
							ElemTopA0:setTopBottom( true, false, 15, 19 )
							ElemTopA0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( ElemTopA0, event )
							else
								ElemTopA0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ElemTopA0Frame4( ElemTopA0, event )
							return 
						else
							ElemTopA0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							ElemTopA0:registerEventHandler( "transition_complete_keyframe", ElemTopA0Frame4 )
						end
					end
					
					if event.interrupted then
						ElemTopA0Frame3( ElemTopA0, event )
						return 
					else
						ElemTopA0:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						ElemTopA0:setLeftRight( true, false, 526.5, 582.5 )
						ElemTopA0:registerEventHandler( "transition_complete_keyframe", ElemTopA0Frame3 )
					end
				end
				
				ElemTopA0:completeAnimation()
				self.ElemTopA0:setLeftRight( true, false, 60, 116 )
				self.ElemTopA0:setTopBottom( true, false, 15, 19 )
				self.ElemTopA0:setAlpha( 1 )
				ElemTopA0Frame2( ElemTopA0, {} )
				local MenuTitleFrame2 = function ( MenuTitle, event )
					local MenuTitleFrame3 = function ( MenuTitle, event )
						local MenuTitleFrame4 = function ( MenuTitle, event )
							local MenuTitleFrame5 = function ( MenuTitle, event )
								local MenuTitleFrame6 = function ( MenuTitle, event )
									local MenuTitleFrame7 = function ( MenuTitle, event )
										local MenuTitleFrame8 = function ( MenuTitle, event )
											local MenuTitleFrame9 = function ( MenuTitle, event )
												local MenuTitleFrame10 = function ( MenuTitle, event )
													local MenuTitleFrame11 = function ( MenuTitle, event )
														local MenuTitleFrame12 = function ( MenuTitle, event )
															local MenuTitleFrame13 = function ( MenuTitle, event )
																local MenuTitleFrame14 = function ( MenuTitle, event )
																	local MenuTitleFrame15 = function ( MenuTitle, event )
																		local MenuTitleFrame16 = function ( MenuTitle, event )
																			local MenuTitleFrame17 = function ( MenuTitle, event )
																				local MenuTitleFrame18 = function ( MenuTitle, event )
																					local MenuTitleFrame19 = function ( MenuTitle, event )
																						local MenuTitleFrame20 = function ( MenuTitle, event )
																							local MenuTitleFrame21 = function ( MenuTitle, event )
																								local MenuTitleFrame22 = function ( MenuTitle, event )
																									local MenuTitleFrame23 = function ( MenuTitle, event )
																										if not event.interrupted then
																											MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											MenuTitle.TextBox1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																										end
																										MenuTitle.TextBox1:setAlpha( 1 )
																										if event.interrupted then
																											self.clipFinished( MenuTitle, event )
																										else
																											MenuTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																										end
																									end
																									
																									if event.interrupted then
																										MenuTitleFrame23( MenuTitle, event )
																										return 
																									else
																										MenuTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
																										MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame23 )
																									end
																								end
																								
																								if event.interrupted then
																									MenuTitleFrame22( MenuTitle, event )
																									return 
																								else
																									MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame22 )
																								end
																							end
																							
																							if event.interrupted then
																								MenuTitleFrame21( MenuTitle, event )
																								return 
																							else
																								MenuTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																								MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame21 )
																							end
																						end
																						
																						if event.interrupted then
																							MenuTitleFrame20( MenuTitle, event )
																							return 
																						else
																							MenuTitle:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
																							MenuTitle.TextBox1:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
																							MenuTitle.TextBox1:setAlpha( 1 )
																							MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame20 )
																						end
																					end
																					
																					if event.interrupted then
																						MenuTitleFrame19( MenuTitle, event )
																						return 
																					else
																						MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																						MenuTitle.TextBox1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																						MenuTitle.TextBox1:setAlpha( 0.89 )
																						MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame19 )
																					end
																				end
																				
																				if event.interrupted then
																					MenuTitleFrame18( MenuTitle, event )
																					return 
																				else
																					MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																					MenuTitle.TextBox1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																					MenuTitle.TextBox1:setAlpha( 0.87 )
																					MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame18 )
																				end
																			end
																			
																			if event.interrupted then
																				MenuTitleFrame17( MenuTitle, event )
																				return 
																			else
																				MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				MenuTitle.TextBox1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
																				MenuTitle.TextBox1:setAlpha( 0.84 )
																				MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame17 )
																			end
																		end
																		
																		if event.interrupted then
																			MenuTitleFrame16( MenuTitle, event )
																			return 
																		else
																			MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																			MenuTitle.TextBox1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
																			MenuTitle.TextBox1:setAlpha( 0.82 )
																			MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame16 )
																		end
																	end
																	
																	if event.interrupted then
																		MenuTitleFrame15( MenuTitle, event )
																		return 
																	else
																		MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		MenuTitle.TextBox1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
																		MenuTitle.TextBox1:setAlpha( 0.79 )
																		MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame15 )
																	end
																end
																
																if event.interrupted then
																	MenuTitleFrame14( MenuTitle, event )
																	return 
																else
																	MenuTitle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
																	MenuTitle.TextBox1:beginAnimation( "subkeyframe", 39, false, false, CoD.TweenType.Linear )
																	MenuTitle.TextBox1:setAlpha( 0.77 )
																	MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame14 )
																end
															end
															
															if event.interrupted then
																MenuTitleFrame13( MenuTitle, event )
																return 
															else
																MenuTitle:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Bounce )
																MenuTitle.TextBox1:beginAnimation( "subkeyframe", 259, false, false, CoD.TweenType.Bounce )
																MenuTitle.TextBox1:setAlpha( 0.7 )
																MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame13 )
															end
														end
														
														if event.interrupted then
															MenuTitleFrame12( MenuTitle, event )
															return 
														else
															MenuTitle:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
															MenuTitle.TextBox1:beginAnimation( "subkeyframe", 90, false, false, CoD.TweenType.Linear )
															MenuTitle.TextBox1:setAlpha( 0.23 )
															MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame12 )
														end
													end
													
													if event.interrupted then
														MenuTitleFrame11( MenuTitle, event )
														return 
													else
														MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														MenuTitle.TextBox1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
														MenuTitle.TextBox1:setAlpha( 0.51 )
														MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame11 )
													end
												end
												
												if event.interrupted then
													MenuTitleFrame10( MenuTitle, event )
													return 
												else
													MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													MenuTitle.TextBox1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
													MenuTitle.TextBox1:setAlpha( 0.47 )
													MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame10 )
												end
											end
											
											if event.interrupted then
												MenuTitleFrame9( MenuTitle, event )
												return 
											else
												MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
												MenuTitle.TextBox1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
												MenuTitle.TextBox1:setAlpha( 0.44 )
												MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame9 )
											end
										end
										
										if event.interrupted then
											MenuTitleFrame8( MenuTitle, event )
											return 
										else
											MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											MenuTitle.TextBox1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
											MenuTitle.TextBox1:setAlpha( 0.36 )
											MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame8 )
										end
									end
									
									if event.interrupted then
										MenuTitleFrame7( MenuTitle, event )
										return 
									else
										MenuTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
										MenuTitle.TextBox1:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
										MenuTitle.TextBox1:setAlpha( 0.33 )
										MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame7 )
									end
								end
								
								if event.interrupted then
									MenuTitleFrame6( MenuTitle, event )
									return 
								else
									MenuTitle:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									MenuTitle.TextBox1:beginAnimation( "subkeyframe", 10, false, false, CoD.TweenType.Linear )
									MenuTitle.TextBox1:setAlpha( 0.26 )
									MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame6 )
								end
							end
							
							if event.interrupted then
								MenuTitleFrame5( MenuTitle, event )
								return 
							else
								MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								MenuTitle.TextBox1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
								MenuTitle.TextBox1:setAlpha( 0.22 )
								MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame5 )
							end
						end
						
						if event.interrupted then
							MenuTitleFrame4( MenuTitle, event )
							return 
						else
							MenuTitle:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							MenuTitle.TextBox1:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							MenuTitle.TextBox1:setAlpha( 0.15 )
							MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame4 )
						end
					end
					
					if event.interrupted then
						MenuTitleFrame3( MenuTitle, event )
						return 
					else
						MenuTitle:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						MenuTitle.TextBox1:beginAnimation( "subkeyframe", 29, false, false, CoD.TweenType.Linear )
						MenuTitle.TextBox1:setAlpha( 0.11 )
						MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame3 )
					end
				end
				
				MenuTitle:completeAnimation()
				MenuTitle.TextBox1:completeAnimation()
				self.MenuTitle.TextBox1:setAlpha( 0 )
				MenuTitleFrame2( MenuTitle, {} )
			end,
			TextChange = function ()
				self:setupElementClipCounter( 20 )
				circles:completeAnimation()
				self.circles:setAlpha( 1 )
				self.clipFinished( circles, {} )
				diaglrg:completeAnimation()
				self.diaglrg:setLeftRight( true, false, 38, 190 )
				self.diaglrg:setTopBottom( true, false, 54.67, 62.67 )
				self.diaglrg:setAlpha( 1 )
				self.clipFinished( diaglrg, {} )
				diagsm:completeAnimation()
				self.diagsm:setLeftRight( true, false, 161, 197 )
				self.diagsm:setTopBottom( true, false, 14.67, 22.67 )
				self.diagsm:setAlpha( 1 )
				self.clipFinished( diagsm, {} )
				pixela:completeAnimation()
				self.pixela:setLeftRight( true, false, 32, 44 )
				self.pixela:setTopBottom( true, false, 29, 81 )
				self.pixela:setAlpha( 1 )
				self.clipFinished( pixela, {} )
				pixelb:completeAnimation()
				self.pixelb:setLeftRight( true, false, 68, 100 )
				self.pixelb:setTopBottom( true, false, 29, 81 )
				self.pixelb:setAlpha( 1 )
				self.clipFinished( pixelb, {} )
				pixelc:completeAnimation()
				self.pixelc:setLeftRight( true, false, 42, 58 )
				self.pixelc:setTopBottom( true, false, 29, 81 )
				self.pixelc:setAlpha( 1 )
				self.clipFinished( pixelc, {} )
				pixeld:completeAnimation()
				self.pixeld:setLeftRight( true, false, 94, 134 )
				self.pixeld:setTopBottom( true, false, 28.5, 80.5 )
				self.pixeld:setAlpha( 1 )
				self.clipFinished( pixeld, {} )
				centersquare:completeAnimation()
				self.centersquare:setAlpha( 1 )
				self.clipFinished( centersquare, {} )
				ElemBackB:completeAnimation()
				self.ElemBackB:setAlpha( 1 )
				self.clipFinished( ElemBackB, {} )
				ElemBackA0:completeAnimation()
				self.ElemBackA0:setLeftRight( true, false, 110, 146 )
				self.ElemBackA0:setTopBottom( true, false, -4.32, 115.68 )
				self.ElemBackA0:setAlpha( 1 )
				self.clipFinished( ElemBackA0, {} )
				ElemForeB0:completeAnimation()
				self.ElemForeB0:setLeftRight( true, false, 106, 114 )
				self.ElemForeB0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemForeB0:setAlpha( 1 )
				self.clipFinished( ElemForeB0, {} )
				ElemMid0:completeAnimation()
				self.ElemMid0:setLeftRight( true, false, 24, 144 )
				self.ElemMid0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemMid0:setAlpha( 1 )
				self.clipFinished( ElemMid0, {} )
				ElemForeA0:completeAnimation()
				self.ElemForeA0:setLeftRight( true, false, 110, 138 )
				self.ElemForeA0:setTopBottom( true, false, 22.67, 86.67 )
				self.ElemForeA0:setAlpha( 1 )
				self.clipFinished( ElemForeA0, {} )
				ElemForeC0:completeAnimation()
				self.ElemForeC0:setLeftRight( true, false, 102, 118 )
				self.ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
				self.ElemForeC0:setAlpha( 1 )
				self.clipFinished( ElemForeC0, {} )
				ElemForeD0:completeAnimation()
				self.ElemForeD0:setLeftRight( true, false, 76, 104 )
				self.ElemForeD0:setTopBottom( true, false, 22.5, 86.5 )
				self.ElemForeD0:setAlpha( 1 )
				self.clipFinished( ElemForeD0, {} )
				ElemBaseA0:completeAnimation()
				self.ElemBaseA0:setLeftRight( true, false, 66, 122 )
				self.ElemBaseA0:setTopBottom( true, false, 86.67, 102.67 )
				self.ElemBaseA0:setAlpha( 1 )
				self.clipFinished( ElemBaseA0, {} )
				ElemTopC0:completeAnimation()
				self.ElemTopC0:setLeftRight( true, false, 122, 146 )
				self.ElemTopC0:setTopBottom( true, false, 15, 19 )
				self.ElemTopC0:setAlpha( 1 )
				self.clipFinished( ElemTopC0, {} )
				ElemTopB0:completeAnimation()
				self.ElemTopB0:setLeftRight( true, false, 116, 172 )
				self.ElemTopB0:setTopBottom( true, false, 15, 19 )
				self.ElemTopB0:setAlpha( 1 )
				self.clipFinished( ElemTopB0, {} )
				ElemTopA0:completeAnimation()
				self.ElemTopA0:setLeftRight( true, false, 60, 116 )
				self.ElemTopA0:setTopBottom( true, false, 15, 19 )
				self.ElemTopA0:setAlpha( 1 )
				self.clipFinished( ElemTopA0, {} )
				local MenuTitleFrame2 = function ( MenuTitle, event )
					local MenuTitleFrame3 = function ( MenuTitle, event )
						local MenuTitleFrame4 = function ( MenuTitle, event )
							local MenuTitleFrame5 = function ( MenuTitle, event )
								if not event.interrupted then
									MenuTitle:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
									MenuTitle.TextBox1:beginAnimation( "subkeyframe", 49, false, false, CoD.TweenType.Linear )
								end
								MenuTitle.TextBox1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( MenuTitle, event )
								else
									MenuTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								MenuTitleFrame5( MenuTitle, event )
								return 
							else
								MenuTitle:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								MenuTitle.TextBox1:beginAnimation( "subkeyframe", 20, false, false, CoD.TweenType.Linear )
								MenuTitle.TextBox1:setAlpha( 0.58 )
								MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame5 )
							end
						end
						
						if event.interrupted then
							MenuTitleFrame4( MenuTitle, event )
							return 
						else
							MenuTitle:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							MenuTitle.TextBox1:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
							MenuTitle.TextBox1:setAlpha( 0.19 )
							MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame4 )
						end
					end
					
					if event.interrupted then
						MenuTitleFrame3( MenuTitle, event )
						return 
					else
						MenuTitle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						MenuTitle.TextBox1:beginAnimation( "subkeyframe", 50, false, false, CoD.TweenType.Linear )
						MenuTitle.TextBox1:setAlpha( 0.64 )
						MenuTitle:registerEventHandler( "transition_complete_keyframe", MenuTitleFrame3 )
					end
				end
				
				MenuTitle:completeAnimation()
				MenuTitle.TextBox1:completeAnimation()
				self.MenuTitle.TextBox1:setAlpha( 1 )
				MenuTitleFrame2( MenuTitle, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ElemBackB:close()
		element.ElemBackA0:close()
		element.ElemForeB0:close()
		element.ElemMid0:close()
		element.ElemForeA0:close()
		element.ElemForeC0:close()
		element.ElemForeD0:close()
		element.ElemBaseA0:close()
		element.ElemTopC0:close()
		element.ElemTopB0:close()
		element.ElemTopA0:close()
		element.MenuTitle:close()
		element.Local:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

