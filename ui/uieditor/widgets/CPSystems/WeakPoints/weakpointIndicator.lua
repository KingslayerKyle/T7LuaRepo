-- c3054705b4f5eb0b535a130907a26fe0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_Diagonals" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewArrowSmallContainer" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewCornerContainer" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewDashContainer" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewHex" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewRedLineH" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewRedLineV" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewRedLineContainer" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewDashEl" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewThickPlus" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewRedArrow" )
require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewRedArrowPoint" )

CoD.weakpointIndicator = InheritFrom( LUI.UIElement )
CoD.weakpointIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.weakpointIndicator )
	self.id = "weakpointIndicator"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 150 )
	self.anyChildUsesUpdateState = true
	
	local Diagonals = CoD.weakpoint_Diagonals.new( menu, controller )
	Diagonals:setLeftRight( true, true, -29.34, 30.33 )
	Diagonals:setTopBottom( true, true, 0, 0 )
	Diagonals:setAlpha( 0 )
	Diagonals:setZoom( -50 )
	self:addElement( Diagonals )
	self.Diagonals = Diagonals
	
	local weakpointNewArrowSmallContainer0 = CoD.weakpoint_NewArrowSmallContainer.new( menu, controller )
	weakpointNewArrowSmallContainer0:setLeftRight( false, false, -8, 8.01 )
	weakpointNewArrowSmallContainer0:setTopBottom( true, true, -21, 21 )
	weakpointNewArrowSmallContainer0:setAlpha( 0 )
	self:addElement( weakpointNewArrowSmallContainer0 )
	self.weakpointNewArrowSmallContainer0 = weakpointNewArrowSmallContainer0
	
	local weakpointNewCornerContainer0 = CoD.weakpoint_NewCornerContainer.new( menu, controller )
	weakpointNewCornerContainer0:setLeftRight( true, true, -8.83, 10.17 )
	weakpointNewCornerContainer0:setTopBottom( true, true, -4.42, 5.58 )
	weakpointNewCornerContainer0:setAlpha( 0 )
	self:addElement( weakpointNewCornerContainer0 )
	self.weakpointNewCornerContainer0 = weakpointNewCornerContainer0
	
	local weakpointNewDashContainer0 = CoD.weakpoint_NewDashContainer.new( menu, controller )
	weakpointNewDashContainer0:setLeftRight( true, true, -11.83, 12.17 )
	weakpointNewDashContainer0:setTopBottom( true, true, 10.67, -9.33 )
	weakpointNewDashContainer0:setAlpha( 0 )
	self:addElement( weakpointNewDashContainer0 )
	self.weakpointNewDashContainer0 = weakpointNewDashContainer0
	
	local weakpointNewHex0 = CoD.weakpoint_NewHex.new( menu, controller )
	weakpointNewHex0:setLeftRight( false, false, -121.72, 123.72 )
	weakpointNewHex0:setTopBottom( false, false, -111.3, 111.3 )
	weakpointNewHex0:setAlpha( 0 )
	self:addElement( weakpointNewHex0 )
	self.weakpointNewHex0 = weakpointNewHex0
	
	local weakpointNewRedLineH0 = CoD.weakpoint_NewRedLineH.new( menu, controller )
	weakpointNewRedLineH0:setLeftRight( true, true, 52, -52 )
	weakpointNewRedLineH0:setTopBottom( true, false, 0.5, 8.5 )
	weakpointNewRedLineH0:setAlpha( 0 )
	self:addElement( weakpointNewRedLineH0 )
	self.weakpointNewRedLineH0 = weakpointNewRedLineH0
	
	local weakpointNewRedLineV0 = CoD.weakpoint_NewRedLineV.new( menu, controller )
	weakpointNewRedLineV0:setLeftRight( true, false, 0, 8 )
	weakpointNewRedLineV0:setTopBottom( true, true, 21, -19 )
	weakpointNewRedLineV0:setAlpha( 0 )
	self:addElement( weakpointNewRedLineV0 )
	self.weakpointNewRedLineV0 = weakpointNewRedLineV0
	
	local weakpointNewRedLineV1 = CoD.weakpoint_NewRedLineV.new( menu, controller )
	weakpointNewRedLineV1:setLeftRight( false, true, -8, 0 )
	weakpointNewRedLineV1:setTopBottom( true, true, 21, -19 )
	weakpointNewRedLineV1:setAlpha( 0 )
	weakpointNewRedLineV1:setZRot( 180 )
	self:addElement( weakpointNewRedLineV1 )
	self.weakpointNewRedLineV1 = weakpointNewRedLineV1
	
	local weakpointNewRedLineH1 = CoD.weakpoint_NewRedLineH.new( menu, controller )
	weakpointNewRedLineH1:setLeftRight( true, true, 54, -52 )
	weakpointNewRedLineH1:setTopBottom( false, true, -8, 0 )
	weakpointNewRedLineH1:setAlpha( 0 )
	weakpointNewRedLineH1:setZRot( 180 )
	self:addElement( weakpointNewRedLineH1 )
	self.weakpointNewRedLineH1 = weakpointNewRedLineH1
	
	local weakpointNewRedLineContainer0 = CoD.weakpoint_NewRedLineContainer.new( menu, controller )
	weakpointNewRedLineContainer0:setLeftRight( true, true, 19, -17 )
	weakpointNewRedLineContainer0:setTopBottom( false, true, -13, 3 )
	weakpointNewRedLineContainer0:setAlpha( 0 )
	self:addElement( weakpointNewRedLineContainer0 )
	self.weakpointNewRedLineContainer0 = weakpointNewRedLineContainer0
	
	local weakpointNewRedLineContainer1 = CoD.weakpoint_NewRedLineContainer.new( menu, controller )
	weakpointNewRedLineContainer1:setLeftRight( true, true, 17, -17 )
	weakpointNewRedLineContainer1:setTopBottom( true, false, -2.5, 13.5 )
	weakpointNewRedLineContainer1:setAlpha( 0 )
	weakpointNewRedLineContainer1:setZRot( -180 )
	self:addElement( weakpointNewRedLineContainer1 )
	self.weakpointNewRedLineContainer1 = weakpointNewRedLineContainer1
	
	local weakpointNewDashEl0 = CoD.weakpoint_NewDashEl.new( menu, controller )
	weakpointNewDashEl0:setLeftRight( false, true, -12, 24 )
	weakpointNewDashEl0:setTopBottom( false, false, -7, 9 )
	weakpointNewDashEl0:setAlpha( 0 )
	self:addElement( weakpointNewDashEl0 )
	self.weakpointNewDashEl0 = weakpointNewDashEl0
	
	local weakpointNewDashEl1 = CoD.weakpoint_NewDashEl.new( menu, controller )
	weakpointNewDashEl1:setLeftRight( true, false, -23.83, 12.17 )
	weakpointNewDashEl1:setTopBottom( false, false, -7, 9 )
	weakpointNewDashEl1:setAlpha( 0 )
	weakpointNewDashEl1:setZRot( 180 )
	self:addElement( weakpointNewDashEl1 )
	self.weakpointNewDashEl1 = weakpointNewDashEl1
	
	local weakpointNewThickPlus0 = CoD.weakpoint_NewThickPlus.new( menu, controller )
	weakpointNewThickPlus0:setLeftRight( false, false, -11.5, 13.01 )
	weakpointNewThickPlus0:setTopBottom( false, false, -7.33, 9 )
	self:addElement( weakpointNewThickPlus0 )
	self.weakpointNewThickPlus0 = weakpointNewThickPlus0
	
	local weakpointNewRedArrow0 = CoD.weakpoint_NewRedArrow.new( menu, controller )
	weakpointNewRedArrow0:setLeftRight( false, false, -19.5, 20.5 )
	weakpointNewRedArrow0:setTopBottom( false, false, -11.42, 12.58 )
	self:addElement( weakpointNewRedArrow0 )
	self.weakpointNewRedArrow0 = weakpointNewRedArrow0
	
	local weakpointNewRedArrow5 = CoD.weakpoint_NewRedArrow.new( menu, controller )
	weakpointNewRedArrow5:setLeftRight( false, false, -19.5, 20.5 )
	weakpointNewRedArrow5:setTopBottom( false, false, -11, 13 )
	weakpointNewRedArrow5:setZRot( 180 )
	self:addElement( weakpointNewRedArrow5 )
	self.weakpointNewRedArrow5 = weakpointNewRedArrow5
	
	local weakpointNewRedArrowPoint0 = CoD.weakpoint_NewRedArrowPoint.new( menu, controller )
	weakpointNewRedArrowPoint0:setLeftRight( false, false, -20, 20 )
	weakpointNewRedArrowPoint0:setTopBottom( true, false, 4.5, 40.5 )
	weakpointNewRedArrowPoint0:setAlpha( 0 )
	self:addElement( weakpointNewRedArrowPoint0 )
	self.weakpointNewRedArrowPoint0 = weakpointNewRedArrowPoint0
	
	local weakpointNewRedArrowPoint1 = CoD.weakpoint_NewRedArrowPoint.new( menu, controller )
	weakpointNewRedArrowPoint1:setLeftRight( false, false, -19.5, 20.5 )
	weakpointNewRedArrowPoint1:setTopBottom( false, true, -40, -4 )
	weakpointNewRedArrowPoint1:setAlpha( 0 )
	weakpointNewRedArrowPoint1:setZRot( 180 )
	self:addElement( weakpointNewRedArrowPoint1 )
	self.weakpointNewRedArrowPoint1 = weakpointNewRedArrowPoint1
	
	local weakpointNewDashEl00 = CoD.weakpoint_NewDashEl.new( menu, controller )
	weakpointNewDashEl00:setLeftRight( false, false, 11.01, 47.01 )
	weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
	weakpointNewDashEl00:setAlpha( 0.52 )
	self:addElement( weakpointNewDashEl00 )
	self.weakpointNewDashEl00 = weakpointNewDashEl00
	
	local weakpointNewDashEl10 = CoD.weakpoint_NewDashEl.new( menu, controller )
	weakpointNewDashEl10:setLeftRight( false, false, -46.5, -10.5 )
	weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
	weakpointNewDashEl10:setAlpha( 0.55 )
	weakpointNewDashEl10:setZRot( 180 )
	self:addElement( weakpointNewDashEl10 )
	self.weakpointNewDashEl10 = weakpointNewDashEl10
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				self.clipFinished( Diagonals, {} )
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewArrowSmallContainer0, {} )
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewCornerContainer0, {} )
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineH0, {} )
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineV0, {} )
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineV1, {} )
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineH1, {} )
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineContainer0, {} )
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineContainer1, {} )
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl0, {} )
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl1, {} )
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 0 )
				self.clipFinished( weakpointNewThickPlus0, {} )
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrow0, {} )
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrow5, {} )
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint0, {} )
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint1, {} )
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, -8, 28.01 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl00, {} )
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -29.5, 6.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl10, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewCornerContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					local weakpointNewDashContainer0Frame3 = function ( weakpointNewDashContainer0, event )
						if not event.interrupted then
							weakpointNewDashContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashContainer0, event )
						else
							weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashContainer0Frame3( weakpointNewDashContainer0, event )
						return 
					else
						weakpointNewDashContainer0:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashContainer0Frame3 )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					if not event.interrupted then
						weakpointNewHex0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewHex0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewHex0, event )
					else
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					local weakpointNewRedLineH0Frame3 = function ( weakpointNewRedLineH0, event )
						if not event.interrupted then
							weakpointNewRedLineH0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH0, event )
						else
							weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH0Frame3( weakpointNewRedLineH0, event )
						return 
					else
						weakpointNewRedLineH0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH0Frame3 )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					local weakpointNewRedLineV0Frame3 = function ( weakpointNewRedLineV0, event )
						if not event.interrupted then
							weakpointNewRedLineV0:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV0, event )
						else
							weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV0Frame3( weakpointNewRedLineV0, event )
						return 
					else
						weakpointNewRedLineV0:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV0Frame3 )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					local weakpointNewRedLineV1Frame3 = function ( weakpointNewRedLineV1, event )
						if not event.interrupted then
							weakpointNewRedLineV1:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV1, event )
						else
							weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV1Frame3( weakpointNewRedLineV1, event )
						return 
					else
						weakpointNewRedLineV1:beginAnimation( "keyframe", 860, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV1Frame3 )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					local weakpointNewRedLineContainer0Frame3 = function ( weakpointNewRedLineContainer0, event )
						if not event.interrupted then
							weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer0, event )
						else
							weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer0Frame3( weakpointNewRedLineContainer0, event )
						return 
					else
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer0Frame3 )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					local weakpointNewRedLineContainer1Frame3 = function ( weakpointNewRedLineContainer1, event )
						if not event.interrupted then
							weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer1, event )
						else
							weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer1Frame3( weakpointNewRedLineContainer1, event )
						return 
					else
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer1Frame3 )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					local weakpointNewDashEl0Frame3 = function ( weakpointNewDashEl0, event )
						if not event.interrupted then
							weakpointNewDashEl0:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl0, event )
						else
							weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl0Frame3( weakpointNewDashEl0, event )
						return 
					else
						weakpointNewDashEl0:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame3 )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 1159, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 0 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow5:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					local weakpointNewRedArrowPoint0Frame3 = function ( weakpointNewRedArrowPoint0, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						end
						weakpointNewRedArrowPoint0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint0, event )
						else
							weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint0Frame3( weakpointNewRedArrowPoint0, event )
						return 
					else
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint0Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrowPoint1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 81, 117 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, -8, 28.01 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -117, -81 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -29.5, 6.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Medium = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewCornerContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					if not event.interrupted then
						weakpointNewRedLineH0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH0, event )
					else
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					local weakpointNewRedLineV0Frame3 = function ( weakpointNewRedLineV0, event )
						if not event.interrupted then
							weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV0, event )
						else
							weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV0Frame3( weakpointNewRedLineV0, event )
						return 
					else
						weakpointNewRedLineV0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV0Frame3 )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					local weakpointNewRedLineV1Frame3 = function ( weakpointNewRedLineV1, event )
						if not event.interrupted then
							weakpointNewRedLineV1:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV1, event )
						else
							weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV1Frame3( weakpointNewRedLineV1, event )
						return 
					else
						weakpointNewRedLineV1:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV1Frame3 )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					local weakpointNewRedLineContainer0Frame3 = function ( weakpointNewRedLineContainer0, event )
						if not event.interrupted then
							weakpointNewRedLineContainer0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer0, event )
						else
							weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer0Frame3( weakpointNewRedLineContainer0, event )
						return 
					else
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer0Frame3 )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					local weakpointNewRedLineContainer1Frame3 = function ( weakpointNewRedLineContainer1, event )
						if not event.interrupted then
							weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer1, event )
						else
							weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer1Frame3( weakpointNewRedLineContainer1, event )
						return 
					else
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer1Frame3 )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					local weakpointNewDashEl1Frame3 = function ( weakpointNewDashEl1, event )
						if not event.interrupted then
							weakpointNewDashEl1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl1, event )
						else
							weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl1Frame3( weakpointNewDashEl1, event )
						return 
					else
						weakpointNewDashEl1:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame3 )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					local weakpointNewThickPlus0Frame3 = function ( weakpointNewThickPlus0, event )
						if not event.interrupted then
							weakpointNewThickPlus0:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewThickPlus0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewThickPlus0, event )
						else
							weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewThickPlus0Frame3( weakpointNewThickPlus0, event )
						return 
					else
						weakpointNewThickPlus0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame3 )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 0 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					local weakpointNewRedArrow5Frame3 = function ( weakpointNewRedArrow5, event )
						if not event.interrupted then
							weakpointNewRedArrow5:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrow5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrow5, event )
						else
							weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow5Frame3( weakpointNewRedArrow5, event )
						return 
					else
						weakpointNewRedArrow5:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow5Frame3 )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					local weakpointNewRedArrowPoint0Frame3 = function ( weakpointNewRedArrowPoint0, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						end
						weakpointNewRedArrowPoint0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint0, event )
						else
							weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint0Frame3( weakpointNewRedArrowPoint0, event )
						return 
					else
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint0Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					local weakpointNewRedArrowPoint1Frame3 = function ( weakpointNewRedArrowPoint1, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						weakpointNewRedArrowPoint1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint1, event )
						else
							weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint1Frame3( weakpointNewRedArrowPoint1, event )
						return 
					else
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint1Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, -8, 28.01 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					local weakpointNewDashEl10Frame3 = function ( weakpointNewDashEl10, event )
						if not event.interrupted then
							weakpointNewDashEl10:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
						weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl10:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl10, event )
						else
							weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl10Frame3( weakpointNewDashEl10, event )
						return 
					else
						weakpointNewDashEl10:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame3 )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -29.5, 6.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Far = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewCornerContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					if not event.interrupted then
						weakpointNewRedLineH0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH0, event )
					else
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					local weakpointNewRedLineV0Frame3 = function ( weakpointNewRedLineV0, event )
						if not event.interrupted then
							weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV0, event )
						else
							weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV0Frame3( weakpointNewRedLineV0, event )
						return 
					else
						weakpointNewRedLineV0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV0Frame3 )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					local weakpointNewRedLineV1Frame3 = function ( weakpointNewRedLineV1, event )
						if not event.interrupted then
							weakpointNewRedLineV1:beginAnimation( "keyframe", 480, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV1, event )
						else
							weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV1Frame3( weakpointNewRedLineV1, event )
						return 
					else
						weakpointNewRedLineV1:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV1Frame3 )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					local weakpointNewRedLineContainer0Frame3 = function ( weakpointNewRedLineContainer0, event )
						if not event.interrupted then
							weakpointNewRedLineContainer0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer0, event )
						else
							weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer0Frame3( weakpointNewRedLineContainer0, event )
						return 
					else
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer0Frame3 )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					local weakpointNewRedLineContainer1Frame3 = function ( weakpointNewRedLineContainer1, event )
						if not event.interrupted then
							weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer1, event )
						else
							weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer1Frame3( weakpointNewRedLineContainer1, event )
						return 
					else
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer1Frame3 )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					local weakpointNewDashEl1Frame3 = function ( weakpointNewDashEl1, event )
						if not event.interrupted then
							weakpointNewDashEl1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl1, event )
						else
							weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl1Frame3( weakpointNewDashEl1, event )
						return 
					else
						weakpointNewDashEl1:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame3 )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					local weakpointNewThickPlus0Frame3 = function ( weakpointNewThickPlus0, event )
						if not event.interrupted then
							weakpointNewThickPlus0:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewThickPlus0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewThickPlus0, event )
						else
							weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewThickPlus0Frame3( weakpointNewThickPlus0, event )
						return 
					else
						weakpointNewThickPlus0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame3 )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 0 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					local weakpointNewRedArrow5Frame3 = function ( weakpointNewRedArrow5, event )
						if not event.interrupted then
							weakpointNewRedArrow5:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrow5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrow5, event )
						else
							weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow5Frame3( weakpointNewRedArrow5, event )
						return 
					else
						weakpointNewRedArrow5:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow5Frame3 )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					local weakpointNewRedArrowPoint0Frame3 = function ( weakpointNewRedArrowPoint0, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 800, false, false, CoD.TweenType.Linear )
						end
						weakpointNewRedArrowPoint0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint0, event )
						else
							weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint0Frame3( weakpointNewRedArrowPoint0, event )
						return 
					else
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint0Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					local weakpointNewRedArrowPoint1Frame3 = function ( weakpointNewRedArrowPoint1, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						weakpointNewRedArrowPoint1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint1, event )
						else
							weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint1Frame3( weakpointNewRedArrowPoint1, event )
						return 
					else
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint1Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, -8, 28.01 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					local weakpointNewDashEl10Frame3 = function ( weakpointNewDashEl10, event )
						if not event.interrupted then
							weakpointNewDashEl10:beginAnimation( "keyframe", 999, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
						weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl10:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl10, event )
						else
							weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl10Frame3( weakpointNewDashEl10, event )
						return 
					else
						weakpointNewDashEl10:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame3 )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -29.5, 6.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Obscured = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewCornerContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					if not event.interrupted then
						weakpointNewHex0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewHex0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewHex0, event )
					else
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					if not event.interrupted then
						weakpointNewRedLineH0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineH0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH0, event )
					else
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineV0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineV1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineH1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					if not event.interrupted then
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer0, event )
					else
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewDashEl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewDashEl1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewThickPlus0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 0 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrow0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					local weakpointNewRedArrow5Frame3 = function ( weakpointNewRedArrow5, event )
						if not event.interrupted then
							weakpointNewRedArrow5:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						end
						weakpointNewRedArrow5:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrow5, event )
						else
							weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow5Frame3( weakpointNewRedArrow5, event )
						return 
					else
						weakpointNewRedArrow5:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow5Frame3 )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrowPoint0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint0, event )
					else
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					local weakpointNewDashEl00Frame3 = function ( weakpointNewDashEl00, event )
						if not event.interrupted then
							weakpointNewDashEl00:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl00:setLeftRight( false, false, 11.01, 47.01 )
						weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl00:setAlpha( 0.52 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl00, event )
						else
							weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl00Frame3( weakpointNewDashEl00, event )
						return 
					else
						weakpointNewDashEl00:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame3 )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, -8, 28.01 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -46.5, -10.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 0.55 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -29.5, 6.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end
		},
		Close = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.clipFinished( Diagonals, {} )
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 1 )
				self.clipFinished( weakpointNewArrowSmallContainer0, {} )
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 1 )
				self.clipFinished( weakpointNewCornerContainer0, {} )
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 1 )
				self.clipFinished( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 1 )
				self.clipFinished( weakpointNewRedLineH0, {} )
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 1 )
				self.clipFinished( weakpointNewRedLineV0, {} )
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 1 )
				self.clipFinished( weakpointNewRedLineV1, {} )
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 1 )
				self.clipFinished( weakpointNewRedLineH1, {} )
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 1 )
				self.clipFinished( weakpointNewRedLineContainer0, {} )
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 1 )
				self.clipFinished( weakpointNewRedLineContainer1, {} )
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 1 )
				self.clipFinished( weakpointNewDashEl0, {} )
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 1 )
				self.clipFinished( weakpointNewDashEl1, {} )
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				self.clipFinished( weakpointNewThickPlus0, {} )
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrow0, {} )
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrow5, {} )
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 1 )
				self.clipFinished( weakpointNewRedArrowPoint0, {} )
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 1 )
				self.clipFinished( weakpointNewRedArrowPoint1, {} )
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 81, 117 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl00, {} )
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -117, -81 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl10, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 899, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1389, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 1 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewCornerContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					local weakpointNewDashContainer0Frame3 = function ( weakpointNewDashContainer0, event )
						if not event.interrupted then
							weakpointNewDashContainer0:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashContainer0, event )
						else
							weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashContainer0Frame3( weakpointNewDashContainer0, event )
						return 
					else
						weakpointNewDashContainer0:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashContainer0Frame3 )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 1 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					if not event.interrupted then
						weakpointNewHex0:beginAnimation( "keyframe", 1129, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewHex0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewHex0, event )
					else
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					local weakpointNewRedLineH0Frame3 = function ( weakpointNewRedLineH0, event )
						if not event.interrupted then
							weakpointNewRedLineH0:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH0, event )
						else
							weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH0Frame3( weakpointNewRedLineH0, event )
						return 
					else
						weakpointNewRedLineH0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH0Frame3 )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 1 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 980, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 1 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 1 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					local weakpointNewRedLineH1Frame3 = function ( weakpointNewRedLineH1, event )
						if not event.interrupted then
							weakpointNewRedLineH1:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH1, event )
						else
							weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH1Frame3( weakpointNewRedLineH1, event )
						return 
					else
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH1Frame3 )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 1 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					if not event.interrupted then
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1409, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer0, event )
					else
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 1 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 1 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					local weakpointNewDashEl0Frame3 = function ( weakpointNewDashEl0, event )
						if not event.interrupted then
							weakpointNewDashEl0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl0, event )
						else
							weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl0Frame3( weakpointNewDashEl0, event )
						return 
					else
						weakpointNewDashEl0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame3 )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 1 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					local weakpointNewDashEl1Frame3 = function ( weakpointNewDashEl1, event )
						if not event.interrupted then
							weakpointNewDashEl1:beginAnimation( "keyframe", 1360, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl1, event )
						else
							weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl1Frame3( weakpointNewDashEl1, event )
						return 
					else
						weakpointNewDashEl1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame3 )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 1 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					local weakpointNewRedArrow0Frame3 = function ( weakpointNewRedArrow0, event )
						if not event.interrupted then
							weakpointNewRedArrow0:beginAnimation( "keyframe", 580, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrow0, event )
						else
							weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow0Frame3( weakpointNewRedArrow0, event )
						return 
					else
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1299, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow0Frame3 )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow5:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint0, event )
					else
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 1 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 1 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					local weakpointNewDashEl00Frame3 = function ( weakpointNewDashEl00, event )
						if not event.interrupted then
							weakpointNewDashEl00:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl00:setLeftRight( false, false, -8, 28.01 )
						weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl00, event )
						else
							weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl00Frame3( weakpointNewDashEl00, event )
						return 
					else
						weakpointNewDashEl00:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame3 )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 81, 117 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -29.5, 6.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -117, -81 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Far = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					local weakpointNewArrowSmallContainer0Frame3 = function ( weakpointNewArrowSmallContainer0, event )
						if not event.interrupted then
							weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewArrowSmallContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewArrowSmallContainer0, event )
						else
							weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewArrowSmallContainer0Frame3( weakpointNewArrowSmallContainer0, event )
						return 
					else
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewArrowSmallContainer0Frame3 )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 1 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					local weakpointNewCornerContainer0Frame3 = function ( weakpointNewCornerContainer0, event )
						if not event.interrupted then
							weakpointNewCornerContainer0:beginAnimation( "keyframe", 879, false, false, CoD.TweenType.Linear )
						end
						weakpointNewCornerContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewCornerContainer0, event )
						else
							weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewCornerContainer0Frame3( weakpointNewCornerContainer0, event )
						return 
					else
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame3 )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 1 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					local weakpointNewRedLineH0Frame3 = function ( weakpointNewRedLineH0, event )
						if not event.interrupted then
							weakpointNewRedLineH0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH0, event )
						else
							weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH0Frame3( weakpointNewRedLineH0, event )
						return 
					else
						weakpointNewRedLineH0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH0Frame3 )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 1 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 1 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					local weakpointNewRedLineV1Frame3 = function ( weakpointNewRedLineV1, event )
						if not event.interrupted then
							weakpointNewRedLineV1:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV1, event )
						else
							weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV1Frame3( weakpointNewRedLineV1, event )
						return 
					else
						weakpointNewRedLineV1:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV1Frame3 )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 1 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 1 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					local weakpointNewRedLineContainer0Frame3 = function ( weakpointNewRedLineContainer0, event )
						if not event.interrupted then
							weakpointNewRedLineContainer0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer0, event )
						else
							weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer0Frame3( weakpointNewRedLineContainer0, event )
						return 
					else
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer0Frame3 )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 1 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					local weakpointNewRedLineContainer1Frame3 = function ( weakpointNewRedLineContainer1, event )
						if not event.interrupted then
							weakpointNewRedLineContainer1:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer1, event )
						else
							weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer1Frame3( weakpointNewRedLineContainer1, event )
						return 
					else
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer1Frame3 )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 1 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 1 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 1 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow5:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					local weakpointNewRedArrowPoint0Frame3 = function ( weakpointNewRedArrowPoint0, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrowPoint0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint0, event )
						else
							weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint0Frame3( weakpointNewRedArrowPoint0, event )
						return 
					else
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint0Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 1 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 1 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					local weakpointNewDashEl00Frame3 = function ( weakpointNewDashEl00, event )
						if not event.interrupted then
							weakpointNewDashEl00:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
						weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl00:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl00, event )
						else
							weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl00Frame3( weakpointNewDashEl00, event )
						return 
					else
						weakpointNewDashEl00:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame3 )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 81, 117 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -117, -81 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Medium = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					local weakpointNewArrowSmallContainer0Frame3 = function ( weakpointNewArrowSmallContainer0, event )
						if not event.interrupted then
							weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewArrowSmallContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewArrowSmallContainer0, event )
						else
							weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewArrowSmallContainer0Frame3( weakpointNewArrowSmallContainer0, event )
						return 
					else
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewArrowSmallContainer0Frame3 )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 1 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewCornerContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 1 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					local weakpointNewRedLineH0Frame3 = function ( weakpointNewRedLineH0, event )
						if not event.interrupted then
							weakpointNewRedLineH0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH0, event )
						else
							weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH0Frame3( weakpointNewRedLineH0, event )
						return 
					else
						weakpointNewRedLineH0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH0Frame3 )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 1 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 1 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					local weakpointNewRedLineV1Frame3 = function ( weakpointNewRedLineV1, event )
						if not event.interrupted then
							weakpointNewRedLineV1:beginAnimation( "keyframe", 650, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV1, event )
						else
							weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV1Frame3( weakpointNewRedLineV1, event )
						return 
					else
						weakpointNewRedLineV1:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV1Frame3 )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 1 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 1 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					local weakpointNewRedLineContainer0Frame3 = function ( weakpointNewRedLineContainer0, event )
						if not event.interrupted then
							weakpointNewRedLineContainer0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer0, event )
						else
							weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer0Frame3( weakpointNewRedLineContainer0, event )
						return 
					else
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer0Frame3 )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 1 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					local weakpointNewRedLineContainer1Frame3 = function ( weakpointNewRedLineContainer1, event )
						if not event.interrupted then
							weakpointNewRedLineContainer1:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer1, event )
						else
							weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer1Frame3( weakpointNewRedLineContainer1, event )
						return 
					else
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer1Frame3 )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 1 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 1 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 1 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow5:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					local weakpointNewRedArrowPoint0Frame3 = function ( weakpointNewRedArrowPoint0, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrowPoint0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint0, event )
						else
							weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint0Frame3( weakpointNewRedArrowPoint0, event )
						return 
					else
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint0Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 1 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 1 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					local weakpointNewDashEl00Frame3 = function ( weakpointNewDashEl00, event )
						if not event.interrupted then
							weakpointNewDashEl00:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
						weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl00:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl00, event )
						else
							weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl00Frame3( weakpointNewDashEl00, event )
						return 
					else
						weakpointNewDashEl00:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame3 )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 81, 117 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -117, -81 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Obscured = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					local weakpointNewArrowSmallContainer0Frame3 = function ( weakpointNewArrowSmallContainer0, event )
						if not event.interrupted then
							weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewArrowSmallContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewArrowSmallContainer0, event )
						else
							weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewArrowSmallContainer0Frame3( weakpointNewArrowSmallContainer0, event )
						return 
					else
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewArrowSmallContainer0Frame3 )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 1 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewCornerContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 1 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					if not event.interrupted then
						weakpointNewHex0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewHex0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewHex0, event )
					else
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					local weakpointNewRedLineH0Frame3 = function ( weakpointNewRedLineH0, event )
						if not event.interrupted then
							weakpointNewRedLineH0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH0, event )
						else
							weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH0Frame3( weakpointNewRedLineH0, event )
						return 
					else
						weakpointNewRedLineH0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH0Frame3 )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 1 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 1 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 1 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					local weakpointNewRedLineH1Frame3 = function ( weakpointNewRedLineH1, event )
						if not event.interrupted then
							weakpointNewRedLineH1:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH1, event )
						else
							weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH1Frame3( weakpointNewRedLineH1, event )
						return 
					else
						weakpointNewRedLineH1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH1Frame3 )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 1 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					if not event.interrupted then
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer0, event )
					else
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 1 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1539, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 1 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					local weakpointNewDashEl0Frame3 = function ( weakpointNewDashEl0, event )
						if not event.interrupted then
							weakpointNewDashEl0:beginAnimation( "keyframe", 440, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl0, event )
						else
							weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl0Frame3( weakpointNewDashEl0, event )
						return 
					else
						weakpointNewDashEl0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame3 )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 1 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 1419, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 1 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrow0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 1309, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrow5:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint0, event )
					else
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 1 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 1 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 11.01, 47.01 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 0.52 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 81, 117 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					local weakpointNewDashEl10Frame3 = function ( weakpointNewDashEl10, event )
						if not event.interrupted then
							weakpointNewDashEl10:beginAnimation( "keyframe", 410, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl10:setLeftRight( false, false, -46.5, -10.5 )
						weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl10:setAlpha( 0.55 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl10, event )
						else
							weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl10Frame3( weakpointNewDashEl10, event )
						return 
					else
						weakpointNewDashEl10:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame3 )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -117, -81 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Damaged = function ()
				self:setupElementClipCounter( 10 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					local DiagonalsFrame3 = function ( Diagonals, event )
						local DiagonalsFrame4 = function ( Diagonals, event )
							if not event.interrupted then
								Diagonals:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
							end
							Diagonals:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Diagonals, event )
							else
								Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							DiagonalsFrame4( Diagonals, event )
							return 
						else
							Diagonals:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Bounce )
							Diagonals:registerEventHandler( "transition_complete_keyframe", DiagonalsFrame4 )
						end
					end
					
					if event.interrupted then
						DiagonalsFrame3( Diagonals, event )
						return 
					else
						Diagonals:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						Diagonals:setAlpha( 1 )
						Diagonals:registerEventHandler( "transition_complete_keyframe", DiagonalsFrame3 )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					local weakpointNewArrowSmallContainer0Frame3 = function ( weakpointNewArrowSmallContainer0, event )
						local weakpointNewArrowSmallContainer0Frame4 = function ( weakpointNewArrowSmallContainer0, event )
							if not event.interrupted then
								weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewArrowSmallContainer0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewArrowSmallContainer0, event )
							else
								weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewArrowSmallContainer0Frame4( weakpointNewArrowSmallContainer0, event )
							return 
						else
							weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 989, false, false, CoD.TweenType.Bounce )
							weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewArrowSmallContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewArrowSmallContainer0Frame3( weakpointNewArrowSmallContainer0, event )
						return 
					else
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						weakpointNewArrowSmallContainer0:setRGB( 1, 0, 0 )
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewArrowSmallContainer0Frame3 )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setRGB( 1, 1, 1 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					local weakpointNewCornerContainer0Frame3 = function ( weakpointNewCornerContainer0, event )
						local weakpointNewCornerContainer0Frame4 = function ( weakpointNewCornerContainer0, event )
							if not event.interrupted then
								weakpointNewCornerContainer0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewCornerContainer0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewCornerContainer0, event )
							else
								weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewCornerContainer0Frame4( weakpointNewCornerContainer0, event )
							return 
						else
							weakpointNewCornerContainer0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
							weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewCornerContainer0Frame3( weakpointNewCornerContainer0, event )
						return 
					else
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						weakpointNewCornerContainer0:setRGB( 1, 0, 0 )
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame3 )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setRGB( 1, 1, 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					local weakpointNewDashContainer0Frame3 = function ( weakpointNewDashContainer0, event )
						local weakpointNewDashContainer0Frame4 = function ( weakpointNewDashContainer0, event )
							if not event.interrupted then
								weakpointNewDashContainer0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashContainer0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashContainer0, event )
							else
								weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashContainer0Frame4( weakpointNewDashContainer0, event )
							return 
						else
							weakpointNewDashContainer0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
							weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashContainer0Frame3( weakpointNewDashContainer0, event )
						return 
					else
						weakpointNewDashContainer0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
						weakpointNewDashContainer0:setRGB( 1, 0, 0 )
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashContainer0Frame3 )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setRGB( 1, 1, 1 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					local weakpointNewHex0Frame3 = function ( weakpointNewHex0, event )
						local weakpointNewHex0Frame4 = function ( weakpointNewHex0, event )
							if not event.interrupted then
								weakpointNewHex0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewHex0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewHex0, event )
							else
								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewHex0Frame4( weakpointNewHex0, event )
							return 
						else
							weakpointNewHex0:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewHex0Frame3( weakpointNewHex0, event )
						return 
					else
						weakpointNewHex0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
						weakpointNewHex0:setRGB( 1, 0, 0 )
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame3 )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setRGB( 1, 1, 1 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					local weakpointNewDashEl0Frame3 = function ( weakpointNewDashEl0, event )
						local weakpointNewDashEl0Frame4 = function ( weakpointNewDashEl0, event )
							if not event.interrupted then
								weakpointNewDashEl0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl0, event )
							else
								weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl0Frame4( weakpointNewDashEl0, event )
							return 
						else
							weakpointNewDashEl0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
							weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl0Frame3( weakpointNewDashEl0, event )
						return 
					else
						weakpointNewDashEl0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl0:setRGB( 1, 0, 0 )
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame3 )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setRGB( 1, 1, 1 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					local weakpointNewDashEl1Frame3 = function ( weakpointNewDashEl1, event )
						local weakpointNewDashEl1Frame4 = function ( weakpointNewDashEl1, event )
							if not event.interrupted then
								weakpointNewDashEl1:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl1:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl1, event )
							else
								weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl1Frame4( weakpointNewDashEl1, event )
							return 
						else
							weakpointNewDashEl1:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Bounce )
							weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl1Frame3( weakpointNewDashEl1, event )
						return 
					else
						weakpointNewDashEl1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl1:setRGB( 1, 0, 0 )
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame3 )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setRGB( 1, 1, 1 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					local weakpointNewThickPlus0Frame3 = function ( weakpointNewThickPlus0, event )
						local weakpointNewThickPlus0Frame4 = function ( weakpointNewThickPlus0, event )
							if not event.interrupted then
								weakpointNewThickPlus0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewThickPlus0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewThickPlus0, event )
							else
								weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewThickPlus0Frame4( weakpointNewThickPlus0, event )
							return 
						else
							weakpointNewThickPlus0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Bounce )
							weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewThickPlus0Frame3( weakpointNewThickPlus0, event )
						return 
					else
						weakpointNewThickPlus0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						weakpointNewThickPlus0:setRGB( 1, 0, 0 )
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame3 )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setRGB( 1, 1, 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					local weakpointNewDashEl00Frame3 = function ( weakpointNewDashEl00, event )
						local weakpointNewDashEl00Frame4 = function ( weakpointNewDashEl00, event )
							if not event.interrupted then
								weakpointNewDashEl00:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl00:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl00, event )
							else
								weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl00Frame4( weakpointNewDashEl00, event )
							return 
						else
							weakpointNewDashEl00:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
							weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl00Frame3( weakpointNewDashEl00, event )
						return 
					else
						weakpointNewDashEl00:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						weakpointNewDashEl00:setRGB( 1, 0, 0 )
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame3 )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setRGB( 1, 1, 1 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					local weakpointNewDashEl10Frame3 = function ( weakpointNewDashEl10, event )
						local weakpointNewDashEl10Frame4 = function ( weakpointNewDashEl10, event )
							if not event.interrupted then
								weakpointNewDashEl10:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl10:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl10, event )
							else
								weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl10Frame4( weakpointNewDashEl10, event )
							return 
						else
							weakpointNewDashEl10:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Bounce )
							weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl10Frame3( weakpointNewDashEl10, event )
						return 
					else
						weakpointNewDashEl10:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl10:setRGB( 1, 0, 0 )
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame3 )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setRGB( 1, 1, 1 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Repulsed = function ()
				self:setupElementClipCounter( 1 )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					local weakpointNewHex0Frame3 = function ( weakpointNewHex0, event )
						local weakpointNewHex0Frame4 = function ( weakpointNewHex0, event )
							local weakpointNewHex0Frame5 = function ( weakpointNewHex0, event )
								local weakpointNewHex0Frame6 = function ( weakpointNewHex0, event )
									local weakpointNewHex0Frame7 = function ( weakpointNewHex0, event )
										local weakpointNewHex0Frame8 = function ( weakpointNewHex0, event )
											local weakpointNewHex0Frame9 = function ( weakpointNewHex0, event )
												local weakpointNewHex0Frame10 = function ( weakpointNewHex0, event )
													local weakpointNewHex0Frame11 = function ( weakpointNewHex0, event )
														local weakpointNewHex0Frame12 = function ( weakpointNewHex0, event )
															local weakpointNewHex0Frame13 = function ( weakpointNewHex0, event )
																local weakpointNewHex0Frame14 = function ( weakpointNewHex0, event )
																	local weakpointNewHex0Frame15 = function ( weakpointNewHex0, event )
																		local weakpointNewHex0Frame16 = function ( weakpointNewHex0, event )
																			local weakpointNewHex0Frame17 = function ( weakpointNewHex0, event )
																				local weakpointNewHex0Frame18 = function ( weakpointNewHex0, event )
																					local weakpointNewHex0Frame19 = function ( weakpointNewHex0, event )
																						local weakpointNewHex0Frame20 = function ( weakpointNewHex0, event )
																							local weakpointNewHex0Frame21 = function ( weakpointNewHex0, event )
																								local weakpointNewHex0Frame22 = function ( weakpointNewHex0, event )
																									local weakpointNewHex0Frame23 = function ( weakpointNewHex0, event )
																										local weakpointNewHex0Frame24 = function ( weakpointNewHex0, event )
																											local weakpointNewHex0Frame25 = function ( weakpointNewHex0, event )
																												local weakpointNewHex0Frame26 = function ( weakpointNewHex0, event )
																													local weakpointNewHex0Frame27 = function ( weakpointNewHex0, event )
																														local weakpointNewHex0Frame28 = function ( weakpointNewHex0, event )
																															local weakpointNewHex0Frame29 = function ( weakpointNewHex0, event )
																																local weakpointNewHex0Frame30 = function ( weakpointNewHex0, event )
																																	local weakpointNewHex0Frame31 = function ( weakpointNewHex0, event )
																																		local weakpointNewHex0Frame32 = function ( weakpointNewHex0, event )
																																			local weakpointNewHex0Frame33 = function ( weakpointNewHex0, event )
																																				local weakpointNewHex0Frame34 = function ( weakpointNewHex0, event )
																																					local weakpointNewHex0Frame35 = function ( weakpointNewHex0, event )
																																						local weakpointNewHex0Frame36 = function ( weakpointNewHex0, event )
																																							local weakpointNewHex0Frame37 = function ( weakpointNewHex0, event )
																																								local weakpointNewHex0Frame38 = function ( weakpointNewHex0, event )
																																									if not event.interrupted then
																																										weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									end
																																									weakpointNewHex0:setLeftRight( false, false, -236.22, 238.22 )
																																									weakpointNewHex0:setTopBottom( false, false, -215.15, 215.15 )
																																									weakpointNewHex0:setAlpha( 0 )
																																									weakpointNewHex0:setZRot( 0 )
																																									if event.interrupted then
																																										self.clipFinished( weakpointNewHex0, event )
																																									else
																																										weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									weakpointNewHex0Frame38( weakpointNewHex0, event )
																																									return 
																																								else
																																									weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								weakpointNewHex0Frame37( weakpointNewHex0, event )
																																								return 
																																							else
																																								weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																								weakpointNewHex0:setAlpha( 0.34 )
																																								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							weakpointNewHex0Frame36( weakpointNewHex0, event )
																																							return 
																																						else
																																							weakpointNewHex0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						weakpointNewHex0Frame35( weakpointNewHex0, event )
																																						return 
																																					else
																																						weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																						weakpointNewHex0:setLeftRight( false, false, -236.22, 238.22 )
																																						weakpointNewHex0:setTopBottom( false, false, -215.15, 215.15 )
																																						weakpointNewHex0:setZRot( 0 )
																																						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					weakpointNewHex0Frame34( weakpointNewHex0, event )
																																					return 
																																				else
																																					weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				weakpointNewHex0Frame33( weakpointNewHex0, event )
																																				return 
																																			else
																																				weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																				weakpointNewHex0:setAlpha( 0 )
																																				weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			weakpointNewHex0Frame32( weakpointNewHex0, event )
																																			return 
																																		else
																																			weakpointNewHex0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																			weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		weakpointNewHex0Frame31( weakpointNewHex0, event )
																																		return 
																																	else
																																		weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																		weakpointNewHex0:setAlpha( 0.56 )
																																		weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	weakpointNewHex0Frame30( weakpointNewHex0, event )
																																	return 
																																else
																																	weakpointNewHex0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																	weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame30 )
																																end
																															end
																															
																															if event.interrupted then
																																weakpointNewHex0Frame29( weakpointNewHex0, event )
																																return 
																															else
																																weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																weakpointNewHex0:setAlpha( 0 )
																																weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															weakpointNewHex0Frame28( weakpointNewHex0, event )
																															return 
																														else
																															weakpointNewHex0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																															weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														weakpointNewHex0Frame27( weakpointNewHex0, event )
																														return 
																													else
																														weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														weakpointNewHex0:setAlpha( 1 )
																														weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													weakpointNewHex0Frame26( weakpointNewHex0, event )
																													return 
																												else
																													weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																													weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												weakpointNewHex0Frame25( weakpointNewHex0, event )
																												return 
																											else
																												weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																												weakpointNewHex0:setLeftRight( false, false, -217.75, 219.75 )
																												weakpointNewHex0:setTopBottom( false, false, -198.4, 198.4 )
																												weakpointNewHex0:setZRot( 90 )
																												weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											weakpointNewHex0Frame24( weakpointNewHex0, event )
																											return 
																										else
																											weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										weakpointNewHex0Frame23( weakpointNewHex0, event )
																										return 
																									else
																										weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										weakpointNewHex0:setAlpha( 0 )
																										weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									weakpointNewHex0Frame22( weakpointNewHex0, event )
																									return 
																								else
																									weakpointNewHex0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																									weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								weakpointNewHex0Frame21( weakpointNewHex0, event )
																								return 
																							else
																								weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								weakpointNewHex0:setAlpha( 1 )
																								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							weakpointNewHex0Frame20( weakpointNewHex0, event )
																							return 
																						else
																							weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						weakpointNewHex0Frame19( weakpointNewHex0, event )
																						return 
																					else
																						weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						weakpointNewHex0:setLeftRight( false, false, -172.2, 174.2 )
																						weakpointNewHex0:setTopBottom( false, false, -157.08, 157.08 )
																						weakpointNewHex0:setZRot( 0 )
																						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					weakpointNewHex0Frame18( weakpointNewHex0, event )
																					return 
																				else
																					weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					weakpointNewHex0:setAlpha( 0 )
																					weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				weakpointNewHex0Frame17( weakpointNewHex0, event )
																				return 
																			else
																				weakpointNewHex0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																				weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			weakpointNewHex0Frame16( weakpointNewHex0, event )
																			return 
																		else
																			weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			weakpointNewHex0:setAlpha( 1 )
																			weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		weakpointNewHex0Frame15( weakpointNewHex0, event )
																		return 
																	else
																		weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame15 )
																	end
																end
																
																if event.interrupted then
																	weakpointNewHex0Frame14( weakpointNewHex0, event )
																	return 
																else
																	weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	weakpointNewHex0:setAlpha( 0.2 )
																	weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame14 )
																end
															end
															
															if event.interrupted then
																weakpointNewHex0Frame13( weakpointNewHex0, event )
																return 
															else
																weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																weakpointNewHex0:setLeftRight( false, false, -145.11, 147.11 )
																weakpointNewHex0:setTopBottom( false, false, -132.52, 132.52 )
																weakpointNewHex0:setZRot( 90 )
																weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame13 )
															end
														end
														
														if event.interrupted then
															weakpointNewHex0Frame12( weakpointNewHex0, event )
															return 
														else
															weakpointNewHex0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame12 )
														end
													end
													
													if event.interrupted then
														weakpointNewHex0Frame11( weakpointNewHex0, event )
														return 
													else
														weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														weakpointNewHex0:setAlpha( 1 )
														weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame11 )
													end
												end
												
												if event.interrupted then
													weakpointNewHex0Frame10( weakpointNewHex0, event )
													return 
												else
													weakpointNewHex0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame10 )
												end
											end
											
											if event.interrupted then
												weakpointNewHex0Frame9( weakpointNewHex0, event )
												return 
											else
												weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												weakpointNewHex0:setAlpha( 0 )
												weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame9 )
											end
										end
										
										if event.interrupted then
											weakpointNewHex0Frame8( weakpointNewHex0, event )
											return 
										else
											weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame8 )
										end
									end
									
									if event.interrupted then
										weakpointNewHex0Frame7( weakpointNewHex0, event )
										return 
									else
										weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										weakpointNewHex0:setAlpha( 0.8 )
										weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame7 )
									end
								end
								
								if event.interrupted then
									weakpointNewHex0Frame6( weakpointNewHex0, event )
									return 
								else
									weakpointNewHex0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame6 )
								end
							end
							
							if event.interrupted then
								weakpointNewHex0Frame5( weakpointNewHex0, event )
								return 
							else
								weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								weakpointNewHex0:setAlpha( 0 )
								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewHex0Frame4( weakpointNewHex0, event )
							return 
						else
							weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							weakpointNewHex0:setAlpha( 0.5 )
							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewHex0Frame3( weakpointNewHex0, event )
						return 
					else
						weakpointNewHex0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame3 )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setLeftRight( false, false, -121.72, 123.72 )
				self.weakpointNewHex0:setTopBottom( false, false, -111.3, 111.3 )
				self.weakpointNewHex0:setAlpha( 0 )
				self.weakpointNewHex0:setZRot( 0 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
			end
		},
		Medium = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				self.clipFinished( Diagonals, {} )
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewArrowSmallContainer0, {} )
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 1 )
				self.clipFinished( weakpointNewCornerContainer0, {} )
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewDashContainer0, {} )
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineH0, {} )
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineV0, {} )
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineV1, {} )
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineH1, {} )
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineContainer0, {} )
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineContainer1, {} )
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl0, {} )
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl1, {} )
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				self.clipFinished( weakpointNewThickPlus0, {} )
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrow0, {} )
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrow5, {} )
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint0, {} )
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint1, {} )
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 1 )
				self.clipFinished( weakpointNewDashEl00, {} )
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 1 )
				self.clipFinished( weakpointNewDashEl10, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					local weakpointNewCornerContainer0Frame3 = function ( weakpointNewCornerContainer0, event )
						if not event.interrupted then
							weakpointNewCornerContainer0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewCornerContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewCornerContainer0, event )
						else
							weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewCornerContainer0Frame3( weakpointNewCornerContainer0, event )
						return 
					else
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 1090, false, false, CoD.TweenType.Linear )
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame3 )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					local weakpointNewRedLineH0Frame3 = function ( weakpointNewRedLineH0, event )
						if not event.interrupted then
							weakpointNewRedLineH0:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH0, event )
						else
							weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH0Frame3( weakpointNewRedLineH0, event )
						return 
					else
						weakpointNewRedLineH0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH0Frame3 )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					local weakpointNewRedLineContainer0Frame3 = function ( weakpointNewRedLineContainer0, event )
						if not event.interrupted then
							weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1399, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer0, event )
						else
							weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer0Frame3( weakpointNewRedLineContainer0, event )
						return 
					else
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer0Frame3 )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 1320, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					local weakpointNewRedArrow5Frame3 = function ( weakpointNewRedArrow5, event )
						if not event.interrupted then
							weakpointNewRedArrow5:beginAnimation( "keyframe", 1140, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrow5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrow5, event )
						else
							weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow5Frame3( weakpointNewRedArrow5, event )
						return 
					else
						weakpointNewRedArrow5:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow5Frame3 )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					local weakpointNewRedArrowPoint0Frame3 = function ( weakpointNewRedArrowPoint0, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrowPoint0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint0, event )
						else
							weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint0Frame3( weakpointNewRedArrowPoint0, event )
						return 
					else
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint0Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 1919, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					local weakpointNewDashEl00Frame3 = function ( weakpointNewDashEl00, event )
						if not event.interrupted then
							weakpointNewDashEl00:beginAnimation( "keyframe", 1370, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl00:setLeftRight( false, false, -8, 28.01 )
						weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl00, event )
						else
							weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl00Frame3( weakpointNewDashEl00, event )
						return 
					else
						weakpointNewDashEl00:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame3 )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 1 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -29.5, 6.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 1 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewCornerContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					local weakpointNewDashContainer0Frame3 = function ( weakpointNewDashContainer0, event )
						if not event.interrupted then
							weakpointNewDashContainer0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashContainer0, event )
						else
							weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashContainer0Frame3( weakpointNewDashContainer0, event )
						return 
					else
						weakpointNewDashContainer0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashContainer0Frame3 )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					local weakpointNewRedLineH0Frame3 = function ( weakpointNewRedLineH0, event )
						if not event.interrupted then
							weakpointNewRedLineH0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH0, event )
						else
							weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH0Frame3( weakpointNewRedLineH0, event )
						return 
					else
						weakpointNewRedLineH0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH0Frame3 )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					local weakpointNewRedLineContainer0Frame3 = function ( weakpointNewRedLineContainer0, event )
						if not event.interrupted then
							weakpointNewRedLineContainer0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer0, event )
						else
							weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer0Frame3( weakpointNewRedLineContainer0, event )
						return 
					else
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer0Frame3 )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					local weakpointNewDashEl1Frame3 = function ( weakpointNewDashEl1, event )
						if not event.interrupted then
							weakpointNewDashEl1:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl1, event )
						else
							weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl1Frame3( weakpointNewDashEl1, event )
						return 
					else
						weakpointNewDashEl1:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame3 )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					local weakpointNewRedArrow5Frame3 = function ( weakpointNewRedArrow5, event )
						if not event.interrupted then
							weakpointNewRedArrow5:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrow5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrow5, event )
						else
							weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow5Frame3( weakpointNewRedArrow5, event )
						return 
					else
						weakpointNewRedArrow5:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow5Frame3 )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint0, event )
					else
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 81, 117 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 1 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					local weakpointNewDashEl10Frame3 = function ( weakpointNewDashEl10, event )
						if not event.interrupted then
							weakpointNewDashEl10:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl10:setLeftRight( false, false, -117, -81 )
						weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl10:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl10, event )
						else
							weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl10Frame3( weakpointNewDashEl10, event )
						return 
					else
						weakpointNewDashEl10:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame3 )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 1 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Obscured = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewCornerContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					if not event.interrupted then
						weakpointNewRedLineH0:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH0, event )
					else
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					local weakpointNewRedLineV1Frame3 = function ( weakpointNewRedLineV1, event )
						if not event.interrupted then
							weakpointNewRedLineV1:beginAnimation( "keyframe", 710, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV1, event )
						else
							weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV1Frame3( weakpointNewRedLineV1, event )
						return 
					else
						weakpointNewRedLineV1:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV1Frame3 )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					if not event.interrupted then
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer0, event )
					else
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					local weakpointNewDashEl1Frame3 = function ( weakpointNewDashEl1, event )
						if not event.interrupted then
							weakpointNewDashEl1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl1, event )
						else
							weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl1Frame3( weakpointNewDashEl1, event )
						return 
					else
						weakpointNewDashEl1:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame3 )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					local weakpointNewThickPlus0Frame3 = function ( weakpointNewThickPlus0, event )
						if not event.interrupted then
							weakpointNewThickPlus0:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewThickPlus0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewThickPlus0, event )
						else
							weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewThickPlus0Frame3( weakpointNewThickPlus0, event )
						return 
					else
						weakpointNewThickPlus0:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame3 )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrow0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrow5:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					local weakpointNewRedArrowPoint0Frame3 = function ( weakpointNewRedArrowPoint0, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrowPoint0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint0, event )
						else
							weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint0Frame3( weakpointNewRedArrowPoint0, event )
						return 
					else
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint0Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 11.01, 47.01 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 0.52 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 1 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -46.5, -10.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 0.55 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 1 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Damaged = function ()
				self:setupElementClipCounter( 10 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					local DiagonalsFrame3 = function ( Diagonals, event )
						local DiagonalsFrame4 = function ( Diagonals, event )
							if not event.interrupted then
								Diagonals:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
							end
							Diagonals:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Diagonals, event )
							else
								Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							DiagonalsFrame4( Diagonals, event )
							return 
						else
							Diagonals:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Bounce )
							Diagonals:registerEventHandler( "transition_complete_keyframe", DiagonalsFrame4 )
						end
					end
					
					if event.interrupted then
						DiagonalsFrame3( Diagonals, event )
						return 
					else
						Diagonals:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						Diagonals:setAlpha( 1 )
						Diagonals:registerEventHandler( "transition_complete_keyframe", DiagonalsFrame3 )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					local weakpointNewArrowSmallContainer0Frame3 = function ( weakpointNewArrowSmallContainer0, event )
						local weakpointNewArrowSmallContainer0Frame4 = function ( weakpointNewArrowSmallContainer0, event )
							if not event.interrupted then
								weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewArrowSmallContainer0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewArrowSmallContainer0, event )
							else
								weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewArrowSmallContainer0Frame4( weakpointNewArrowSmallContainer0, event )
							return 
						else
							weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 989, false, false, CoD.TweenType.Bounce )
							weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewArrowSmallContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewArrowSmallContainer0Frame3( weakpointNewArrowSmallContainer0, event )
						return 
					else
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						weakpointNewArrowSmallContainer0:setRGB( 1, 0, 0 )
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewArrowSmallContainer0Frame3 )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setRGB( 1, 1, 1 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					local weakpointNewCornerContainer0Frame3 = function ( weakpointNewCornerContainer0, event )
						local weakpointNewCornerContainer0Frame4 = function ( weakpointNewCornerContainer0, event )
							if not event.interrupted then
								weakpointNewCornerContainer0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewCornerContainer0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewCornerContainer0, event )
							else
								weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewCornerContainer0Frame4( weakpointNewCornerContainer0, event )
							return 
						else
							weakpointNewCornerContainer0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
							weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewCornerContainer0Frame3( weakpointNewCornerContainer0, event )
						return 
					else
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						weakpointNewCornerContainer0:setRGB( 1, 0, 0 )
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame3 )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setRGB( 1, 1, 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					local weakpointNewDashContainer0Frame3 = function ( weakpointNewDashContainer0, event )
						local weakpointNewDashContainer0Frame4 = function ( weakpointNewDashContainer0, event )
							if not event.interrupted then
								weakpointNewDashContainer0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashContainer0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashContainer0, event )
							else
								weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashContainer0Frame4( weakpointNewDashContainer0, event )
							return 
						else
							weakpointNewDashContainer0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
							weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashContainer0Frame3( weakpointNewDashContainer0, event )
						return 
					else
						weakpointNewDashContainer0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
						weakpointNewDashContainer0:setRGB( 1, 0, 0 )
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashContainer0Frame3 )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setRGB( 1, 1, 1 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					local weakpointNewHex0Frame3 = function ( weakpointNewHex0, event )
						local weakpointNewHex0Frame4 = function ( weakpointNewHex0, event )
							if not event.interrupted then
								weakpointNewHex0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewHex0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewHex0, event )
							else
								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewHex0Frame4( weakpointNewHex0, event )
							return 
						else
							weakpointNewHex0:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewHex0Frame3( weakpointNewHex0, event )
						return 
					else
						weakpointNewHex0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
						weakpointNewHex0:setRGB( 1, 0, 0 )
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame3 )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setRGB( 1, 1, 1 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					local weakpointNewDashEl0Frame3 = function ( weakpointNewDashEl0, event )
						local weakpointNewDashEl0Frame4 = function ( weakpointNewDashEl0, event )
							if not event.interrupted then
								weakpointNewDashEl0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl0, event )
							else
								weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl0Frame4( weakpointNewDashEl0, event )
							return 
						else
							weakpointNewDashEl0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
							weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl0Frame3( weakpointNewDashEl0, event )
						return 
					else
						weakpointNewDashEl0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl0:setRGB( 1, 0, 0 )
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame3 )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setRGB( 1, 1, 1 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					local weakpointNewDashEl1Frame3 = function ( weakpointNewDashEl1, event )
						local weakpointNewDashEl1Frame4 = function ( weakpointNewDashEl1, event )
							if not event.interrupted then
								weakpointNewDashEl1:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl1:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl1, event )
							else
								weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl1Frame4( weakpointNewDashEl1, event )
							return 
						else
							weakpointNewDashEl1:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Bounce )
							weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl1Frame3( weakpointNewDashEl1, event )
						return 
					else
						weakpointNewDashEl1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl1:setRGB( 1, 0, 0 )
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame3 )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setRGB( 1, 1, 1 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					local weakpointNewThickPlus0Frame3 = function ( weakpointNewThickPlus0, event )
						local weakpointNewThickPlus0Frame4 = function ( weakpointNewThickPlus0, event )
							if not event.interrupted then
								weakpointNewThickPlus0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewThickPlus0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewThickPlus0, event )
							else
								weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewThickPlus0Frame4( weakpointNewThickPlus0, event )
							return 
						else
							weakpointNewThickPlus0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Bounce )
							weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewThickPlus0Frame3( weakpointNewThickPlus0, event )
						return 
					else
						weakpointNewThickPlus0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						weakpointNewThickPlus0:setRGB( 1, 0, 0 )
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame3 )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setRGB( 1, 1, 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					local weakpointNewDashEl00Frame3 = function ( weakpointNewDashEl00, event )
						local weakpointNewDashEl00Frame4 = function ( weakpointNewDashEl00, event )
							if not event.interrupted then
								weakpointNewDashEl00:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl00:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl00, event )
							else
								weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl00Frame4( weakpointNewDashEl00, event )
							return 
						else
							weakpointNewDashEl00:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
							weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl00Frame3( weakpointNewDashEl00, event )
						return 
					else
						weakpointNewDashEl00:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						weakpointNewDashEl00:setRGB( 1, 0, 0 )
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame3 )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setRGB( 1, 1, 1 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					local weakpointNewDashEl10Frame3 = function ( weakpointNewDashEl10, event )
						local weakpointNewDashEl10Frame4 = function ( weakpointNewDashEl10, event )
							if not event.interrupted then
								weakpointNewDashEl10:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl10:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl10, event )
							else
								weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl10Frame4( weakpointNewDashEl10, event )
							return 
						else
							weakpointNewDashEl10:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Bounce )
							weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl10Frame3( weakpointNewDashEl10, event )
						return 
					else
						weakpointNewDashEl10:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl10:setRGB( 1, 0, 0 )
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame3 )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setRGB( 1, 1, 1 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Repulsed = function ()
				self:setupElementClipCounter( 1 )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					local weakpointNewHex0Frame3 = function ( weakpointNewHex0, event )
						local weakpointNewHex0Frame4 = function ( weakpointNewHex0, event )
							local weakpointNewHex0Frame5 = function ( weakpointNewHex0, event )
								local weakpointNewHex0Frame6 = function ( weakpointNewHex0, event )
									local weakpointNewHex0Frame7 = function ( weakpointNewHex0, event )
										local weakpointNewHex0Frame8 = function ( weakpointNewHex0, event )
											local weakpointNewHex0Frame9 = function ( weakpointNewHex0, event )
												local weakpointNewHex0Frame10 = function ( weakpointNewHex0, event )
													local weakpointNewHex0Frame11 = function ( weakpointNewHex0, event )
														local weakpointNewHex0Frame12 = function ( weakpointNewHex0, event )
															local weakpointNewHex0Frame13 = function ( weakpointNewHex0, event )
																local weakpointNewHex0Frame14 = function ( weakpointNewHex0, event )
																	local weakpointNewHex0Frame15 = function ( weakpointNewHex0, event )
																		local weakpointNewHex0Frame16 = function ( weakpointNewHex0, event )
																			local weakpointNewHex0Frame17 = function ( weakpointNewHex0, event )
																				local weakpointNewHex0Frame18 = function ( weakpointNewHex0, event )
																					local weakpointNewHex0Frame19 = function ( weakpointNewHex0, event )
																						local weakpointNewHex0Frame20 = function ( weakpointNewHex0, event )
																							local weakpointNewHex0Frame21 = function ( weakpointNewHex0, event )
																								local weakpointNewHex0Frame22 = function ( weakpointNewHex0, event )
																									local weakpointNewHex0Frame23 = function ( weakpointNewHex0, event )
																										local weakpointNewHex0Frame24 = function ( weakpointNewHex0, event )
																											local weakpointNewHex0Frame25 = function ( weakpointNewHex0, event )
																												local weakpointNewHex0Frame26 = function ( weakpointNewHex0, event )
																													local weakpointNewHex0Frame27 = function ( weakpointNewHex0, event )
																														local weakpointNewHex0Frame28 = function ( weakpointNewHex0, event )
																															local weakpointNewHex0Frame29 = function ( weakpointNewHex0, event )
																																local weakpointNewHex0Frame30 = function ( weakpointNewHex0, event )
																																	local weakpointNewHex0Frame31 = function ( weakpointNewHex0, event )
																																		local weakpointNewHex0Frame32 = function ( weakpointNewHex0, event )
																																			local weakpointNewHex0Frame33 = function ( weakpointNewHex0, event )
																																				local weakpointNewHex0Frame34 = function ( weakpointNewHex0, event )
																																					local weakpointNewHex0Frame35 = function ( weakpointNewHex0, event )
																																						local weakpointNewHex0Frame36 = function ( weakpointNewHex0, event )
																																							local weakpointNewHex0Frame37 = function ( weakpointNewHex0, event )
																																								local weakpointNewHex0Frame38 = function ( weakpointNewHex0, event )
																																									if not event.interrupted then
																																										weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									end
																																									weakpointNewHex0:setLeftRight( false, false, -236.22, 238.22 )
																																									weakpointNewHex0:setTopBottom( false, false, -215.15, 215.15 )
																																									weakpointNewHex0:setAlpha( 0 )
																																									weakpointNewHex0:setZRot( 0 )
																																									if event.interrupted then
																																										self.clipFinished( weakpointNewHex0, event )
																																									else
																																										weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									weakpointNewHex0Frame38( weakpointNewHex0, event )
																																									return 
																																								else
																																									weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								weakpointNewHex0Frame37( weakpointNewHex0, event )
																																								return 
																																							else
																																								weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																								weakpointNewHex0:setAlpha( 0.34 )
																																								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							weakpointNewHex0Frame36( weakpointNewHex0, event )
																																							return 
																																						else
																																							weakpointNewHex0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						weakpointNewHex0Frame35( weakpointNewHex0, event )
																																						return 
																																					else
																																						weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																						weakpointNewHex0:setLeftRight( false, false, -236.22, 238.22 )
																																						weakpointNewHex0:setTopBottom( false, false, -215.15, 215.15 )
																																						weakpointNewHex0:setZRot( 0 )
																																						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					weakpointNewHex0Frame34( weakpointNewHex0, event )
																																					return 
																																				else
																																					weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				weakpointNewHex0Frame33( weakpointNewHex0, event )
																																				return 
																																			else
																																				weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																				weakpointNewHex0:setAlpha( 0 )
																																				weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			weakpointNewHex0Frame32( weakpointNewHex0, event )
																																			return 
																																		else
																																			weakpointNewHex0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																			weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		weakpointNewHex0Frame31( weakpointNewHex0, event )
																																		return 
																																	else
																																		weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																		weakpointNewHex0:setAlpha( 0.56 )
																																		weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	weakpointNewHex0Frame30( weakpointNewHex0, event )
																																	return 
																																else
																																	weakpointNewHex0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																	weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame30 )
																																end
																															end
																															
																															if event.interrupted then
																																weakpointNewHex0Frame29( weakpointNewHex0, event )
																																return 
																															else
																																weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																weakpointNewHex0:setAlpha( 0 )
																																weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															weakpointNewHex0Frame28( weakpointNewHex0, event )
																															return 
																														else
																															weakpointNewHex0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																															weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														weakpointNewHex0Frame27( weakpointNewHex0, event )
																														return 
																													else
																														weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														weakpointNewHex0:setAlpha( 1 )
																														weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													weakpointNewHex0Frame26( weakpointNewHex0, event )
																													return 
																												else
																													weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																													weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												weakpointNewHex0Frame25( weakpointNewHex0, event )
																												return 
																											else
																												weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																												weakpointNewHex0:setLeftRight( false, false, -217.75, 219.75 )
																												weakpointNewHex0:setTopBottom( false, false, -198.4, 198.4 )
																												weakpointNewHex0:setZRot( 90 )
																												weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											weakpointNewHex0Frame24( weakpointNewHex0, event )
																											return 
																										else
																											weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										weakpointNewHex0Frame23( weakpointNewHex0, event )
																										return 
																									else
																										weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										weakpointNewHex0:setAlpha( 0 )
																										weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									weakpointNewHex0Frame22( weakpointNewHex0, event )
																									return 
																								else
																									weakpointNewHex0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																									weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								weakpointNewHex0Frame21( weakpointNewHex0, event )
																								return 
																							else
																								weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								weakpointNewHex0:setAlpha( 1 )
																								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							weakpointNewHex0Frame20( weakpointNewHex0, event )
																							return 
																						else
																							weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						weakpointNewHex0Frame19( weakpointNewHex0, event )
																						return 
																					else
																						weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						weakpointNewHex0:setLeftRight( false, false, -172.2, 174.2 )
																						weakpointNewHex0:setTopBottom( false, false, -157.08, 157.08 )
																						weakpointNewHex0:setZRot( 0 )
																						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					weakpointNewHex0Frame18( weakpointNewHex0, event )
																					return 
																				else
																					weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					weakpointNewHex0:setAlpha( 0 )
																					weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				weakpointNewHex0Frame17( weakpointNewHex0, event )
																				return 
																			else
																				weakpointNewHex0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																				weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			weakpointNewHex0Frame16( weakpointNewHex0, event )
																			return 
																		else
																			weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			weakpointNewHex0:setAlpha( 1 )
																			weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		weakpointNewHex0Frame15( weakpointNewHex0, event )
																		return 
																	else
																		weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame15 )
																	end
																end
																
																if event.interrupted then
																	weakpointNewHex0Frame14( weakpointNewHex0, event )
																	return 
																else
																	weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	weakpointNewHex0:setAlpha( 0.2 )
																	weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame14 )
																end
															end
															
															if event.interrupted then
																weakpointNewHex0Frame13( weakpointNewHex0, event )
																return 
															else
																weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																weakpointNewHex0:setLeftRight( false, false, -145.11, 147.11 )
																weakpointNewHex0:setTopBottom( false, false, -132.52, 132.52 )
																weakpointNewHex0:setZRot( 90 )
																weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame13 )
															end
														end
														
														if event.interrupted then
															weakpointNewHex0Frame12( weakpointNewHex0, event )
															return 
														else
															weakpointNewHex0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame12 )
														end
													end
													
													if event.interrupted then
														weakpointNewHex0Frame11( weakpointNewHex0, event )
														return 
													else
														weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														weakpointNewHex0:setAlpha( 1 )
														weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame11 )
													end
												end
												
												if event.interrupted then
													weakpointNewHex0Frame10( weakpointNewHex0, event )
													return 
												else
													weakpointNewHex0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame10 )
												end
											end
											
											if event.interrupted then
												weakpointNewHex0Frame9( weakpointNewHex0, event )
												return 
											else
												weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												weakpointNewHex0:setAlpha( 0 )
												weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame9 )
											end
										end
										
										if event.interrupted then
											weakpointNewHex0Frame8( weakpointNewHex0, event )
											return 
										else
											weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame8 )
										end
									end
									
									if event.interrupted then
										weakpointNewHex0Frame7( weakpointNewHex0, event )
										return 
									else
										weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										weakpointNewHex0:setAlpha( 0.8 )
										weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame7 )
									end
								end
								
								if event.interrupted then
									weakpointNewHex0Frame6( weakpointNewHex0, event )
									return 
								else
									weakpointNewHex0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame6 )
								end
							end
							
							if event.interrupted then
								weakpointNewHex0Frame5( weakpointNewHex0, event )
								return 
							else
								weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								weakpointNewHex0:setAlpha( 0 )
								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewHex0Frame4( weakpointNewHex0, event )
							return 
						else
							weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							weakpointNewHex0:setAlpha( 0.5 )
							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewHex0Frame3( weakpointNewHex0, event )
						return 
					else
						weakpointNewHex0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame3 )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setLeftRight( false, false, -121.72, 123.72 )
				self.weakpointNewHex0:setTopBottom( false, false, -111.3, 111.3 )
				self.weakpointNewHex0:setAlpha( 0 )
				self.weakpointNewHex0:setZRot( 0 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
			end,
			Far = function ()
				self:setupElementClipCounter( 19 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewCornerContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					if not event.interrupted then
						weakpointNewRedLineH0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineH0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH0, event )
					else
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineV0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineV1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineH1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					if not event.interrupted then
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer0, event )
					else
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewDashEl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewDashEl1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewThickPlus0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrow5:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrowPoint0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint0, event )
					else
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 1 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 1 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end
		},
		Far = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				self.clipFinished( Diagonals, {} )
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewArrowSmallContainer0, {} )
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewCornerContainer0, {} )
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewDashContainer0, {} )
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineH0, {} )
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineV0, {} )
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineV1, {} )
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineH1, {} )
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineContainer0, {} )
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineContainer1, {} )
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl0, {} )
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl1, {} )
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				self.clipFinished( weakpointNewThickPlus0, {} )
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrow0, {} )
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrow5, {} )
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint0, {} )
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint1, {} )
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 1 )
				self.clipFinished( weakpointNewDashEl00, {} )
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 1 )
				self.clipFinished( weakpointNewDashEl10, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					local weakpointNewCornerContainer0Frame3 = function ( weakpointNewCornerContainer0, event )
						if not event.interrupted then
							weakpointNewCornerContainer0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewCornerContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewCornerContainer0, event )
						else
							weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewCornerContainer0Frame3( weakpointNewCornerContainer0, event )
						return 
					else
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 1090, false, false, CoD.TweenType.Linear )
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame3 )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					local weakpointNewRedLineH0Frame3 = function ( weakpointNewRedLineH0, event )
						if not event.interrupted then
							weakpointNewRedLineH0:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH0, event )
						else
							weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH0Frame3( weakpointNewRedLineH0, event )
						return 
					else
						weakpointNewRedLineH0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH0Frame3 )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					local weakpointNewRedLineContainer0Frame3 = function ( weakpointNewRedLineContainer0, event )
						if not event.interrupted then
							weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1399, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer0, event )
						else
							weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer0Frame3( weakpointNewRedLineContainer0, event )
						return 
					else
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer0Frame3 )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 1320, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					local weakpointNewRedArrow5Frame3 = function ( weakpointNewRedArrow5, event )
						if not event.interrupted then
							weakpointNewRedArrow5:beginAnimation( "keyframe", 1140, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrow5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrow5, event )
						else
							weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow5Frame3( weakpointNewRedArrow5, event )
						return 
					else
						weakpointNewRedArrow5:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow5Frame3 )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					local weakpointNewRedArrowPoint0Frame3 = function ( weakpointNewRedArrowPoint0, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrowPoint0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint0, event )
						else
							weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint0Frame3( weakpointNewRedArrowPoint0, event )
						return 
					else
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint0Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 1919, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					local weakpointNewDashEl00Frame3 = function ( weakpointNewDashEl00, event )
						if not event.interrupted then
							weakpointNewDashEl00:beginAnimation( "keyframe", 1370, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl00:setLeftRight( false, false, -8, 28.01 )
						weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl00, event )
						else
							weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl00Frame3( weakpointNewDashEl00, event )
						return 
					else
						weakpointNewDashEl00:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame3 )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 1 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -29.5, 6.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 1 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewCornerContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					local weakpointNewDashContainer0Frame3 = function ( weakpointNewDashContainer0, event )
						if not event.interrupted then
							weakpointNewDashContainer0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashContainer0, event )
						else
							weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashContainer0Frame3( weakpointNewDashContainer0, event )
						return 
					else
						weakpointNewDashContainer0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashContainer0Frame3 )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					local weakpointNewRedLineH0Frame3 = function ( weakpointNewRedLineH0, event )
						if not event.interrupted then
							weakpointNewRedLineH0:beginAnimation( "keyframe", 649, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH0, event )
						else
							weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH0Frame3( weakpointNewRedLineH0, event )
						return 
					else
						weakpointNewRedLineH0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH0Frame3 )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					local weakpointNewRedLineContainer0Frame3 = function ( weakpointNewRedLineContainer0, event )
						if not event.interrupted then
							weakpointNewRedLineContainer0:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineContainer0, event )
						else
							weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineContainer0Frame3( weakpointNewRedLineContainer0, event )
						return 
					else
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineContainer0Frame3 )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					local weakpointNewDashEl1Frame3 = function ( weakpointNewDashEl1, event )
						if not event.interrupted then
							weakpointNewDashEl1:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl1, event )
						else
							weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl1Frame3( weakpointNewDashEl1, event )
						return 
					else
						weakpointNewDashEl1:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame3 )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					local weakpointNewRedArrow5Frame3 = function ( weakpointNewRedArrow5, event )
						if not event.interrupted then
							weakpointNewRedArrow5:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrow5:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrow5, event )
						else
							weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrow5Frame3( weakpointNewRedArrow5, event )
						return 
					else
						weakpointNewRedArrow5:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrow5Frame3 )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint0, event )
					else
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 81, 117 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 1 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					local weakpointNewDashEl10Frame3 = function ( weakpointNewDashEl10, event )
						if not event.interrupted then
							weakpointNewDashEl10:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl10:setLeftRight( false, false, -117, -81 )
						weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
						weakpointNewDashEl10:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl10, event )
						else
							weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl10Frame3( weakpointNewDashEl10, event )
						return 
					else
						weakpointNewDashEl10:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame3 )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 1 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Obscured = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					if not event.interrupted then
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewCornerContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewCornerContainer0, event )
					else
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 829, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					if not event.interrupted then
						weakpointNewRedLineH0:beginAnimation( "keyframe", 730, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH0, event )
					else
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					if not event.interrupted then
						weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV0, event )
					else
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					local weakpointNewRedLineV1Frame3 = function ( weakpointNewRedLineV1, event )
						if not event.interrupted then
							weakpointNewRedLineV1:beginAnimation( "keyframe", 710, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV1, event )
						else
							weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV1Frame3( weakpointNewRedLineV1, event )
						return 
					else
						weakpointNewRedLineV1:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV1Frame3 )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					if not event.interrupted then
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer0, event )
					else
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					if not event.interrupted then
						weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl0, event )
					else
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					local weakpointNewDashEl1Frame3 = function ( weakpointNewDashEl1, event )
						if not event.interrupted then
							weakpointNewDashEl1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl1, event )
						else
							weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl1Frame3( weakpointNewDashEl1, event )
						return 
					else
						weakpointNewDashEl1:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame3 )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					local weakpointNewThickPlus0Frame3 = function ( weakpointNewThickPlus0, event )
						if not event.interrupted then
							weakpointNewThickPlus0:beginAnimation( "keyframe", 669, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewThickPlus0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewThickPlus0, event )
						else
							weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewThickPlus0Frame3( weakpointNewThickPlus0, event )
						return 
					else
						weakpointNewThickPlus0:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame3 )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrow0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 0 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrow5:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 0 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					local weakpointNewRedArrowPoint0Frame3 = function ( weakpointNewRedArrowPoint0, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrowPoint0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint0, event )
						else
							weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint0Frame3( weakpointNewRedArrowPoint0, event )
						return 
					else
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint0Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 11.01, 47.01 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 0.52 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 1 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -46.5, -10.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 0.55 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 1 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Damaged = function ()
				self:setupElementClipCounter( 10 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					local DiagonalsFrame3 = function ( Diagonals, event )
						local DiagonalsFrame4 = function ( Diagonals, event )
							if not event.interrupted then
								Diagonals:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
							end
							Diagonals:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Diagonals, event )
							else
								Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							DiagonalsFrame4( Diagonals, event )
							return 
						else
							Diagonals:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Bounce )
							Diagonals:registerEventHandler( "transition_complete_keyframe", DiagonalsFrame4 )
						end
					end
					
					if event.interrupted then
						DiagonalsFrame3( Diagonals, event )
						return 
					else
						Diagonals:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						Diagonals:setAlpha( 1 )
						Diagonals:registerEventHandler( "transition_complete_keyframe", DiagonalsFrame3 )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					local weakpointNewArrowSmallContainer0Frame3 = function ( weakpointNewArrowSmallContainer0, event )
						local weakpointNewArrowSmallContainer0Frame4 = function ( weakpointNewArrowSmallContainer0, event )
							if not event.interrupted then
								weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewArrowSmallContainer0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewArrowSmallContainer0, event )
							else
								weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewArrowSmallContainer0Frame4( weakpointNewArrowSmallContainer0, event )
							return 
						else
							weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 989, false, false, CoD.TweenType.Bounce )
							weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewArrowSmallContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewArrowSmallContainer0Frame3( weakpointNewArrowSmallContainer0, event )
						return 
					else
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						weakpointNewArrowSmallContainer0:setRGB( 1, 0, 0 )
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewArrowSmallContainer0Frame3 )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setRGB( 1, 1, 1 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					local weakpointNewCornerContainer0Frame3 = function ( weakpointNewCornerContainer0, event )
						local weakpointNewCornerContainer0Frame4 = function ( weakpointNewCornerContainer0, event )
							if not event.interrupted then
								weakpointNewCornerContainer0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewCornerContainer0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewCornerContainer0, event )
							else
								weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewCornerContainer0Frame4( weakpointNewCornerContainer0, event )
							return 
						else
							weakpointNewCornerContainer0:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
							weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewCornerContainer0Frame3( weakpointNewCornerContainer0, event )
						return 
					else
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
						weakpointNewCornerContainer0:setRGB( 1, 0, 0 )
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame3 )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setRGB( 1, 1, 1 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					local weakpointNewDashContainer0Frame3 = function ( weakpointNewDashContainer0, event )
						local weakpointNewDashContainer0Frame4 = function ( weakpointNewDashContainer0, event )
							if not event.interrupted then
								weakpointNewDashContainer0:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashContainer0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashContainer0, event )
							else
								weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashContainer0Frame4( weakpointNewDashContainer0, event )
							return 
						else
							weakpointNewDashContainer0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
							weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashContainer0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashContainer0Frame3( weakpointNewDashContainer0, event )
						return 
					else
						weakpointNewDashContainer0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
						weakpointNewDashContainer0:setRGB( 1, 0, 0 )
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashContainer0Frame3 )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setRGB( 1, 1, 1 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					local weakpointNewHex0Frame3 = function ( weakpointNewHex0, event )
						local weakpointNewHex0Frame4 = function ( weakpointNewHex0, event )
							if not event.interrupted then
								weakpointNewHex0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewHex0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewHex0, event )
							else
								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewHex0Frame4( weakpointNewHex0, event )
							return 
						else
							weakpointNewHex0:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewHex0Frame3( weakpointNewHex0, event )
						return 
					else
						weakpointNewHex0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
						weakpointNewHex0:setRGB( 1, 0, 0 )
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame3 )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setRGB( 1, 1, 1 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					local weakpointNewDashEl0Frame3 = function ( weakpointNewDashEl0, event )
						local weakpointNewDashEl0Frame4 = function ( weakpointNewDashEl0, event )
							if not event.interrupted then
								weakpointNewDashEl0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl0, event )
							else
								weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl0Frame4( weakpointNewDashEl0, event )
							return 
						else
							weakpointNewDashEl0:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
							weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl0Frame3( weakpointNewDashEl0, event )
						return 
					else
						weakpointNewDashEl0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl0:setRGB( 1, 0, 0 )
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame3 )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setRGB( 1, 1, 1 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					local weakpointNewDashEl1Frame3 = function ( weakpointNewDashEl1, event )
						local weakpointNewDashEl1Frame4 = function ( weakpointNewDashEl1, event )
							if not event.interrupted then
								weakpointNewDashEl1:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl1:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl1, event )
							else
								weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl1Frame4( weakpointNewDashEl1, event )
							return 
						else
							weakpointNewDashEl1:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Bounce )
							weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl1Frame3( weakpointNewDashEl1, event )
						return 
					else
						weakpointNewDashEl1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl1:setRGB( 1, 0, 0 )
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl1Frame3 )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setRGB( 1, 1, 1 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					local weakpointNewThickPlus0Frame3 = function ( weakpointNewThickPlus0, event )
						local weakpointNewThickPlus0Frame4 = function ( weakpointNewThickPlus0, event )
							if not event.interrupted then
								weakpointNewThickPlus0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewThickPlus0:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewThickPlus0, event )
							else
								weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewThickPlus0Frame4( weakpointNewThickPlus0, event )
							return 
						else
							weakpointNewThickPlus0:beginAnimation( "keyframe", 449, false, false, CoD.TweenType.Bounce )
							weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewThickPlus0Frame3( weakpointNewThickPlus0, event )
						return 
					else
						weakpointNewThickPlus0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						weakpointNewThickPlus0:setRGB( 1, 0, 0 )
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame3 )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setRGB( 1, 1, 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					local weakpointNewDashEl00Frame3 = function ( weakpointNewDashEl00, event )
						local weakpointNewDashEl00Frame4 = function ( weakpointNewDashEl00, event )
							if not event.interrupted then
								weakpointNewDashEl00:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl00:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl00, event )
							else
								weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl00Frame4( weakpointNewDashEl00, event )
							return 
						else
							weakpointNewDashEl00:beginAnimation( "keyframe", 750, false, false, CoD.TweenType.Linear )
							weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl00Frame3( weakpointNewDashEl00, event )
						return 
					else
						weakpointNewDashEl00:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Bounce )
						weakpointNewDashEl00:setRGB( 1, 0, 0 )
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl00Frame3 )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setRGB( 1, 1, 1 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					local weakpointNewDashEl10Frame3 = function ( weakpointNewDashEl10, event )
						local weakpointNewDashEl10Frame4 = function ( weakpointNewDashEl10, event )
							if not event.interrupted then
								weakpointNewDashEl10:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Bounce )
							end
							weakpointNewDashEl10:setRGB( 1, 1, 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl10, event )
							else
								weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl10Frame4( weakpointNewDashEl10, event )
							return 
						else
							weakpointNewDashEl10:beginAnimation( "keyframe", 380, false, false, CoD.TweenType.Bounce )
							weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl10Frame3( weakpointNewDashEl10, event )
						return 
					else
						weakpointNewDashEl10:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl10:setRGB( 1, 0, 0 )
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl10Frame3 )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setRGB( 1, 1, 1 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Repulsed = function ()
				self:setupElementClipCounter( 1 )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					local weakpointNewHex0Frame3 = function ( weakpointNewHex0, event )
						local weakpointNewHex0Frame4 = function ( weakpointNewHex0, event )
							local weakpointNewHex0Frame5 = function ( weakpointNewHex0, event )
								local weakpointNewHex0Frame6 = function ( weakpointNewHex0, event )
									local weakpointNewHex0Frame7 = function ( weakpointNewHex0, event )
										local weakpointNewHex0Frame8 = function ( weakpointNewHex0, event )
											local weakpointNewHex0Frame9 = function ( weakpointNewHex0, event )
												local weakpointNewHex0Frame10 = function ( weakpointNewHex0, event )
													local weakpointNewHex0Frame11 = function ( weakpointNewHex0, event )
														local weakpointNewHex0Frame12 = function ( weakpointNewHex0, event )
															local weakpointNewHex0Frame13 = function ( weakpointNewHex0, event )
																local weakpointNewHex0Frame14 = function ( weakpointNewHex0, event )
																	local weakpointNewHex0Frame15 = function ( weakpointNewHex0, event )
																		local weakpointNewHex0Frame16 = function ( weakpointNewHex0, event )
																			local weakpointNewHex0Frame17 = function ( weakpointNewHex0, event )
																				local weakpointNewHex0Frame18 = function ( weakpointNewHex0, event )
																					local weakpointNewHex0Frame19 = function ( weakpointNewHex0, event )
																						local weakpointNewHex0Frame20 = function ( weakpointNewHex0, event )
																							local weakpointNewHex0Frame21 = function ( weakpointNewHex0, event )
																								local weakpointNewHex0Frame22 = function ( weakpointNewHex0, event )
																									local weakpointNewHex0Frame23 = function ( weakpointNewHex0, event )
																										local weakpointNewHex0Frame24 = function ( weakpointNewHex0, event )
																											local weakpointNewHex0Frame25 = function ( weakpointNewHex0, event )
																												local weakpointNewHex0Frame26 = function ( weakpointNewHex0, event )
																													local weakpointNewHex0Frame27 = function ( weakpointNewHex0, event )
																														local weakpointNewHex0Frame28 = function ( weakpointNewHex0, event )
																															local weakpointNewHex0Frame29 = function ( weakpointNewHex0, event )
																																local weakpointNewHex0Frame30 = function ( weakpointNewHex0, event )
																																	local weakpointNewHex0Frame31 = function ( weakpointNewHex0, event )
																																		local weakpointNewHex0Frame32 = function ( weakpointNewHex0, event )
																																			local weakpointNewHex0Frame33 = function ( weakpointNewHex0, event )
																																				local weakpointNewHex0Frame34 = function ( weakpointNewHex0, event )
																																					local weakpointNewHex0Frame35 = function ( weakpointNewHex0, event )
																																						local weakpointNewHex0Frame36 = function ( weakpointNewHex0, event )
																																							local weakpointNewHex0Frame37 = function ( weakpointNewHex0, event )
																																								local weakpointNewHex0Frame38 = function ( weakpointNewHex0, event )
																																									if not event.interrupted then
																																										weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									end
																																									weakpointNewHex0:setLeftRight( false, false, -236.22, 238.22 )
																																									weakpointNewHex0:setTopBottom( false, false, -215.15, 215.15 )
																																									weakpointNewHex0:setAlpha( 0 )
																																									weakpointNewHex0:setZRot( 0 )
																																									if event.interrupted then
																																										self.clipFinished( weakpointNewHex0, event )
																																									else
																																										weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																									end
																																								end
																																								
																																								if event.interrupted then
																																									weakpointNewHex0Frame38( weakpointNewHex0, event )
																																									return 
																																								else
																																									weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																									weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame38 )
																																								end
																																							end
																																							
																																							if event.interrupted then
																																								weakpointNewHex0Frame37( weakpointNewHex0, event )
																																								return 
																																							else
																																								weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																								weakpointNewHex0:setAlpha( 0.34 )
																																								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame37 )
																																							end
																																						end
																																						
																																						if event.interrupted then
																																							weakpointNewHex0Frame36( weakpointNewHex0, event )
																																							return 
																																						else
																																							weakpointNewHex0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame36 )
																																						end
																																					end
																																					
																																					if event.interrupted then
																																						weakpointNewHex0Frame35( weakpointNewHex0, event )
																																						return 
																																					else
																																						weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																						weakpointNewHex0:setLeftRight( false, false, -236.22, 238.22 )
																																						weakpointNewHex0:setTopBottom( false, false, -215.15, 215.15 )
																																						weakpointNewHex0:setZRot( 0 )
																																						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame35 )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					weakpointNewHex0Frame34( weakpointNewHex0, event )
																																					return 
																																				else
																																					weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																					weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				weakpointNewHex0Frame33( weakpointNewHex0, event )
																																				return 
																																			else
																																				weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																				weakpointNewHex0:setAlpha( 0 )
																																				weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			weakpointNewHex0Frame32( weakpointNewHex0, event )
																																			return 
																																		else
																																			weakpointNewHex0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																			weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		weakpointNewHex0Frame31( weakpointNewHex0, event )
																																		return 
																																	else
																																		weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																		weakpointNewHex0:setAlpha( 0.56 )
																																		weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	weakpointNewHex0Frame30( weakpointNewHex0, event )
																																	return 
																																else
																																	weakpointNewHex0:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
																																	weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame30 )
																																end
																															end
																															
																															if event.interrupted then
																																weakpointNewHex0Frame29( weakpointNewHex0, event )
																																return 
																															else
																																weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																weakpointNewHex0:setAlpha( 0 )
																																weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															weakpointNewHex0Frame28( weakpointNewHex0, event )
																															return 
																														else
																															weakpointNewHex0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																															weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														weakpointNewHex0Frame27( weakpointNewHex0, event )
																														return 
																													else
																														weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														weakpointNewHex0:setAlpha( 1 )
																														weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													weakpointNewHex0Frame26( weakpointNewHex0, event )
																													return 
																												else
																													weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																													weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												weakpointNewHex0Frame25( weakpointNewHex0, event )
																												return 
																											else
																												weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																												weakpointNewHex0:setLeftRight( false, false, -217.75, 219.75 )
																												weakpointNewHex0:setTopBottom( false, false, -198.4, 198.4 )
																												weakpointNewHex0:setZRot( 90 )
																												weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											weakpointNewHex0Frame24( weakpointNewHex0, event )
																											return 
																										else
																											weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																											weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										weakpointNewHex0Frame23( weakpointNewHex0, event )
																										return 
																									else
																										weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																										weakpointNewHex0:setAlpha( 0 )
																										weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									weakpointNewHex0Frame22( weakpointNewHex0, event )
																									return 
																								else
																									weakpointNewHex0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
																									weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								weakpointNewHex0Frame21( weakpointNewHex0, event )
																								return 
																							else
																								weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								weakpointNewHex0:setAlpha( 1 )
																								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							weakpointNewHex0Frame20( weakpointNewHex0, event )
																							return 
																						else
																							weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						weakpointNewHex0Frame19( weakpointNewHex0, event )
																						return 
																					else
																						weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																						weakpointNewHex0:setLeftRight( false, false, -172.2, 174.2 )
																						weakpointNewHex0:setTopBottom( false, false, -157.08, 157.08 )
																						weakpointNewHex0:setZRot( 0 )
																						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					weakpointNewHex0Frame18( weakpointNewHex0, event )
																					return 
																				else
																					weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					weakpointNewHex0:setAlpha( 0 )
																					weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				weakpointNewHex0Frame17( weakpointNewHex0, event )
																				return 
																			else
																				weakpointNewHex0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
																				weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			weakpointNewHex0Frame16( weakpointNewHex0, event )
																			return 
																		else
																			weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			weakpointNewHex0:setAlpha( 1 )
																			weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		weakpointNewHex0Frame15( weakpointNewHex0, event )
																		return 
																	else
																		weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																		weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame15 )
																	end
																end
																
																if event.interrupted then
																	weakpointNewHex0Frame14( weakpointNewHex0, event )
																	return 
																else
																	weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																	weakpointNewHex0:setAlpha( 0.2 )
																	weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame14 )
																end
															end
															
															if event.interrupted then
																weakpointNewHex0Frame13( weakpointNewHex0, event )
																return 
															else
																weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																weakpointNewHex0:setLeftRight( false, false, -145.11, 147.11 )
																weakpointNewHex0:setTopBottom( false, false, -132.52, 132.52 )
																weakpointNewHex0:setZRot( 90 )
																weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame13 )
															end
														end
														
														if event.interrupted then
															weakpointNewHex0Frame12( weakpointNewHex0, event )
															return 
														else
															weakpointNewHex0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
															weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame12 )
														end
													end
													
													if event.interrupted then
														weakpointNewHex0Frame11( weakpointNewHex0, event )
														return 
													else
														weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
														weakpointNewHex0:setAlpha( 1 )
														weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame11 )
													end
												end
												
												if event.interrupted then
													weakpointNewHex0Frame10( weakpointNewHex0, event )
													return 
												else
													weakpointNewHex0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
													weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame10 )
												end
											end
											
											if event.interrupted then
												weakpointNewHex0Frame9( weakpointNewHex0, event )
												return 
											else
												weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												weakpointNewHex0:setAlpha( 0 )
												weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame9 )
											end
										end
										
										if event.interrupted then
											weakpointNewHex0Frame8( weakpointNewHex0, event )
											return 
										else
											weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame8 )
										end
									end
									
									if event.interrupted then
										weakpointNewHex0Frame7( weakpointNewHex0, event )
										return 
									else
										weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										weakpointNewHex0:setAlpha( 0.8 )
										weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame7 )
									end
								end
								
								if event.interrupted then
									weakpointNewHex0Frame6( weakpointNewHex0, event )
									return 
								else
									weakpointNewHex0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame6 )
								end
							end
							
							if event.interrupted then
								weakpointNewHex0Frame5( weakpointNewHex0, event )
								return 
							else
								weakpointNewHex0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								weakpointNewHex0:setAlpha( 0 )
								weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame5 )
							end
						end
						
						if event.interrupted then
							weakpointNewHex0Frame4( weakpointNewHex0, event )
							return 
						else
							weakpointNewHex0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							weakpointNewHex0:setAlpha( 0.5 )
							weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewHex0Frame3( weakpointNewHex0, event )
						return 
					else
						weakpointNewHex0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", weakpointNewHex0Frame3 )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setLeftRight( false, false, -121.72, 123.72 )
				self.weakpointNewHex0:setTopBottom( false, false, -111.3, 111.3 )
				self.weakpointNewHex0:setAlpha( 0 )
				self.weakpointNewHex0:setZRot( 0 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
			end
		},
		Obscured = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.clipFinished( Diagonals, {} )
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewArrowSmallContainer0, {} )
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewCornerContainer0, {} )
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineH0, {} )
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineV0, {} )
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineV1, {} )
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineH1, {} )
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineContainer0, {} )
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedLineContainer1, {} )
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl0, {} )
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				self.clipFinished( weakpointNewDashEl1, {} )
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				self.clipFinished( weakpointNewThickPlus0, {} )
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 1 )
				self.clipFinished( weakpointNewRedArrow0, {} )
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 1 )
				self.clipFinished( weakpointNewRedArrow5, {} )
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint0, {} )
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint1, {} )
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 11.01, 47.01 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0.52 )
				self.clipFinished( weakpointNewDashEl00, {} )
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -46.5, -10.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0.55 )
				self.clipFinished( weakpointNewDashEl10, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					local weakpointNewCornerContainer0Frame3 = function ( weakpointNewCornerContainer0, event )
						if not event.interrupted then
							weakpointNewCornerContainer0:beginAnimation( "keyframe", 970, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewCornerContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewCornerContainer0, event )
						else
							weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewCornerContainer0Frame3( weakpointNewCornerContainer0, event )
						return 
					else
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame3 )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					if not event.interrupted then
						weakpointNewHex0:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewHex0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewHex0, event )
					else
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					if not event.interrupted then
						weakpointNewRedLineH0:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH0, event )
					else
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					local weakpointNewRedLineV0Frame3 = function ( weakpointNewRedLineV0, event )
						if not event.interrupted then
							weakpointNewRedLineV0:beginAnimation( "keyframe", 1449, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV0, event )
						else
							weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV0Frame3( weakpointNewRedLineV0, event )
						return 
					else
						weakpointNewRedLineV0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV0Frame3 )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					local weakpointNewRedLineH1Frame3 = function ( weakpointNewRedLineH1, event )
						if not event.interrupted then
							weakpointNewRedLineH1:beginAnimation( "keyframe", 840, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH1, event )
						else
							weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH1Frame3( weakpointNewRedLineH1, event )
						return 
					else
						weakpointNewRedLineH1:beginAnimation( "keyframe", 1110, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH1Frame3 )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					if not event.interrupted then
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1120, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer0, event )
					else
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1289, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					local weakpointNewDashEl0Frame3 = function ( weakpointNewDashEl0, event )
						if not event.interrupted then
							weakpointNewDashEl0:beginAnimation( "keyframe", 530, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl0, event )
						else
							weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl0Frame3( weakpointNewDashEl0, event )
						return 
					else
						weakpointNewDashEl0:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame3 )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1370, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 1 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow5:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 1 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 1470, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, -8, 28.01 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 11.01, 47.01 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0.52 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 819, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -29.5, 6.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -46.5, -10.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0.55 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 639, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					local weakpointNewCornerContainer0Frame3 = function ( weakpointNewCornerContainer0, event )
						if not event.interrupted then
							weakpointNewCornerContainer0:beginAnimation( "keyframe", 489, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewCornerContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewCornerContainer0, event )
						else
							weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewCornerContainer0Frame3( weakpointNewCornerContainer0, event )
						return 
					else
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame3 )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				local weakpointNewHex0Frame2 = function ( weakpointNewHex0, event )
					if not event.interrupted then
						weakpointNewHex0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewHex0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewHex0, event )
					else
						weakpointNewHex0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				weakpointNewHex0Frame2( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					if not event.interrupted then
						weakpointNewRedLineH0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH0, event )
					else
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					local weakpointNewRedLineV0Frame3 = function ( weakpointNewRedLineV0, event )
						if not event.interrupted then
							weakpointNewRedLineV0:beginAnimation( "keyframe", 629, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV0, event )
						else
							weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV0Frame3( weakpointNewRedLineV0, event )
						return 
					else
						weakpointNewRedLineV0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV0Frame3 )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					if not event.interrupted then
						weakpointNewRedLineH1:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH1, event )
					else
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					if not event.interrupted then
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer0, event )
					else
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					local weakpointNewDashEl0Frame3 = function ( weakpointNewDashEl0, event )
						local weakpointNewDashEl0Frame4 = function ( weakpointNewDashEl0, event )
							if not event.interrupted then
								weakpointNewDashEl0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							end
							weakpointNewDashEl0:setLeftRight( false, true, -12, 24 )
							weakpointNewDashEl0:setTopBottom( false, false, -7, 9 )
							weakpointNewDashEl0:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( weakpointNewDashEl0, event )
							else
								weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							weakpointNewDashEl0Frame4( weakpointNewDashEl0, event )
							return 
						else
							weakpointNewDashEl0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Bounce )
							weakpointNewDashEl0:setAlpha( 1 )
							weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame4 )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl0Frame3( weakpointNewDashEl0, event )
						return 
					else
						weakpointNewDashEl0:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame3 )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setLeftRight( false, true, -12, 24 )
				self.weakpointNewDashEl0:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					if not event.interrupted then
						weakpointNewThickPlus0:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewThickPlus0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewThickPlus0, event )
					else
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 1 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow5:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 1 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					local weakpointNewRedArrowPoint0Frame3 = function ( weakpointNewRedArrowPoint0, event )
						if not event.interrupted then
							weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedArrowPoint0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedArrowPoint0, event )
						else
							weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedArrowPoint0Frame3( weakpointNewRedArrowPoint0, event )
						return 
					else
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedArrowPoint0Frame3 )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				local weakpointNewRedArrowPoint1Frame2 = function ( weakpointNewRedArrowPoint1, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrowPoint1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint1, event )
					else
						weakpointNewRedArrowPoint1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				weakpointNewRedArrowPoint1Frame2( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 81, 117 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 11.01, 47.01 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0.52 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -117, -81 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -46.5, -10.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0.55 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Medium = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					local weakpointNewCornerContainer0Frame3 = function ( weakpointNewCornerContainer0, event )
						if not event.interrupted then
							weakpointNewCornerContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewCornerContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewCornerContainer0, event )
						else
							weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewCornerContainer0Frame3( weakpointNewCornerContainer0, event )
						return 
					else
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame3 )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					if not event.interrupted then
						weakpointNewRedLineH0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH0, event )
					else
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					local weakpointNewRedLineV0Frame3 = function ( weakpointNewRedLineV0, event )
						if not event.interrupted then
							weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV0, event )
						else
							weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV0Frame3( weakpointNewRedLineV0, event )
						return 
					else
						weakpointNewRedLineV0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV0Frame3 )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					local weakpointNewRedLineH1Frame3 = function ( weakpointNewRedLineH1, event )
						if not event.interrupted then
							weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH1, event )
						else
							weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH1Frame3( weakpointNewRedLineH1, event )
						return 
					else
						weakpointNewRedLineH1:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH1Frame3 )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					if not event.interrupted then
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer0, event )
					else
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					local weakpointNewDashEl0Frame3 = function ( weakpointNewDashEl0, event )
						if not event.interrupted then
							weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl0, event )
						else
							weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl0Frame3( weakpointNewDashEl0, event )
						return 
					else
						weakpointNewDashEl0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame3 )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					local weakpointNewThickPlus0Frame3 = function ( weakpointNewThickPlus0, event )
						if not event.interrupted then
							weakpointNewThickPlus0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewThickPlus0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewThickPlus0, event )
						else
							weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewThickPlus0Frame3( weakpointNewThickPlus0, event )
						return 
					else
						weakpointNewThickPlus0:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame3 )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 1 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow5:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 1 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrowPoint0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint0, event )
					else
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 11.01, 47.01 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0.52 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -46.5, -10.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0.55 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end,
			Far = function ()
				self:setupElementClipCounter( 20 )
				local DiagonalsFrame2 = function ( Diagonals, event )
					if not event.interrupted then
						Diagonals:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					Diagonals:setAlpha( 0 )
					Diagonals:setZoom( -50 )
					if event.interrupted then
						self.clipFinished( Diagonals, event )
					else
						Diagonals:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Diagonals:completeAnimation()
				self.Diagonals:setAlpha( 0 )
				self.Diagonals:setZoom( -50 )
				DiagonalsFrame2( Diagonals, {} )
				local weakpointNewArrowSmallContainer0Frame2 = function ( weakpointNewArrowSmallContainer0, event )
					if not event.interrupted then
						weakpointNewArrowSmallContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewArrowSmallContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewArrowSmallContainer0, event )
					else
						weakpointNewArrowSmallContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewArrowSmallContainer0:completeAnimation()
				self.weakpointNewArrowSmallContainer0:setAlpha( 0 )
				weakpointNewArrowSmallContainer0Frame2( weakpointNewArrowSmallContainer0, {} )
				local weakpointNewCornerContainer0Frame2 = function ( weakpointNewCornerContainer0, event )
					local weakpointNewCornerContainer0Frame3 = function ( weakpointNewCornerContainer0, event )
						if not event.interrupted then
							weakpointNewCornerContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewCornerContainer0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewCornerContainer0, event )
						else
							weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewCornerContainer0Frame3( weakpointNewCornerContainer0, event )
						return 
					else
						weakpointNewCornerContainer0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						weakpointNewCornerContainer0:registerEventHandler( "transition_complete_keyframe", weakpointNewCornerContainer0Frame3 )
					end
				end
				
				weakpointNewCornerContainer0:completeAnimation()
				self.weakpointNewCornerContainer0:setAlpha( 0 )
				weakpointNewCornerContainer0Frame2( weakpointNewCornerContainer0, {} )
				local weakpointNewDashContainer0Frame2 = function ( weakpointNewDashContainer0, event )
					if not event.interrupted then
						weakpointNewDashContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashContainer0, event )
					else
						weakpointNewDashContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashContainer0:completeAnimation()
				self.weakpointNewDashContainer0:setAlpha( 0 )
				weakpointNewDashContainer0Frame2( weakpointNewDashContainer0, {} )
				weakpointNewHex0:completeAnimation()
				self.weakpointNewHex0:setAlpha( 0 )
				self.clipFinished( weakpointNewHex0, {} )
				local weakpointNewRedLineH0Frame2 = function ( weakpointNewRedLineH0, event )
					if not event.interrupted then
						weakpointNewRedLineH0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineH0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineH0, event )
					else
						weakpointNewRedLineH0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineH0:completeAnimation()
				self.weakpointNewRedLineH0:setAlpha( 0 )
				weakpointNewRedLineH0Frame2( weakpointNewRedLineH0, {} )
				local weakpointNewRedLineV0Frame2 = function ( weakpointNewRedLineV0, event )
					local weakpointNewRedLineV0Frame3 = function ( weakpointNewRedLineV0, event )
						if not event.interrupted then
							weakpointNewRedLineV0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineV0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineV0, event )
						else
							weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineV0Frame3( weakpointNewRedLineV0, event )
						return 
					else
						weakpointNewRedLineV0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineV0:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineV0Frame3 )
					end
				end
				
				weakpointNewRedLineV0:completeAnimation()
				self.weakpointNewRedLineV0:setAlpha( 0 )
				weakpointNewRedLineV0Frame2( weakpointNewRedLineV0, {} )
				local weakpointNewRedLineV1Frame2 = function ( weakpointNewRedLineV1, event )
					if not event.interrupted then
						weakpointNewRedLineV1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineV1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineV1, event )
					else
						weakpointNewRedLineV1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineV1:completeAnimation()
				self.weakpointNewRedLineV1:setAlpha( 0 )
				weakpointNewRedLineV1Frame2( weakpointNewRedLineV1, {} )
				local weakpointNewRedLineH1Frame2 = function ( weakpointNewRedLineH1, event )
					local weakpointNewRedLineH1Frame3 = function ( weakpointNewRedLineH1, event )
						if not event.interrupted then
							weakpointNewRedLineH1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewRedLineH1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewRedLineH1, event )
						else
							weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewRedLineH1Frame3( weakpointNewRedLineH1, event )
						return 
					else
						weakpointNewRedLineH1:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						weakpointNewRedLineH1:registerEventHandler( "transition_complete_keyframe", weakpointNewRedLineH1Frame3 )
					end
				end
				
				weakpointNewRedLineH1:completeAnimation()
				self.weakpointNewRedLineH1:setAlpha( 0 )
				weakpointNewRedLineH1Frame2( weakpointNewRedLineH1, {} )
				local weakpointNewRedLineContainer0Frame2 = function ( weakpointNewRedLineContainer0, event )
					if not event.interrupted then
						weakpointNewRedLineContainer0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer0, event )
					else
						weakpointNewRedLineContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer0:completeAnimation()
				self.weakpointNewRedLineContainer0:setAlpha( 0 )
				weakpointNewRedLineContainer0Frame2( weakpointNewRedLineContainer0, {} )
				local weakpointNewRedLineContainer1Frame2 = function ( weakpointNewRedLineContainer1, event )
					if not event.interrupted then
						weakpointNewRedLineContainer1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedLineContainer1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedLineContainer1, event )
					else
						weakpointNewRedLineContainer1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedLineContainer1:completeAnimation()
				self.weakpointNewRedLineContainer1:setAlpha( 0 )
				weakpointNewRedLineContainer1Frame2( weakpointNewRedLineContainer1, {} )
				local weakpointNewDashEl0Frame2 = function ( weakpointNewDashEl0, event )
					local weakpointNewDashEl0Frame3 = function ( weakpointNewDashEl0, event )
						if not event.interrupted then
							weakpointNewDashEl0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewDashEl0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( weakpointNewDashEl0, event )
						else
							weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewDashEl0Frame3( weakpointNewDashEl0, event )
						return 
					else
						weakpointNewDashEl0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						weakpointNewDashEl0:registerEventHandler( "transition_complete_keyframe", weakpointNewDashEl0Frame3 )
					end
				end
				
				weakpointNewDashEl0:completeAnimation()
				self.weakpointNewDashEl0:setAlpha( 0 )
				weakpointNewDashEl0Frame2( weakpointNewDashEl0, {} )
				local weakpointNewDashEl1Frame2 = function ( weakpointNewDashEl1, event )
					if not event.interrupted then
						weakpointNewDashEl1:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl1, event )
					else
						weakpointNewDashEl1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl1:completeAnimation()
				self.weakpointNewDashEl1:setAlpha( 0 )
				weakpointNewDashEl1Frame2( weakpointNewDashEl1, {} )
				local weakpointNewThickPlus0Frame2 = function ( weakpointNewThickPlus0, event )
					local weakpointNewThickPlus0Frame3 = function ( weakpointNewThickPlus0, event )
						if not event.interrupted then
							weakpointNewThickPlus0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
						end
						weakpointNewThickPlus0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( weakpointNewThickPlus0, event )
						else
							weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						weakpointNewThickPlus0Frame3( weakpointNewThickPlus0, event )
						return 
					else
						weakpointNewThickPlus0:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						weakpointNewThickPlus0:registerEventHandler( "transition_complete_keyframe", weakpointNewThickPlus0Frame3 )
					end
				end
				
				weakpointNewThickPlus0:completeAnimation()
				self.weakpointNewThickPlus0:setAlpha( 1 )
				weakpointNewThickPlus0Frame2( weakpointNewThickPlus0, {} )
				local weakpointNewRedArrow0Frame2 = function ( weakpointNewRedArrow0, event )
					if not event.interrupted then
						weakpointNewRedArrow0:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow0, event )
					else
						weakpointNewRedArrow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow0:completeAnimation()
				self.weakpointNewRedArrow0:setAlpha( 1 )
				weakpointNewRedArrow0Frame2( weakpointNewRedArrow0, {} )
				local weakpointNewRedArrow5Frame2 = function ( weakpointNewRedArrow5, event )
					if not event.interrupted then
						weakpointNewRedArrow5:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewRedArrow5:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrow5, event )
					else
						weakpointNewRedArrow5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrow5:completeAnimation()
				self.weakpointNewRedArrow5:setAlpha( 1 )
				weakpointNewRedArrow5Frame2( weakpointNewRedArrow5, {} )
				local weakpointNewRedArrowPoint0Frame2 = function ( weakpointNewRedArrowPoint0, event )
					if not event.interrupted then
						weakpointNewRedArrowPoint0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
					end
					weakpointNewRedArrowPoint0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( weakpointNewRedArrowPoint0, event )
					else
						weakpointNewRedArrowPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewRedArrowPoint0:completeAnimation()
				self.weakpointNewRedArrowPoint0:setAlpha( 0 )
				weakpointNewRedArrowPoint0Frame2( weakpointNewRedArrowPoint0, {} )
				weakpointNewRedArrowPoint1:completeAnimation()
				self.weakpointNewRedArrowPoint1:setAlpha( 0 )
				self.clipFinished( weakpointNewRedArrowPoint1, {} )
				local weakpointNewDashEl00Frame2 = function ( weakpointNewDashEl00, event )
					if not event.interrupted then
						weakpointNewDashEl00:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl00:setLeftRight( false, false, 14, 50 )
					weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl00:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl00, event )
					else
						weakpointNewDashEl00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl00:completeAnimation()
				self.weakpointNewDashEl00:setLeftRight( false, false, 11.01, 47.01 )
				self.weakpointNewDashEl00:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl00:setAlpha( 0.52 )
				weakpointNewDashEl00Frame2( weakpointNewDashEl00, {} )
				local weakpointNewDashEl10Frame2 = function ( weakpointNewDashEl10, event )
					if not event.interrupted then
						weakpointNewDashEl10:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Bounce )
					end
					weakpointNewDashEl10:setLeftRight( false, false, -47.5, -11.5 )
					weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
					weakpointNewDashEl10:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weakpointNewDashEl10, event )
					else
						weakpointNewDashEl10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weakpointNewDashEl10:completeAnimation()
				self.weakpointNewDashEl10:setLeftRight( false, false, -46.5, -10.5 )
				self.weakpointNewDashEl10:setTopBottom( false, false, -7, 9 )
				self.weakpointNewDashEl10:setAlpha( 0.55 )
				weakpointNewDashEl10Frame2( weakpointNewDashEl10, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Close",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_CLOSE )
			end
		},
		{
			stateName = "Medium",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_MEDIUM )
			end
		},
		{
			stateName = "Far",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_FAR )
			end
		},
		{
			stateName = "Obscured",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_OBSCURED )
			end
		}
	} )
	self:linkToElementModel( self, "status", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Diagonals:close()
		element.weakpointNewArrowSmallContainer0:close()
		element.weakpointNewCornerContainer0:close()
		element.weakpointNewDashContainer0:close()
		element.weakpointNewHex0:close()
		element.weakpointNewRedLineH0:close()
		element.weakpointNewRedLineV0:close()
		element.weakpointNewRedLineV1:close()
		element.weakpointNewRedLineH1:close()
		element.weakpointNewRedLineContainer0:close()
		element.weakpointNewRedLineContainer1:close()
		element.weakpointNewDashEl0:close()
		element.weakpointNewDashEl1:close()
		element.weakpointNewThickPlus0:close()
		element.weakpointNewRedArrow0:close()
		element.weakpointNewRedArrow5:close()
		element.weakpointNewRedArrowPoint0:close()
		element.weakpointNewRedArrowPoint1:close()
		element.weakpointNewDashEl00:close()
		element.weakpointNewDashEl10:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

