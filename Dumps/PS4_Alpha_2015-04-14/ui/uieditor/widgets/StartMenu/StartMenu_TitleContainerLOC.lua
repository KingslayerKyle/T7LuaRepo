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
require( "ui.uieditor.widgets.StartMenu.StartMenu_3dTitle" )

CoD.StartMenu_TitleContainerLOC = InheritFrom( LUI.UIElement )
CoD.StartMenu_TitleContainerLOC.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_TitleContainerLOC )
	self.id = "StartMenu_TitleContainerLOC"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 578 )
	self:setTopBottom( true, false, 0, 146 )
	self.anyChildUsesUpdateState = true
	
	local pixela = LUI.UIImage.new()
	pixela:setLeftRight( true, false, 32, 44 )
	pixela:setTopBottom( true, false, 29, 81 )
	pixela:setRGB( 1, 1, 1 )
	pixela:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixela" ) )
	pixela:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixela )
	self.pixela = pixela
	
	local pixelb = LUI.UIImage.new()
	pixelb:setLeftRight( true, false, 68, 100 )
	pixelb:setTopBottom( true, false, 29, 81 )
	pixelb:setRGB( 1, 1, 1 )
	pixelb:setZoom( 10 )
	pixelb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelb )
	self.pixelb = pixelb
	
	local pixelc = LUI.UIImage.new()
	pixelc:setLeftRight( true, false, 42, 58 )
	pixelc:setTopBottom( true, false, 29, 81 )
	pixelc:setRGB( 1, 1, 1 )
	pixelc:setZoom( -5 )
	pixelc:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc )
	self.pixelc = pixelc
	
	local pixeld = LUI.UIImage.new()
	pixeld:setLeftRight( true, false, 94, 134 )
	pixeld:setTopBottom( true, false, 28.5, 80.5 )
	pixeld:setRGB( 1, 1, 1 )
	pixeld:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixeld" ) )
	pixeld:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixeld )
	self.pixeld = pixeld
	
	local ElemBackA0 = CoD.FE_TitleElemBackA.new( menu, controller )
	ElemBackA0:setLeftRight( true, false, 110, 146 )
	ElemBackA0:setTopBottom( true, false, -4.32, 115.68 )
	ElemBackA0:setRGB( 1, 1, 1 )
	self:addElement( ElemBackA0 )
	self.ElemBackA0 = ElemBackA0
	
	local ElemForeB0 = CoD.FE_TitleElemForeB.new( menu, controller )
	ElemForeB0:setLeftRight( true, false, 106, 114 )
	ElemForeB0:setTopBottom( true, false, 22.5, 86.5 )
	ElemForeB0:setRGB( 1, 1, 1 )
	self:addElement( ElemForeB0 )
	self.ElemForeB0 = ElemForeB0
	
	local ElemMid0 = CoD.FE_TitleElemMid.new( menu, controller )
	ElemMid0:setLeftRight( true, false, 24, 144 )
	ElemMid0:setTopBottom( true, false, 22.5, 86.5 )
	ElemMid0:setRGB( 1, 1, 1 )
	self:addElement( ElemMid0 )
	self.ElemMid0 = ElemMid0
	
	local ElemForeA0 = CoD.FE_TitleElemForeA.new( menu, controller )
	ElemForeA0:setLeftRight( true, false, 110, 138 )
	ElemForeA0:setTopBottom( true, false, 22.67, 86.67 )
	ElemForeA0:setRGB( 1, 1, 1 )
	self:addElement( ElemForeA0 )
	self.ElemForeA0 = ElemForeA0
	
	local ElemForeC0 = CoD.FE_TitleElemForeC.new( menu, controller )
	ElemForeC0:setLeftRight( true, false, 102, 118 )
	ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
	ElemForeC0:setRGB( 1, 1, 1 )
	self:addElement( ElemForeC0 )
	self.ElemForeC0 = ElemForeC0
	
	local ElemForeD0 = CoD.FE_TitleElemForeD.new( menu, controller )
	ElemForeD0:setLeftRight( true, false, 76, 104 )
	ElemForeD0:setTopBottom( true, false, 22.5, 86.5 )
	ElemForeD0:setRGB( 1, 1, 1 )
	self:addElement( ElemForeD0 )
	self.ElemForeD0 = ElemForeD0
	
	local ElemBaseA0 = CoD.FE_TitleElemBaseA.new( menu, controller )
	ElemBaseA0:setLeftRight( true, false, 66, 122 )
	ElemBaseA0:setTopBottom( true, false, 86.67, 102.67 )
	ElemBaseA0:setRGB( 1, 1, 1 )
	self:addElement( ElemBaseA0 )
	self.ElemBaseA0 = ElemBaseA0
	
	local ElemTopC0 = CoD.FE_TitleElemTopC.new( menu, controller )
	ElemTopC0:setLeftRight( true, false, 122, 146 )
	ElemTopC0:setTopBottom( true, false, 15, 19 )
	ElemTopC0:setRGB( 1, 1, 1 )
	self:addElement( ElemTopC0 )
	self.ElemTopC0 = ElemTopC0
	
	local ElemTopB0 = CoD.FE_TitleElemTopB.new( menu, controller )
	ElemTopB0:setLeftRight( true, false, 116, 172 )
	ElemTopB0:setTopBottom( true, false, 15, 19 )
	ElemTopB0:setRGB( 1, 1, 1 )
	self:addElement( ElemTopB0 )
	self.ElemTopB0 = ElemTopB0
	
	local ElemTopA0 = CoD.FE_TitleElemTopA.new( menu, controller )
	ElemTopA0:setLeftRight( true, false, 60, 116 )
	ElemTopA0:setTopBottom( true, false, 15, 19 )
	ElemTopA0:setRGB( 1, 1, 1 )
	self:addElement( ElemTopA0 )
	self.ElemTopA0 = ElemTopA0
	
	local StartMenu3dTitle = CoD.StartMenu_3dTitle.new( menu, controller )
	StartMenu3dTitle:setLeftRight( true, false, 136, 1080 )
	StartMenu3dTitle:setTopBottom( true, false, 29, 80 )
	StartMenu3dTitle:setRGB( 1, 1, 1 )
	StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "WILDCARDS" ) )
	self:addElement( StartMenu3dTitle )
	self.StartMenu3dTitle = StartMenu3dTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
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
			end,
			Intro = function ()
				self:setupElementClipCounter( 14 )
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
							ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
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
			end,
			Update = function ()
				self:setupElementClipCounter( 14 )
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
							ElemForeC0:setTopBottom( true, false, 21.83, 87.17 )
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
			end
		}
	}
	self.close = function ( self )
		self.ElemBackA0:close()
		self.ElemForeB0:close()
		self.ElemMid0:close()
		self.ElemForeA0:close()
		self.ElemForeC0:close()
		self.ElemForeD0:close()
		self.ElemBaseA0:close()
		self.ElemTopC0:close()
		self.ElemTopB0:close()
		self.ElemTopA0:close()
		self.StartMenu3dTitle:close()
		CoD.StartMenu_TitleContainerLOC.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

