require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemBackA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemBaseA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeB" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeC" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeD" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemMid" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemTopA" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemTopB" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemTopC" )
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
	self:setLeftRight( 0, 0, 0, 867 )
	self:setTopBottom( 0, 0, 0, 219 )
	self.anyChildUsesUpdateState = true
	
	local pixela = LUI.UIImage.new()
	pixela:setLeftRight( 0, 0, 48, 66 )
	pixela:setTopBottom( 0, 0, 43, 121 )
	pixela:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixela" ) )
	pixela:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixela )
	self.pixela = pixela
	
	local pixelb = LUI.UIImage.new()
	pixelb:setLeftRight( 0, 0, 102, 150 )
	pixelb:setTopBottom( 0, 0, 43, 121 )
	pixelb:setZoom( 10 )
	pixelb:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelb:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelb )
	self.pixelb = pixelb
	
	local pixelc = LUI.UIImage.new()
	pixelc:setLeftRight( 0, 0, 63, 87 )
	pixelc:setTopBottom( 0, 0, 43, 121 )
	pixelc:setZoom( -5 )
	pixelc:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	pixelc:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelc )
	self.pixelc = pixelc
	
	local pixeld = LUI.UIImage.new()
	pixeld:setLeftRight( 0, 0, 141, 201 )
	pixeld:setTopBottom( 0, 0, 43, 121 )
	pixeld:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixeld" ) )
	pixeld:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixeld )
	self.pixeld = pixeld
	
	local ElemBackA0 = CoD.FE_TitleElemBackA.new( menu, controller )
	ElemBackA0:setLeftRight( 0, 0, 165, 219 )
	ElemBackA0:setTopBottom( 0, 0, -6, 174 )
	self:addElement( ElemBackA0 )
	self.ElemBackA0 = ElemBackA0
	
	local ElemForeB0 = CoD.FE_TitleElemForeB.new( menu, controller )
	ElemForeB0:setLeftRight( 0, 0, 159, 171 )
	ElemForeB0:setTopBottom( 0, 0, 34, 130 )
	self:addElement( ElemForeB0 )
	self.ElemForeB0 = ElemForeB0
	
	local ElemMid0 = CoD.FE_TitleElemMid.new( menu, controller )
	ElemMid0:setLeftRight( 0, 0, 36, 216 )
	ElemMid0:setTopBottom( 0, 0, 34, 130 )
	self:addElement( ElemMid0 )
	self.ElemMid0 = ElemMid0
	
	local ElemForeA0 = CoD.FE_TitleElemForeA.new( menu, controller )
	ElemForeA0:setLeftRight( 0, 0, 165, 207 )
	ElemForeA0:setTopBottom( 0, 0, 34, 130 )
	self:addElement( ElemForeA0 )
	self.ElemForeA0 = ElemForeA0
	
	local ElemForeC0 = CoD.FE_TitleElemForeC.new( menu, controller )
	ElemForeC0:setLeftRight( 0, 0, 153, 177 )
	ElemForeC0:setTopBottom( 0, 0, 33, 131 )
	self:addElement( ElemForeC0 )
	self.ElemForeC0 = ElemForeC0
	
	local ElemForeD0 = CoD.FE_TitleElemForeD.new( menu, controller )
	ElemForeD0:setLeftRight( 0, 0, 114, 156 )
	ElemForeD0:setTopBottom( 0, 0, 34, 130 )
	self:addElement( ElemForeD0 )
	self.ElemForeD0 = ElemForeD0
	
	local ElemBaseA0 = CoD.FE_TitleElemBaseA.new( menu, controller )
	ElemBaseA0:setLeftRight( 0, 0, 99, 183 )
	ElemBaseA0:setTopBottom( 0, 0, 130, 154 )
	self:addElement( ElemBaseA0 )
	self.ElemBaseA0 = ElemBaseA0
	
	local ElemTopC0 = CoD.FE_TitleElemTopC.new( menu, controller )
	ElemTopC0:setLeftRight( 0, 0, 183, 219 )
	ElemTopC0:setTopBottom( 0, 0, 23, 29 )
	self:addElement( ElemTopC0 )
	self.ElemTopC0 = ElemTopC0
	
	local ElemTopB0 = CoD.FE_TitleElemTopB.new( menu, controller )
	ElemTopB0:setLeftRight( 0, 0, 174, 258 )
	ElemTopB0:setTopBottom( 0, 0, 23, 29 )
	self:addElement( ElemTopB0 )
	self.ElemTopB0 = ElemTopB0
	
	local ElemTopA0 = CoD.FE_TitleElemTopA.new( menu, controller )
	ElemTopA0:setLeftRight( 0, 0, 90, 174 )
	ElemTopA0:setTopBottom( 0, 0, 23, 29 )
	self:addElement( ElemTopA0 )
	self.ElemTopA0 = ElemTopA0
	
	local StartMenu3dTitle = CoD.StartMenu_3dTitle.new( menu, controller )
	StartMenu3dTitle:setLeftRight( 0, 0, 204, 1620 )
	StartMenu3dTitle:setTopBottom( 0, 0, 44, 120 )
	StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "WILDCARDS" ) )
	self:addElement( StartMenu3dTitle )
	self.StartMenu3dTitle = StartMenu3dTitle
	
	self.resetProperties = function ()
		ElemTopA0:completeAnimation()
		ElemTopB0:completeAnimation()
		ElemTopC0:completeAnimation()
		ElemBaseA0:completeAnimation()
		ElemForeD0:completeAnimation()
		ElemForeC0:completeAnimation()
		ElemForeA0:completeAnimation()
		ElemMid0:completeAnimation()
		ElemForeB0:completeAnimation()
		ElemBackA0:completeAnimation()
		pixeld:completeAnimation()
		pixelc:completeAnimation()
		pixelb:completeAnimation()
		pixela:completeAnimation()
		ElemTopA0:setLeftRight( 0, 0, 90, 174 )
		ElemTopA0:setTopBottom( 0, 0, 23, 29 )
		ElemTopA0:setAlpha( 1 )
		ElemTopB0:setLeftRight( 0, 0, 174, 258 )
		ElemTopB0:setTopBottom( 0, 0, 23, 29 )
		ElemTopB0:setAlpha( 1 )
		ElemTopC0:setLeftRight( 0, 0, 183, 219 )
		ElemTopC0:setTopBottom( 0, 0, 23, 29 )
		ElemTopC0:setAlpha( 1 )
		ElemBaseA0:setLeftRight( 0, 0, 99, 183 )
		ElemBaseA0:setTopBottom( 0, 0, 130, 154 )
		ElemBaseA0:setAlpha( 1 )
		ElemForeD0:setLeftRight( 0, 0, 114, 156 )
		ElemForeD0:setTopBottom( 0, 0, 34, 130 )
		ElemForeD0:setAlpha( 1 )
		ElemForeC0:setLeftRight( 0, 0, 153, 177 )
		ElemForeC0:setTopBottom( 0, 0, 33, 131 )
		ElemForeC0:setAlpha( 1 )
		ElemForeA0:setLeftRight( 0, 0, 165, 207 )
		ElemForeA0:setTopBottom( 0, 0, 34, 130 )
		ElemForeA0:setAlpha( 1 )
		ElemMid0:setLeftRight( 0, 0, 36, 216 )
		ElemMid0:setTopBottom( 0, 0, 34, 130 )
		ElemMid0:setAlpha( 1 )
		ElemForeB0:setLeftRight( 0, 0, 159, 171 )
		ElemForeB0:setTopBottom( 0, 0, 34, 130 )
		ElemForeB0:setAlpha( 1 )
		ElemBackA0:setLeftRight( 0, 0, 165, 219 )
		ElemBackA0:setTopBottom( 0, 0, -6, 174 )
		ElemBackA0:setAlpha( 1 )
		pixeld:setLeftRight( 0, 0, 141, 201 )
		pixeld:setTopBottom( 0, 0, 43, 121 )
		pixeld:setAlpha( 1 )
		pixelc:setLeftRight( 0, 0, 63, 87 )
		pixelc:setTopBottom( 0, 0, 43, 121 )
		pixelc:setAlpha( 1 )
		pixelb:setLeftRight( 0, 0, 102, 150 )
		pixelb:setTopBottom( 0, 0, 43, 121 )
		pixelb:setAlpha( 1 )
		pixela:setLeftRight( 0, 0, 48, 66 )
		pixela:setTopBottom( 0, 0, 43, 121 )
		pixela:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				local pixelaFrame2 = function ( pixela, event )
					local pixelaFrame3 = function ( pixela, event )
						if not event.interrupted then
							pixela:beginAnimation( "keyframe", 319, true, true, CoD.TweenType.Linear )
						end
						pixela:setLeftRight( 0, 0, 48, 66 )
						pixela:setTopBottom( 0, 0, 43, 121 )
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
						pixela:setLeftRight( 0, 0, 117, 135 )
						pixela:registerEventHandler( "transition_complete_keyframe", pixelaFrame3 )
					end
				end
				
				pixela:completeAnimation()
				self.pixela:setLeftRight( 0, 0, 48, 66 )
				self.pixela:setTopBottom( 0, 0, 43, 121 )
				self.pixela:setAlpha( 1 )
				pixelaFrame2( pixela, {} )
				local pixelbFrame2 = function ( pixelb, event )
					local pixelbFrame3 = function ( pixelb, event )
						if not event.interrupted then
							pixelb:beginAnimation( "keyframe", 259, true, true, CoD.TweenType.Linear )
						end
						pixelb:setLeftRight( 0, 0, 102, 150 )
						pixelb:setTopBottom( 0, 0, 43, 121 )
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
						pixelb:setLeftRight( 0, 0, 236, 284 )
						pixelb:registerEventHandler( "transition_complete_keyframe", pixelbFrame3 )
					end
				end
				
				pixelb:completeAnimation()
				self.pixelb:setLeftRight( 0, 0, 102, 150 )
				self.pixelb:setTopBottom( 0, 0, 43, 121 )
				self.pixelb:setAlpha( 1 )
				pixelbFrame2( pixelb, {} )
				local pixelcFrame2 = function ( pixelc, event )
					local pixelcFrame3 = function ( pixelc, event )
						if not event.interrupted then
							pixelc:beginAnimation( "keyframe", 420, true, true, CoD.TweenType.Back )
						end
						pixelc:setLeftRight( 0, 0, 63, 87 )
						pixelc:setTopBottom( 0, 0, 43, 121 )
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
						pixelc:setLeftRight( 0, 0, 100, 124 )
						pixelc:registerEventHandler( "transition_complete_keyframe", pixelcFrame3 )
					end
				end
				
				pixelc:completeAnimation()
				self.pixelc:setLeftRight( 0, 0, 63, 87 )
				self.pixelc:setTopBottom( 0, 0, 43, 121 )
				self.pixelc:setAlpha( 1 )
				pixelcFrame2( pixelc, {} )
				local pixeldFrame2 = function ( pixeld, event )
					local pixeldFrame3 = function ( pixeld, event )
						if not event.interrupted then
							pixeld:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Back )
						end
						pixeld:setLeftRight( 0, 0, 141, 201 )
						pixeld:setTopBottom( 0, 0, 43, 121 )
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
						pixeld:setLeftRight( 0, 0, 251, 311 )
						pixeld:registerEventHandler( "transition_complete_keyframe", pixeldFrame3 )
					end
				end
				
				pixeld:completeAnimation()
				self.pixeld:setLeftRight( 0, 0, 141, 201 )
				self.pixeld:setTopBottom( 0, 0, 43, 121 )
				self.pixeld:setAlpha( 1 )
				pixeldFrame2( pixeld, {} )
				local ElemBackA0Frame2 = function ( ElemBackA0, event )
					local ElemBackA0Frame3 = function ( ElemBackA0, event )
						local ElemBackA0Frame4 = function ( ElemBackA0, event )
							if not event.interrupted then
								ElemBackA0:beginAnimation( "keyframe", 110, true, true, CoD.TweenType.Linear )
							end
							ElemBackA0:setLeftRight( 0, 0, 165, 219 )
							ElemBackA0:setTopBottom( 0, 0, -6, 174 )
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
						ElemBackA0:setLeftRight( 0, 0, 817, 871 )
						ElemBackA0:setTopBottom( 0, 0, -8, 172 )
						ElemBackA0:registerEventHandler( "transition_complete_keyframe", ElemBackA0Frame3 )
					end
				end
				
				ElemBackA0:completeAnimation()
				self.ElemBackA0:setLeftRight( 0, 0, 165, 219 )
				self.ElemBackA0:setTopBottom( 0, 0, -6, 174 )
				self.ElemBackA0:setAlpha( 1 )
				ElemBackA0Frame2( ElemBackA0, {} )
				local ElemForeB0Frame2 = function ( ElemForeB0, event )
					local ElemForeB0Frame3 = function ( ElemForeB0, event )
						local ElemForeB0Frame4 = function ( ElemForeB0, event )
							if not event.interrupted then
								ElemForeB0:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
							end
							ElemForeB0:setLeftRight( 0, 0, 159, 171 )
							ElemForeB0:setTopBottom( 0, 0, 34, 130 )
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
						ElemForeB0:setLeftRight( 0, 0, 794, 806 )
						ElemForeB0:registerEventHandler( "transition_complete_keyframe", ElemForeB0Frame3 )
					end
				end
				
				ElemForeB0:completeAnimation()
				self.ElemForeB0:setLeftRight( 0, 0, 159, 171 )
				self.ElemForeB0:setTopBottom( 0, 0, 34, 130 )
				self.ElemForeB0:setAlpha( 1 )
				ElemForeB0Frame2( ElemForeB0, {} )
				local ElemMid0Frame2 = function ( ElemMid0, event )
					local ElemMid0Frame3 = function ( ElemMid0, event )
						local ElemMid0Frame4 = function ( ElemMid0, event )
							if not event.interrupted then
								ElemMid0:beginAnimation( "keyframe", 199, true, true, CoD.TweenType.Linear )
							end
							ElemMid0:setLeftRight( 0, 0, 36, 216 )
							ElemMid0:setTopBottom( 0, 0, 34, 130 )
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
						ElemMid0:setLeftRight( 0, 0, 710, 890 )
						ElemMid0:registerEventHandler( "transition_complete_keyframe", ElemMid0Frame3 )
					end
				end
				
				ElemMid0:completeAnimation()
				self.ElemMid0:setLeftRight( 0, 0, 36, 216 )
				self.ElemMid0:setTopBottom( 0, 0, 34, 130 )
				self.ElemMid0:setAlpha( 1 )
				ElemMid0Frame2( ElemMid0, {} )
				local ElemForeA0Frame2 = function ( ElemForeA0, event )
					local ElemForeA0Frame3 = function ( ElemForeA0, event )
						local ElemForeA0Frame4 = function ( ElemForeA0, event )
							if not event.interrupted then
								ElemForeA0:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
							end
							ElemForeA0:setLeftRight( 0, 0, 165, 207 )
							ElemForeA0:setTopBottom( 0, 0, 34, 130 )
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
						ElemForeA0:setLeftRight( 0, 0, 815, 857 )
						ElemForeA0:registerEventHandler( "transition_complete_keyframe", ElemForeA0Frame3 )
					end
				end
				
				ElemForeA0:completeAnimation()
				self.ElemForeA0:setLeftRight( 0, 0, 165, 207 )
				self.ElemForeA0:setTopBottom( 0, 0, 34, 130 )
				self.ElemForeA0:setAlpha( 1 )
				ElemForeA0Frame2( ElemForeA0, {} )
				local ElemForeC0Frame2 = function ( ElemForeC0, event )
					local ElemForeC0Frame3 = function ( ElemForeC0, event )
						local ElemForeC0Frame4 = function ( ElemForeC0, event )
							if not event.interrupted then
								ElemForeC0:beginAnimation( "keyframe", 199, true, true, CoD.TweenType.Linear )
							end
							ElemForeC0:setLeftRight( 0, 0, 153, 177 )
							ElemForeC0:setTopBottom( 0, 0, 33, 131 )
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
						ElemForeC0:setLeftRight( 0, 0, 856, 880 )
						ElemForeC0:registerEventHandler( "transition_complete_keyframe", ElemForeC0Frame3 )
					end
				end
				
				ElemForeC0:completeAnimation()
				self.ElemForeC0:setLeftRight( 0, 0, 153, 177 )
				self.ElemForeC0:setTopBottom( 0, 0, 33, 131 )
				self.ElemForeC0:setAlpha( 1 )
				ElemForeC0Frame2( ElemForeC0, {} )
				local ElemForeD0Frame2 = function ( ElemForeD0, event )
					local ElemForeD0Frame3 = function ( ElemForeD0, event )
						local ElemForeD0Frame4 = function ( ElemForeD0, event )
							if not event.interrupted then
								ElemForeD0:beginAnimation( "keyframe", 349, true, true, CoD.TweenType.Linear )
							end
							ElemForeD0:setLeftRight( 0, 0, 114, 156 )
							ElemForeD0:setTopBottom( 0, 0, 34, 130 )
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
						ElemForeD0:setLeftRight( 0, 0, 823, 865 )
						ElemForeD0:registerEventHandler( "transition_complete_keyframe", ElemForeD0Frame3 )
					end
				end
				
				ElemForeD0:completeAnimation()
				self.ElemForeD0:setLeftRight( 0, 0, 114, 156 )
				self.ElemForeD0:setTopBottom( 0, 0, 34, 130 )
				self.ElemForeD0:setAlpha( 1 )
				ElemForeD0Frame2( ElemForeD0, {} )
				local ElemBaseA0Frame2 = function ( ElemBaseA0, event )
					local ElemBaseA0Frame3 = function ( ElemBaseA0, event )
						local ElemBaseA0Frame4 = function ( ElemBaseA0, event )
							if not event.interrupted then
								ElemBaseA0:beginAnimation( "keyframe", 269, true, true, CoD.TweenType.Linear )
							end
							ElemBaseA0:setLeftRight( 0, 0, 99, 183 )
							ElemBaseA0:setTopBottom( 0, 0, 130, 154 )
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
						ElemBaseA0:setLeftRight( 0, 0, 794, 878 )
						ElemBaseA0:registerEventHandler( "transition_complete_keyframe", ElemBaseA0Frame3 )
					end
				end
				
				ElemBaseA0:completeAnimation()
				self.ElemBaseA0:setLeftRight( 0, 0, 99, 183 )
				self.ElemBaseA0:setTopBottom( 0, 0, 130, 154 )
				self.ElemBaseA0:setAlpha( 1 )
				ElemBaseA0Frame2( ElemBaseA0, {} )
				local ElemTopC0Frame2 = function ( ElemTopC0, event )
					local ElemTopC0Frame3 = function ( ElemTopC0, event )
						local ElemTopC0Frame4 = function ( ElemTopC0, event )
							if not event.interrupted then
								ElemTopC0:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
							end
							ElemTopC0:setLeftRight( 0, 0, 183, 219 )
							ElemTopC0:setTopBottom( 0, 0, 23, 29 )
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
						ElemTopC0:setLeftRight( 0, 0, 782, 818 )
						ElemTopC0:registerEventHandler( "transition_complete_keyframe", ElemTopC0Frame3 )
					end
				end
				
				ElemTopC0:completeAnimation()
				self.ElemTopC0:setLeftRight( 0, 0, 183, 219 )
				self.ElemTopC0:setTopBottom( 0, 0, 23, 29 )
				self.ElemTopC0:setAlpha( 1 )
				ElemTopC0Frame2( ElemTopC0, {} )
				local ElemTopB0Frame2 = function ( ElemTopB0, event )
					local ElemTopB0Frame3 = function ( ElemTopB0, event )
						local ElemTopB0Frame4 = function ( ElemTopB0, event )
							if not event.interrupted then
								ElemTopB0:beginAnimation( "keyframe", 249, true, true, CoD.TweenType.Linear )
							end
							ElemTopB0:setLeftRight( 0, 0, 174, 258 )
							ElemTopB0:setTopBottom( 0, 0, 23, 29 )
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
						ElemTopB0:setLeftRight( 0, 0, 772, 856 )
						ElemTopB0:registerEventHandler( "transition_complete_keyframe", ElemTopB0Frame3 )
					end
				end
				
				ElemTopB0:completeAnimation()
				self.ElemTopB0:setLeftRight( 0, 0, 174, 258 )
				self.ElemTopB0:setTopBottom( 0, 0, 23, 29 )
				self.ElemTopB0:setAlpha( 1 )
				ElemTopB0Frame2( ElemTopB0, {} )
				local ElemTopA0Frame2 = function ( ElemTopA0, event )
					local ElemTopA0Frame3 = function ( ElemTopA0, event )
						local ElemTopA0Frame4 = function ( ElemTopA0, event )
							if not event.interrupted then
								ElemTopA0:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
							end
							ElemTopA0:setLeftRight( 0, 0, 90, 174 )
							ElemTopA0:setTopBottom( 0, 0, 23, 29 )
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
						ElemTopA0:setLeftRight( 0, 0, 790, 874 )
						ElemTopA0:registerEventHandler( "transition_complete_keyframe", ElemTopA0Frame3 )
					end
				end
				
				ElemTopA0:completeAnimation()
				self.ElemTopA0:setLeftRight( 0, 0, 90, 174 )
				self.ElemTopA0:setTopBottom( 0, 0, 23, 29 )
				self.ElemTopA0:setAlpha( 1 )
				ElemTopA0Frame2( ElemTopA0, {} )
			end,
			Update = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				local pixelaFrame2 = function ( pixela, event )
					local pixelaFrame3 = function ( pixela, event )
						if not event.interrupted then
							pixela:beginAnimation( "keyframe", 319, true, true, CoD.TweenType.Linear )
						end
						pixela:setLeftRight( 0, 0, 48, 66 )
						pixela:setTopBottom( 0, 0, 43, 121 )
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
						pixela:setLeftRight( 0, 0, 117, 135 )
						pixela:registerEventHandler( "transition_complete_keyframe", pixelaFrame3 )
					end
				end
				
				pixela:completeAnimation()
				self.pixela:setLeftRight( 0, 0, 48, 66 )
				self.pixela:setTopBottom( 0, 0, 43, 121 )
				self.pixela:setAlpha( 1 )
				pixelaFrame2( pixela, {} )
				local pixelbFrame2 = function ( pixelb, event )
					local pixelbFrame3 = function ( pixelb, event )
						if not event.interrupted then
							pixelb:beginAnimation( "keyframe", 259, true, true, CoD.TweenType.Linear )
						end
						pixelb:setLeftRight( 0, 0, 102, 150 )
						pixelb:setTopBottom( 0, 0, 43, 121 )
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
						pixelb:setLeftRight( 0, 0, 236, 284 )
						pixelb:registerEventHandler( "transition_complete_keyframe", pixelbFrame3 )
					end
				end
				
				pixelb:completeAnimation()
				self.pixelb:setLeftRight( 0, 0, 102, 150 )
				self.pixelb:setTopBottom( 0, 0, 43, 121 )
				self.pixelb:setAlpha( 1 )
				pixelbFrame2( pixelb, {} )
				local pixelcFrame2 = function ( pixelc, event )
					local pixelcFrame3 = function ( pixelc, event )
						if not event.interrupted then
							pixelc:beginAnimation( "keyframe", 420, true, true, CoD.TweenType.Back )
						end
						pixelc:setLeftRight( 0, 0, 63, 87 )
						pixelc:setTopBottom( 0, 0, 43, 121 )
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
						pixelc:setLeftRight( 0, 0, 100, 124 )
						pixelc:registerEventHandler( "transition_complete_keyframe", pixelcFrame3 )
					end
				end
				
				pixelc:completeAnimation()
				self.pixelc:setLeftRight( 0, 0, 63, 87 )
				self.pixelc:setTopBottom( 0, 0, 43, 121 )
				self.pixelc:setAlpha( 1 )
				pixelcFrame2( pixelc, {} )
				local pixeldFrame2 = function ( pixeld, event )
					local pixeldFrame3 = function ( pixeld, event )
						if not event.interrupted then
							pixeld:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Back )
						end
						pixeld:setLeftRight( 0, 0, 141, 201 )
						pixeld:setTopBottom( 0, 0, 43, 121 )
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
						pixeld:setLeftRight( 0, 0, 251, 311 )
						pixeld:registerEventHandler( "transition_complete_keyframe", pixeldFrame3 )
					end
				end
				
				pixeld:completeAnimation()
				self.pixeld:setLeftRight( 0, 0, 141, 201 )
				self.pixeld:setTopBottom( 0, 0, 43, 121 )
				self.pixeld:setAlpha( 1 )
				pixeldFrame2( pixeld, {} )
				local ElemBackA0Frame2 = function ( ElemBackA0, event )
					local ElemBackA0Frame3 = function ( ElemBackA0, event )
						local ElemBackA0Frame4 = function ( ElemBackA0, event )
							if not event.interrupted then
								ElemBackA0:beginAnimation( "keyframe", 110, true, true, CoD.TweenType.Linear )
							end
							ElemBackA0:setLeftRight( 0, 0, 165, 219 )
							ElemBackA0:setTopBottom( 0, 0, -6, 174 )
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
						ElemBackA0:setLeftRight( 0, 0, 817, 871 )
						ElemBackA0:setTopBottom( 0, 0, -8, 172 )
						ElemBackA0:registerEventHandler( "transition_complete_keyframe", ElemBackA0Frame3 )
					end
				end
				
				ElemBackA0:completeAnimation()
				self.ElemBackA0:setLeftRight( 0, 0, 165, 219 )
				self.ElemBackA0:setTopBottom( 0, 0, -6, 174 )
				self.ElemBackA0:setAlpha( 1 )
				ElemBackA0Frame2( ElemBackA0, {} )
				local ElemForeB0Frame2 = function ( ElemForeB0, event )
					local ElemForeB0Frame3 = function ( ElemForeB0, event )
						local ElemForeB0Frame4 = function ( ElemForeB0, event )
							if not event.interrupted then
								ElemForeB0:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
							end
							ElemForeB0:setLeftRight( 0, 0, 159, 171 )
							ElemForeB0:setTopBottom( 0, 0, 34, 130 )
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
						ElemForeB0:setLeftRight( 0, 0, 794, 806 )
						ElemForeB0:registerEventHandler( "transition_complete_keyframe", ElemForeB0Frame3 )
					end
				end
				
				ElemForeB0:completeAnimation()
				self.ElemForeB0:setLeftRight( 0, 0, 159, 171 )
				self.ElemForeB0:setTopBottom( 0, 0, 34, 130 )
				self.ElemForeB0:setAlpha( 1 )
				ElemForeB0Frame2( ElemForeB0, {} )
				local ElemMid0Frame2 = function ( ElemMid0, event )
					local ElemMid0Frame3 = function ( ElemMid0, event )
						local ElemMid0Frame4 = function ( ElemMid0, event )
							if not event.interrupted then
								ElemMid0:beginAnimation( "keyframe", 199, true, true, CoD.TweenType.Linear )
							end
							ElemMid0:setLeftRight( 0, 0, 36, 216 )
							ElemMid0:setTopBottom( 0, 0, 34, 130 )
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
						ElemMid0:setLeftRight( 0, 0, 710, 890 )
						ElemMid0:registerEventHandler( "transition_complete_keyframe", ElemMid0Frame3 )
					end
				end
				
				ElemMid0:completeAnimation()
				self.ElemMid0:setLeftRight( 0, 0, 36, 216 )
				self.ElemMid0:setTopBottom( 0, 0, 34, 130 )
				self.ElemMid0:setAlpha( 1 )
				ElemMid0Frame2( ElemMid0, {} )
				local ElemForeA0Frame2 = function ( ElemForeA0, event )
					local ElemForeA0Frame3 = function ( ElemForeA0, event )
						local ElemForeA0Frame4 = function ( ElemForeA0, event )
							if not event.interrupted then
								ElemForeA0:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
							end
							ElemForeA0:setLeftRight( 0, 0, 165, 207 )
							ElemForeA0:setTopBottom( 0, 0, 34, 130 )
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
						ElemForeA0:setLeftRight( 0, 0, 815, 857 )
						ElemForeA0:registerEventHandler( "transition_complete_keyframe", ElemForeA0Frame3 )
					end
				end
				
				ElemForeA0:completeAnimation()
				self.ElemForeA0:setLeftRight( 0, 0, 165, 207 )
				self.ElemForeA0:setTopBottom( 0, 0, 34, 130 )
				self.ElemForeA0:setAlpha( 1 )
				ElemForeA0Frame2( ElemForeA0, {} )
				local ElemForeC0Frame2 = function ( ElemForeC0, event )
					local ElemForeC0Frame3 = function ( ElemForeC0, event )
						local ElemForeC0Frame4 = function ( ElemForeC0, event )
							if not event.interrupted then
								ElemForeC0:beginAnimation( "keyframe", 199, true, true, CoD.TweenType.Linear )
							end
							ElemForeC0:setLeftRight( 0, 0, 153, 177 )
							ElemForeC0:setTopBottom( 0, 0, 33, 131 )
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
						ElemForeC0:setLeftRight( 0, 0, 856, 880 )
						ElemForeC0:registerEventHandler( "transition_complete_keyframe", ElemForeC0Frame3 )
					end
				end
				
				ElemForeC0:completeAnimation()
				self.ElemForeC0:setLeftRight( 0, 0, 153, 177 )
				self.ElemForeC0:setTopBottom( 0, 0, 33, 131 )
				self.ElemForeC0:setAlpha( 1 )
				ElemForeC0Frame2( ElemForeC0, {} )
				local ElemForeD0Frame2 = function ( ElemForeD0, event )
					local ElemForeD0Frame3 = function ( ElemForeD0, event )
						local ElemForeD0Frame4 = function ( ElemForeD0, event )
							if not event.interrupted then
								ElemForeD0:beginAnimation( "keyframe", 349, true, true, CoD.TweenType.Linear )
							end
							ElemForeD0:setLeftRight( 0, 0, 114, 156 )
							ElemForeD0:setTopBottom( 0, 0, 34, 130 )
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
						ElemForeD0:setLeftRight( 0, 0, 823, 865 )
						ElemForeD0:registerEventHandler( "transition_complete_keyframe", ElemForeD0Frame3 )
					end
				end
				
				ElemForeD0:completeAnimation()
				self.ElemForeD0:setLeftRight( 0, 0, 114, 156 )
				self.ElemForeD0:setTopBottom( 0, 0, 34, 130 )
				self.ElemForeD0:setAlpha( 1 )
				ElemForeD0Frame2( ElemForeD0, {} )
				local ElemBaseA0Frame2 = function ( ElemBaseA0, event )
					local ElemBaseA0Frame3 = function ( ElemBaseA0, event )
						local ElemBaseA0Frame4 = function ( ElemBaseA0, event )
							if not event.interrupted then
								ElemBaseA0:beginAnimation( "keyframe", 269, true, true, CoD.TweenType.Linear )
							end
							ElemBaseA0:setLeftRight( 0, 0, 99, 183 )
							ElemBaseA0:setTopBottom( 0, 0, 130, 154 )
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
						ElemBaseA0:setLeftRight( 0, 0, 794, 878 )
						ElemBaseA0:registerEventHandler( "transition_complete_keyframe", ElemBaseA0Frame3 )
					end
				end
				
				ElemBaseA0:completeAnimation()
				self.ElemBaseA0:setLeftRight( 0, 0, 99, 183 )
				self.ElemBaseA0:setTopBottom( 0, 0, 130, 154 )
				self.ElemBaseA0:setAlpha( 1 )
				ElemBaseA0Frame2( ElemBaseA0, {} )
				local ElemTopC0Frame2 = function ( ElemTopC0, event )
					local ElemTopC0Frame3 = function ( ElemTopC0, event )
						local ElemTopC0Frame4 = function ( ElemTopC0, event )
							if not event.interrupted then
								ElemTopC0:beginAnimation( "keyframe", 200, true, true, CoD.TweenType.Linear )
							end
							ElemTopC0:setLeftRight( 0, 0, 183, 219 )
							ElemTopC0:setTopBottom( 0, 0, 23, 29 )
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
						ElemTopC0:setLeftRight( 0, 0, 782, 818 )
						ElemTopC0:registerEventHandler( "transition_complete_keyframe", ElemTopC0Frame3 )
					end
				end
				
				ElemTopC0:completeAnimation()
				self.ElemTopC0:setLeftRight( 0, 0, 183, 219 )
				self.ElemTopC0:setTopBottom( 0, 0, 23, 29 )
				self.ElemTopC0:setAlpha( 1 )
				ElemTopC0Frame2( ElemTopC0, {} )
				local ElemTopB0Frame2 = function ( ElemTopB0, event )
					local ElemTopB0Frame3 = function ( ElemTopB0, event )
						local ElemTopB0Frame4 = function ( ElemTopB0, event )
							if not event.interrupted then
								ElemTopB0:beginAnimation( "keyframe", 249, true, true, CoD.TweenType.Linear )
							end
							ElemTopB0:setLeftRight( 0, 0, 174, 258 )
							ElemTopB0:setTopBottom( 0, 0, 23, 29 )
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
						ElemTopB0:setLeftRight( 0, 0, 772, 856 )
						ElemTopB0:registerEventHandler( "transition_complete_keyframe", ElemTopB0Frame3 )
					end
				end
				
				ElemTopB0:completeAnimation()
				self.ElemTopB0:setLeftRight( 0, 0, 174, 258 )
				self.ElemTopB0:setTopBottom( 0, 0, 23, 29 )
				self.ElemTopB0:setAlpha( 1 )
				ElemTopB0Frame2( ElemTopB0, {} )
				local ElemTopA0Frame2 = function ( ElemTopA0, event )
					local ElemTopA0Frame3 = function ( ElemTopA0, event )
						local ElemTopA0Frame4 = function ( ElemTopA0, event )
							if not event.interrupted then
								ElemTopA0:beginAnimation( "keyframe", 270, true, true, CoD.TweenType.Linear )
							end
							ElemTopA0:setLeftRight( 0, 0, 90, 174 )
							ElemTopA0:setTopBottom( 0, 0, 23, 29 )
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
						ElemTopA0:setLeftRight( 0, 0, 790, 874 )
						ElemTopA0:registerEventHandler( "transition_complete_keyframe", ElemTopA0Frame3 )
					end
				end
				
				ElemTopA0:completeAnimation()
				self.ElemTopA0:setLeftRight( 0, 0, 90, 174 )
				self.ElemTopA0:setTopBottom( 0, 0, 23, 29 )
				self.ElemTopA0:setAlpha( 1 )
				ElemTopA0Frame2( ElemTopA0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
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
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

