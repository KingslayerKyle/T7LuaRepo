require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_missile_container" )
require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_damage_bottom" )
require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_damage_top" )
require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vuhd_siegebot_lockedWidget" )
require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_EMPwidget" )

CoD.vhud_siegebot_reticle = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_reticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_siegebot_reticle )
	self.id = "vhud_siegebot_reticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local agrCenterPoint = LUI.UIImage.new()
	agrCenterPoint:setLeftRight( false, false, -9, 7 )
	agrCenterPoint:setTopBottom( false, false, -8, 8 )
	agrCenterPoint:setRGB( 1, 0.83, 0.39 )
	agrCenterPoint:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_centerpoint" ) )
	agrCenterPoint:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrCenterPoint )
	self.agrCenterPoint = agrCenterPoint
	
	local agrCenterPoint0 = LUI.UIImage.new()
	agrCenterPoint0:setLeftRight( false, false, -9, 7 )
	agrCenterPoint0:setTopBottom( false, false, -8, 8 )
	agrCenterPoint0:setRGB( 1, 0.83, 0.39 )
	agrCenterPoint0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_centerpoint" ) )
	agrCenterPoint0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrCenterPoint0 )
	self.agrCenterPoint0 = agrCenterPoint0
	
	local vhudsiegebotmissilecontainer = CoD.vhud_siegebot_missile_container.new( menu, controller )
	vhudsiegebotmissilecontainer:setLeftRight( true, false, 1142, 1228 )
	vhudsiegebotmissilecontainer:setTopBottom( true, false, 412, 567 )
	vhudsiegebotmissilecontainer:setRGB( 0.8, 0.99, 1 )
	vhudsiegebotmissilecontainer:linkToElementModel( self, nil, false, function ( model )
		vhudsiegebotmissilecontainer:setModel( model, controller )
	end )
	self:addElement( vhudsiegebotmissilecontainer )
	self.vhudsiegebotmissilecontainer = vhudsiegebotmissilecontainer
	
	local BackingDamage = LUI.UIImage.new()
	BackingDamage:setLeftRight( true, false, 1132, 1238 )
	BackingDamage:setTopBottom( true, false, 578, 684 )
	BackingDamage:setRGB( 0.13, 0.16, 0.17 )
	BackingDamage:setAlpha( 0.4 )
	BackingDamage:setYRot( -40 )
	BackingDamage:setScale( 1.3 )
	BackingDamage:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_circlebacking" ) )
	self:addElement( BackingDamage )
	self.BackingDamage = BackingDamage
	
	local CenterDOT = LUI.UIImage.new()
	CenterDOT:setLeftRight( false, false, -7, 5 )
	CenterDOT:setTopBottom( false, false, -6, 6 )
	CenterDOT:setScale( 0.6 )
	CenterDOT:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_centerdot" ) )
	CenterDOT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterDOT )
	self.CenterDOT = CenterDOT
	
	local HairlineTop = LUI.UIImage.new()
	HairlineTop:setLeftRight( false, false, -13, 11 )
	HairlineTop:setTopBottom( false, false, -32.5, -20.5 )
	HairlineTop:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_hairlinetop" ) )
	HairlineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HairlineTop )
	self.HairlineTop = HairlineTop
	
	local HairlineRight = LUI.UIImage.new()
	HairlineRight:setLeftRight( false, false, 15, 27 )
	HairlineRight:setTopBottom( false, false, 15.5, 27.5 )
	HairlineRight:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_hairlineside" ) )
	HairlineRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HairlineRight )
	self.HairlineRight = HairlineRight
	
	local HairlineLeft = LUI.UIImage.new()
	HairlineLeft:setLeftRight( false, false, -28, -16 )
	HairlineLeft:setTopBottom( false, false, 15.5, 27.5 )
	HairlineLeft:setYRot( 180 )
	HairlineLeft:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_hairlineside" ) )
	HairlineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HairlineLeft )
	self.HairlineLeft = HairlineLeft
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -13, 11 )
	Image0:setTopBottom( false, false, -81.45, -74.45 )
	Image0:setAlpha( 0.8 )
	Image0:setZRot( 90 )
	Image0:setScale( 0.9 )
	Image0:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linetop" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, false, -12, 12 )
	Image1:setTopBottom( false, false, 67.1, 74.1 )
	Image1:setAlpha( 0.8 )
	Image1:setZRot( 90 )
	Image1:setScale( 0.9 )
	Image1:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linetop" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, 67.5, 151.5 )
	Image2:setTopBottom( false, false, -6.45, 5.55 )
	Image2:setAlpha( 0.6 )
	Image2:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, false, -147.75, -63.75 )
	Image3:setTopBottom( false, false, -6.45, 5.55 )
	Image3:setAlpha( 0.6 )
	Image3:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, false, 168.5, 192.5 )
	Image4:setTopBottom( false, false, -6.45, 5.55 )
	Image4:setAlpha( 0.8 )
	Image4:setZRot( 90 )
	Image4:setScale( 0.9 )
	Image4:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_lineright" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( false, false, 206.5, 230.5 )
	Image5:setTopBottom( false, false, -6.45, 5.55 )
	Image5:setAlpha( 0.8 )
	Image5:setZRot( 90 )
	Image5:setScale( 0.9 )
	Image5:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_lineright" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( false, false, -224.75, -200.75 )
	Image6:setTopBottom( false, false, -6.45, 5.55 )
	Image6:setAlpha( 0.8 )
	Image6:setZRot( 90 )
	Image6:setScale( 0.9 )
	Image6:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_lineright" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( false, false, -187.75, -163.75 )
	Image7:setTopBottom( false, false, -6.45, 5.55 )
	Image7:setAlpha( 0.8 )
	Image7:setZRot( 90 )
	Image7:setScale( 0.9 )
	Image7:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_lineright" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local BottomBacking = LUI.UIImage.new()
	BottomBacking:setLeftRight( true, false, 1132, 1238 )
	BottomBacking:setTopBottom( true, false, 578, 684 )
	BottomBacking:setRGB( 0.13, 0.16, 0.17 )
	BottomBacking:setAlpha( 0.4 )
	BottomBacking:setYRot( -40 )
	BottomBacking:setScale( 1.3 )
	BottomBacking:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_iconbottombacking" ) )
	BottomBacking:linkToElementModel( self, "relativeYaw", true, function ( model )
		local relativeYaw = Engine.GetModelValue( model )
		if relativeYaw then
			BottomBacking:setZRot( Multiple( -360, relativeYaw ) )
		end
	end )
	self:addElement( BottomBacking )
	self.BottomBacking = BottomBacking
	
	local vhudsiegebotdamagebottom = CoD.vhud_siegebot_damage_bottom.new( menu, controller )
	vhudsiegebotdamagebottom:setLeftRight( true, false, 1132, 1238 )
	vhudsiegebotdamagebottom:setTopBottom( true, false, 578, 684 )
	vhudsiegebotdamagebottom:setRGB( 0.8, 0.99, 1 )
	vhudsiegebotdamagebottom:setYRot( -40 )
	vhudsiegebotdamagebottom:setScale( 1.3 )
	vhudsiegebotdamagebottom:linkToElementModel( self, "relativeYaw", true, function ( model )
		local relativeYaw = Engine.GetModelValue( model )
		if relativeYaw then
			vhudsiegebotdamagebottom:setZRot( Multiple( -360, relativeYaw ) )
		end
	end )
	vhudsiegebotdamagebottom:linkToElementModel( self, nil, false, function ( model )
		vhudsiegebotdamagebottom:setModel( model, controller )
	end )
	self:addElement( vhudsiegebotdamagebottom )
	self.vhudsiegebotdamagebottom = vhudsiegebotdamagebottom
	
	local TopBacking = LUI.UIImage.new()
	TopBacking:setLeftRight( true, false, 1132, 1238 )
	TopBacking:setTopBottom( true, false, 578, 684 )
	TopBacking:setRGB( 0.13, 0.16, 0.17 )
	TopBacking:setAlpha( 0.8 )
	TopBacking:setYRot( -40 )
	TopBacking:setScale( 1.3 )
	TopBacking:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_icontopbacking" ) )
	self:addElement( TopBacking )
	self.TopBacking = TopBacking
	
	local vhudsiegebotdamagetop = CoD.vhud_siegebot_damage_top.new( menu, controller )
	vhudsiegebotdamagetop:setLeftRight( true, false, 1132, 1238 )
	vhudsiegebotdamagetop:setTopBottom( true, false, 578, 684 )
	vhudsiegebotdamagetop:setRGB( 0.8, 0.99, 1 )
	vhudsiegebotdamagetop:setYRot( -40 )
	vhudsiegebotdamagetop:setScale( 1.3 )
	vhudsiegebotdamagetop:linkToElementModel( self, nil, false, function ( model )
		vhudsiegebotdamagetop:setModel( model, controller )
	end )
	self:addElement( vhudsiegebotdamagetop )
	self.vhudsiegebotdamagetop = vhudsiegebotdamagetop
	
	local vuhdsiegebotlockedWidget = CoD.vuhd_siegebot_lockedWidget.new( menu, controller )
	vuhdsiegebotlockedWidget:setLeftRight( true, false, 606.5, 673.5 )
	vuhdsiegebotlockedWidget:setTopBottom( true, false, 474, 538 )
	self:addElement( vuhdsiegebotlockedWidget )
	self.vuhdsiegebotlockedWidget = vuhdsiegebotlockedWidget
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( false, false, 49.5, 151.5 )
	Image20:setTopBottom( false, false, -2, 1 )
	Image20:setAlpha( 0.4 )
	Image20:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( false, false, -146.75, -44.75 )
	Image8:setTopBottom( false, false, -2, 1 )
	Image8:setAlpha( 0.4 )
	Image8:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_linesidelarge" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	local vhudsiegebotEMPwidget = CoD.vhud_siegebot_EMPwidget.new( menu, controller )
	vhudsiegebotEMPwidget:setLeftRight( true, false, 1113, 1257 )
	vhudsiegebotEMPwidget:setTopBottom( true, false, 427, 707 )
	self:addElement( vhudsiegebotEMPwidget )
	self.vhudsiegebotEMPwidget = vhudsiegebotEMPwidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartUp = function ()
				self:setupElementClipCounter( 22 )
				local agrCenterPointFrame2 = function ( agrCenterPoint, event )
					if not event.interrupted then
						agrCenterPoint:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					agrCenterPoint:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( agrCenterPoint, event )
					else
						agrCenterPoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrCenterPoint:completeAnimation()
				self.agrCenterPoint:setAlpha( 0 )
				agrCenterPointFrame2( agrCenterPoint, {} )
				local agrCenterPoint0Frame2 = function ( agrCenterPoint0, event )
					if not event.interrupted then
						agrCenterPoint0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					agrCenterPoint0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( agrCenterPoint0, event )
					else
						agrCenterPoint0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				agrCenterPoint0:completeAnimation()
				self.agrCenterPoint0:setAlpha( 0 )
				agrCenterPoint0Frame2( agrCenterPoint0, {} )
				local vhudsiegebotmissilecontainerFrame2 = function ( vhudsiegebotmissilecontainer, event )
					local vhudsiegebotmissilecontainerFrame3 = function ( vhudsiegebotmissilecontainer, event )
						local vhudsiegebotmissilecontainerFrame4 = function ( vhudsiegebotmissilecontainer, event )
							local vhudsiegebotmissilecontainerFrame5 = function ( vhudsiegebotmissilecontainer, event )
								if not event.interrupted then
									vhudsiegebotmissilecontainer:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								end
								vhudsiegebotmissilecontainer:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudsiegebotmissilecontainer, event )
								else
									vhudsiegebotmissilecontainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudsiegebotmissilecontainerFrame5( vhudsiegebotmissilecontainer, event )
								return 
							else
								vhudsiegebotmissilecontainer:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								vhudsiegebotmissilecontainer:setAlpha( 0.37 )
								vhudsiegebotmissilecontainer:registerEventHandler( "transition_complete_keyframe", vhudsiegebotmissilecontainerFrame5 )
							end
						end
						
						if event.interrupted then
							vhudsiegebotmissilecontainerFrame4( vhudsiegebotmissilecontainer, event )
							return 
						else
							vhudsiegebotmissilecontainer:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
							vhudsiegebotmissilecontainer:setAlpha( 1 )
							vhudsiegebotmissilecontainer:registerEventHandler( "transition_complete_keyframe", vhudsiegebotmissilecontainerFrame4 )
						end
					end
					
					if event.interrupted then
						vhudsiegebotmissilecontainerFrame3( vhudsiegebotmissilecontainer, event )
						return 
					else
						vhudsiegebotmissilecontainer:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
						vhudsiegebotmissilecontainer:registerEventHandler( "transition_complete_keyframe", vhudsiegebotmissilecontainerFrame3 )
					end
				end
				
				vhudsiegebotmissilecontainer:completeAnimation()
				self.vhudsiegebotmissilecontainer:setAlpha( 0 )
				vhudsiegebotmissilecontainerFrame2( vhudsiegebotmissilecontainer, {} )
				local BackingDamageFrame2 = function ( BackingDamage, event )
					local BackingDamageFrame3 = function ( BackingDamage, event )
						local BackingDamageFrame4 = function ( BackingDamage, event )
							local BackingDamageFrame5 = function ( BackingDamage, event )
								if not event.interrupted then
									BackingDamage:beginAnimation( "keyframe", 39, true, false, CoD.TweenType.Back )
								end
								BackingDamage:setAlpha( 0.3 )
								if event.interrupted then
									self.clipFinished( BackingDamage, event )
								else
									BackingDamage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BackingDamageFrame5( BackingDamage, event )
								return 
							else
								BackingDamage:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								BackingDamage:setAlpha( 0.11 )
								BackingDamage:registerEventHandler( "transition_complete_keyframe", BackingDamageFrame5 )
							end
						end
						
						if event.interrupted then
							BackingDamageFrame4( BackingDamage, event )
							return 
						else
							BackingDamage:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							BackingDamage:setAlpha( 0.26 )
							BackingDamage:registerEventHandler( "transition_complete_keyframe", BackingDamageFrame4 )
						end
					end
					
					if event.interrupted then
						BackingDamageFrame3( BackingDamage, event )
						return 
					else
						BackingDamage:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						BackingDamage:registerEventHandler( "transition_complete_keyframe", BackingDamageFrame3 )
					end
				end
				
				BackingDamage:completeAnimation()
				self.BackingDamage:setAlpha( 0 )
				BackingDamageFrame2( BackingDamage, {} )
				local CenterDOTFrame2 = function ( CenterDOT, event )
					local CenterDOTFrame3 = function ( CenterDOT, event )
						if not event.interrupted then
							CenterDOT:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						end
						CenterDOT:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CenterDOT, event )
						else
							CenterDOT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CenterDOTFrame3( CenterDOT, event )
						return 
					else
						CenterDOT:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						CenterDOT:registerEventHandler( "transition_complete_keyframe", CenterDOTFrame3 )
					end
				end
				
				CenterDOT:completeAnimation()
				self.CenterDOT:setAlpha( 0 )
				CenterDOTFrame2( CenterDOT, {} )
				local HairlineTopFrame2 = function ( HairlineTop, event )
					local HairlineTopFrame3 = function ( HairlineTop, event )
						local HairlineTopFrame4 = function ( HairlineTop, event )
							if not event.interrupted then
								HairlineTop:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							HairlineTop:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( HairlineTop, event )
							else
								HairlineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HairlineTopFrame4( HairlineTop, event )
							return 
						else
							HairlineTop:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							HairlineTop:setAlpha( 0 )
							HairlineTop:registerEventHandler( "transition_complete_keyframe", HairlineTopFrame4 )
						end
					end
					
					if event.interrupted then
						HairlineTopFrame3( HairlineTop, event )
						return 
					else
						HairlineTop:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						HairlineTop:setAlpha( 1 )
						HairlineTop:registerEventHandler( "transition_complete_keyframe", HairlineTopFrame3 )
					end
				end
				
				HairlineTop:completeAnimation()
				self.HairlineTop:setAlpha( 0 )
				HairlineTopFrame2( HairlineTop, {} )
				local HairlineRightFrame2 = function ( HairlineRight, event )
					local HairlineRightFrame3 = function ( HairlineRight, event )
						local HairlineRightFrame4 = function ( HairlineRight, event )
							if not event.interrupted then
								HairlineRight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							HairlineRight:setLeftRight( false, false, 15, 27 )
							HairlineRight:setTopBottom( false, false, 15.5, 27.5 )
							HairlineRight:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( HairlineRight, event )
							else
								HairlineRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HairlineRightFrame4( HairlineRight, event )
							return 
						else
							HairlineRight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							HairlineRight:setAlpha( 0 )
							HairlineRight:registerEventHandler( "transition_complete_keyframe", HairlineRightFrame4 )
						end
					end
					
					if event.interrupted then
						HairlineRightFrame3( HairlineRight, event )
						return 
					else
						HairlineRight:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						HairlineRight:setAlpha( 1 )
						HairlineRight:registerEventHandler( "transition_complete_keyframe", HairlineRightFrame3 )
					end
				end
				
				HairlineRight:completeAnimation()
				self.HairlineRight:setLeftRight( false, false, 15, 27 )
				self.HairlineRight:setTopBottom( false, false, 15.5, 27.5 )
				self.HairlineRight:setAlpha( 0 )
				HairlineRightFrame2( HairlineRight, {} )
				local HairlineLeftFrame2 = function ( HairlineLeft, event )
					local HairlineLeftFrame3 = function ( HairlineLeft, event )
						local HairlineLeftFrame4 = function ( HairlineLeft, event )
							if not event.interrupted then
								HairlineLeft:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							HairlineLeft:setLeftRight( false, false, -28, -17 )
							HairlineLeft:setTopBottom( false, false, 15.5, 27.5 )
							HairlineLeft:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( HairlineLeft, event )
							else
								HairlineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							HairlineLeftFrame4( HairlineLeft, event )
							return 
						else
							HairlineLeft:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							HairlineLeft:setLeftRight( false, false, -28, -16.9 )
							HairlineLeft:setAlpha( 0 )
							HairlineLeft:registerEventHandler( "transition_complete_keyframe", HairlineLeftFrame4 )
						end
					end
					
					if event.interrupted then
						HairlineLeftFrame3( HairlineLeft, event )
						return 
					else
						HairlineLeft:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						HairlineLeft:setLeftRight( false, false, -28, -16.8 )
						HairlineLeft:setAlpha( 1 )
						HairlineLeft:registerEventHandler( "transition_complete_keyframe", HairlineLeftFrame3 )
					end
				end
				
				HairlineLeft:completeAnimation()
				self.HairlineLeft:setLeftRight( false, false, -28, -16 )
				self.HairlineLeft:setTopBottom( false, false, 15.5, 27.5 )
				self.HairlineLeft:setAlpha( 0 )
				HairlineLeftFrame2( HairlineLeft, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						Image0:setAlpha( 0.8 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						Image1:setAlpha( 0.8 )
						if event.interrupted then
							self.clipFinished( Image1, event )
						else
							Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						if not event.interrupted then
							Image2:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						Image2:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Image2, event )
						else
							Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					local Image3Frame3 = function ( Image3, event )
						if not event.interrupted then
							Image3:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						Image3:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( Image3, event )
						else
							Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame3 )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				Image3Frame2( Image3, {} )
				local Image4Frame2 = function ( Image4, event )
					local Image4Frame3 = function ( Image4, event )
						local Image4Frame4 = function ( Image4, event )
							local Image4Frame5 = function ( Image4, event )
								if not event.interrupted then
									Image4:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								Image4:setAlpha( 0.8 )
								if event.interrupted then
									self.clipFinished( Image4, event )
								else
									Image4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image4Frame5( Image4, event )
								return 
							else
								Image4:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Image4:setAlpha( 0.5 )
								Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame5 )
							end
						end
						
						if event.interrupted then
							Image4Frame4( Image4, event )
							return 
						else
							Image4:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Image4:setAlpha( 1 )
							Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame4 )
						end
					end
					
					if event.interrupted then
						Image4Frame3( Image4, event )
						return 
					else
						Image4:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
						Image4:registerEventHandler( "transition_complete_keyframe", Image4Frame3 )
					end
				end
				
				Image4:completeAnimation()
				self.Image4:setAlpha( 0 )
				Image4Frame2( Image4, {} )
				local Image5Frame2 = function ( Image5, event )
					local Image5Frame3 = function ( Image5, event )
						local Image5Frame4 = function ( Image5, event )
							local Image5Frame5 = function ( Image5, event )
								if not event.interrupted then
									Image5:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								Image5:setAlpha( 0.8 )
								if event.interrupted then
									self.clipFinished( Image5, event )
								else
									Image5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image5Frame5( Image5, event )
								return 
							else
								Image5:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Image5:setAlpha( 0.5 )
								Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame5 )
							end
						end
						
						if event.interrupted then
							Image5Frame4( Image5, event )
							return 
						else
							Image5:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Image5:setAlpha( 1 )
							Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame4 )
						end
					end
					
					if event.interrupted then
						Image5Frame3( Image5, event )
						return 
					else
						Image5:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
						Image5:registerEventHandler( "transition_complete_keyframe", Image5Frame3 )
					end
				end
				
				Image5:completeAnimation()
				self.Image5:setAlpha( 0 )
				Image5Frame2( Image5, {} )
				local Image6Frame2 = function ( Image6, event )
					local Image6Frame3 = function ( Image6, event )
						local Image6Frame4 = function ( Image6, event )
							local Image6Frame5 = function ( Image6, event )
								if not event.interrupted then
									Image6:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								Image6:setAlpha( 0.8 )
								if event.interrupted then
									self.clipFinished( Image6, event )
								else
									Image6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image6Frame5( Image6, event )
								return 
							else
								Image6:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Image6:setAlpha( 0.5 )
								Image6:registerEventHandler( "transition_complete_keyframe", Image6Frame5 )
							end
						end
						
						if event.interrupted then
							Image6Frame4( Image6, event )
							return 
						else
							Image6:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Image6:setAlpha( 1 )
							Image6:registerEventHandler( "transition_complete_keyframe", Image6Frame4 )
						end
					end
					
					if event.interrupted then
						Image6Frame3( Image6, event )
						return 
					else
						Image6:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
						Image6:registerEventHandler( "transition_complete_keyframe", Image6Frame3 )
					end
				end
				
				Image6:completeAnimation()
				self.Image6:setAlpha( 0 )
				Image6Frame2( Image6, {} )
				local Image7Frame2 = function ( Image7, event )
					local Image7Frame3 = function ( Image7, event )
						local Image7Frame4 = function ( Image7, event )
							local Image7Frame5 = function ( Image7, event )
								if not event.interrupted then
									Image7:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								Image7:setAlpha( 0.8 )
								if event.interrupted then
									self.clipFinished( Image7, event )
								else
									Image7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image7Frame5( Image7, event )
								return 
							else
								Image7:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Image7:setAlpha( 0.5 )
								Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame5 )
							end
						end
						
						if event.interrupted then
							Image7Frame4( Image7, event )
							return 
						else
							Image7:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							Image7:setAlpha( 1 )
							Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame4 )
						end
					end
					
					if event.interrupted then
						Image7Frame3( Image7, event )
						return 
					else
						Image7:beginAnimation( "keyframe", 670, false, false, CoD.TweenType.Linear )
						Image7:registerEventHandler( "transition_complete_keyframe", Image7Frame3 )
					end
				end
				
				Image7:completeAnimation()
				self.Image7:setAlpha( 0 )
				Image7Frame2( Image7, {} )
				local BottomBackingFrame2 = function ( BottomBacking, event )
					local BottomBackingFrame3 = function ( BottomBacking, event )
						local BottomBackingFrame4 = function ( BottomBacking, event )
							local BottomBackingFrame5 = function ( BottomBacking, event )
								if not event.interrupted then
									BottomBacking:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								end
								BottomBacking:setAlpha( 0.4 )
								if event.interrupted then
									self.clipFinished( BottomBacking, event )
								else
									BottomBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								BottomBackingFrame5( BottomBacking, event )
								return 
							else
								BottomBacking:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								BottomBacking:setAlpha( 0.04 )
								BottomBacking:registerEventHandler( "transition_complete_keyframe", BottomBackingFrame5 )
							end
						end
						
						if event.interrupted then
							BottomBackingFrame4( BottomBacking, event )
							return 
						else
							BottomBacking:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							BottomBacking:setAlpha( 0.34 )
							BottomBacking:registerEventHandler( "transition_complete_keyframe", BottomBackingFrame4 )
						end
					end
					
					if event.interrupted then
						BottomBackingFrame3( BottomBacking, event )
						return 
					else
						BottomBacking:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						BottomBacking:registerEventHandler( "transition_complete_keyframe", BottomBackingFrame3 )
					end
				end
				
				BottomBacking:completeAnimation()
				self.BottomBacking:setAlpha( 0 )
				BottomBackingFrame2( BottomBacking, {} )
				local vhudsiegebotdamagebottomFrame2 = function ( vhudsiegebotdamagebottom, event )
					local vhudsiegebotdamagebottomFrame3 = function ( vhudsiegebotdamagebottom, event )
						local vhudsiegebotdamagebottomFrame4 = function ( vhudsiegebotdamagebottom, event )
							local vhudsiegebotdamagebottomFrame5 = function ( vhudsiegebotdamagebottom, event )
								if not event.interrupted then
									vhudsiegebotdamagebottom:beginAnimation( "keyframe", 39, true, false, CoD.TweenType.Back )
								end
								vhudsiegebotdamagebottom:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudsiegebotdamagebottom, event )
								else
									vhudsiegebotdamagebottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudsiegebotdamagebottomFrame5( vhudsiegebotdamagebottom, event )
								return 
							else
								vhudsiegebotdamagebottom:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								vhudsiegebotdamagebottom:setAlpha( 0.13 )
								vhudsiegebotdamagebottom:registerEventHandler( "transition_complete_keyframe", vhudsiegebotdamagebottomFrame5 )
							end
						end
						
						if event.interrupted then
							vhudsiegebotdamagebottomFrame4( vhudsiegebotdamagebottom, event )
							return 
						else
							vhudsiegebotdamagebottom:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							vhudsiegebotdamagebottom:setAlpha( 0.86 )
							vhudsiegebotdamagebottom:registerEventHandler( "transition_complete_keyframe", vhudsiegebotdamagebottomFrame4 )
						end
					end
					
					if event.interrupted then
						vhudsiegebotdamagebottomFrame3( vhudsiegebotdamagebottom, event )
						return 
					else
						vhudsiegebotdamagebottom:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						vhudsiegebotdamagebottom:registerEventHandler( "transition_complete_keyframe", vhudsiegebotdamagebottomFrame3 )
					end
				end
				
				vhudsiegebotdamagebottom:completeAnimation()
				self.vhudsiegebotdamagebottom:setAlpha( 0 )
				vhudsiegebotdamagebottomFrame2( vhudsiegebotdamagebottom, {} )
				local TopBackingFrame2 = function ( TopBacking, event )
					local TopBackingFrame3 = function ( TopBacking, event )
						local TopBackingFrame4 = function ( TopBacking, event )
							local TopBackingFrame5 = function ( TopBacking, event )
								if not event.interrupted then
									TopBacking:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								end
								TopBacking:setAlpha( 0.8 )
								if event.interrupted then
									self.clipFinished( TopBacking, event )
								else
									TopBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								TopBackingFrame5( TopBacking, event )
								return 
							else
								TopBacking:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								TopBacking:setAlpha( 0 )
								TopBacking:registerEventHandler( "transition_complete_keyframe", TopBackingFrame5 )
							end
						end
						
						if event.interrupted then
							TopBackingFrame4( TopBacking, event )
							return 
						else
							TopBacking:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							TopBacking:setAlpha( 0.5 )
							TopBacking:registerEventHandler( "transition_complete_keyframe", TopBackingFrame4 )
						end
					end
					
					if event.interrupted then
						TopBackingFrame3( TopBacking, event )
						return 
					else
						TopBacking:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						TopBacking:registerEventHandler( "transition_complete_keyframe", TopBackingFrame3 )
					end
				end
				
				TopBacking:completeAnimation()
				self.TopBacking:setAlpha( 0 )
				TopBackingFrame2( TopBacking, {} )
				local vhudsiegebotdamagetopFrame2 = function ( vhudsiegebotdamagetop, event )
					local vhudsiegebotdamagetopFrame3 = function ( vhudsiegebotdamagetop, event )
						local vhudsiegebotdamagetopFrame4 = function ( vhudsiegebotdamagetop, event )
							local vhudsiegebotdamagetopFrame5 = function ( vhudsiegebotdamagetop, event )
								if not event.interrupted then
									vhudsiegebotdamagetop:beginAnimation( "keyframe", 39, true, false, CoD.TweenType.Back )
								end
								vhudsiegebotdamagetop:setAlpha( 1 )
								if event.interrupted then
									self.clipFinished( vhudsiegebotdamagetop, event )
								else
									vhudsiegebotdamagetop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								vhudsiegebotdamagetopFrame5( vhudsiegebotdamagetop, event )
								return 
							else
								vhudsiegebotdamagetop:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								vhudsiegebotdamagetop:setAlpha( 0.16 )
								vhudsiegebotdamagetop:registerEventHandler( "transition_complete_keyframe", vhudsiegebotdamagetopFrame5 )
							end
						end
						
						if event.interrupted then
							vhudsiegebotdamagetopFrame4( vhudsiegebotdamagetop, event )
							return 
						else
							vhudsiegebotdamagetop:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							vhudsiegebotdamagetop:setAlpha( 0.86 )
							vhudsiegebotdamagetop:registerEventHandler( "transition_complete_keyframe", vhudsiegebotdamagetopFrame4 )
						end
					end
					
					if event.interrupted then
						vhudsiegebotdamagetopFrame3( vhudsiegebotdamagetop, event )
						return 
					else
						vhudsiegebotdamagetop:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						vhudsiegebotdamagetop:registerEventHandler( "transition_complete_keyframe", vhudsiegebotdamagetopFrame3 )
					end
				end
				
				vhudsiegebotdamagetop:completeAnimation()
				self.vhudsiegebotdamagetop:setAlpha( 0 )
				vhudsiegebotdamagetopFrame2( vhudsiegebotdamagetop, {} )
				local Image20Frame2 = function ( Image20, event )
					local Image20Frame3 = function ( Image20, event )
						if not event.interrupted then
							Image20:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						Image20:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( Image20, event )
						else
							Image20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image20Frame3( Image20, event )
						return 
					else
						Image20:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						Image20:registerEventHandler( "transition_complete_keyframe", Image20Frame3 )
					end
				end
				
				Image20:completeAnimation()
				self.Image20:setAlpha( 0 )
				Image20Frame2( Image20, {} )
				local Image8Frame2 = function ( Image8, event )
					local Image8Frame3 = function ( Image8, event )
						if not event.interrupted then
							Image8:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						Image8:setAlpha( 0.4 )
						if event.interrupted then
							self.clipFinished( Image8, event )
						else
							Image8:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image8Frame3( Image8, event )
						return 
					else
						Image8:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						Image8:registerEventHandler( "transition_complete_keyframe", Image8Frame3 )
					end
				end
				
				Image8:completeAnimation()
				self.Image8:setAlpha( 0 )
				Image8Frame2( Image8, {} )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 12 )
				agrCenterPoint:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				agrCenterPoint:setLeftRight( false, false, -9, 7 )
				agrCenterPoint:setTopBottom( false, false, -8, 8 )
				agrCenterPoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local HairlineTopFrame2 = function ( HairlineTop, event )
					if not event.interrupted then
						HairlineTop:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					HairlineTop:setLeftRight( false, false, -13, 11 )
					HairlineTop:setTopBottom( false, false, -32.5, -20.5 )
					HairlineTop:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HairlineTop, event )
					else
						HairlineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HairlineTop:completeAnimation()
				self.HairlineTop:setLeftRight( false, false, -13, 11 )
				self.HairlineTop:setTopBottom( false, false, -32.5, -20.5 )
				self.HairlineTop:setAlpha( 1 )
				HairlineTopFrame2( HairlineTop, {} )
				local HairlineRightFrame2 = function ( HairlineRight, event )
					if not event.interrupted then
						HairlineRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					HairlineRight:setLeftRight( false, false, 15, 27 )
					HairlineRight:setTopBottom( false, false, 15.5, 27.5 )
					HairlineRight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HairlineRight, event )
					else
						HairlineRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HairlineRight:completeAnimation()
				self.HairlineRight:setLeftRight( false, false, 15, 27 )
				self.HairlineRight:setTopBottom( false, false, 15.5, 27.5 )
				self.HairlineRight:setAlpha( 1 )
				HairlineRightFrame2( HairlineRight, {} )
				local HairlineLeftFrame2 = function ( HairlineLeft, event )
					if not event.interrupted then
						HairlineLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					HairlineLeft:setLeftRight( false, false, -28, -16 )
					HairlineLeft:setTopBottom( false, false, 15.5, 27.5 )
					HairlineLeft:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( HairlineLeft, event )
					else
						HairlineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HairlineLeft:completeAnimation()
				self.HairlineLeft:setLeftRight( false, false, -28, -16 )
				self.HairlineLeft:setTopBottom( false, false, 15.5, 27.5 )
				self.HairlineLeft:setAlpha( 1 )
				HairlineLeftFrame2( HairlineLeft, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( false, false, -13, 11 )
					Image0:setTopBottom( false, false, -21.5, -14.5 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -13, 11 )
				self.Image0:setTopBottom( false, false, -81.45, -74.45 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					if not event.interrupted then
						Image1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image1:setLeftRight( false, false, -13, 11 )
					Image1:setTopBottom( false, false, 15.5, 22 )
					Image1:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Image1, event )
					else
						Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( false, false, -12, 12 )
				self.Image1:setTopBottom( false, false, 67.1, 74.1 )
				self.Image1:setAlpha( 0.8 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					if not event.interrupted then
						Image2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image2:setLeftRight( false, false, 4.5, 88.5 )
					Image2:setTopBottom( false, false, -6.45, 5.55 )
					Image2:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( Image2, event )
					else
						Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( false, false, 67.5, 151.5 )
				self.Image2:setTopBottom( false, false, -6.45, 5.55 )
				self.Image2:setAlpha( 0.6 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					if not event.interrupted then
						Image3:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image3:setLeftRight( false, false, -91.75, -7.75 )
					Image3:setTopBottom( false, false, -6.45, 5.55 )
					Image3:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( Image3, event )
					else
						Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setLeftRight( false, false, -147.75, -63.75 )
				self.Image3:setTopBottom( false, false, -6.45, 5.55 )
				self.Image3:setAlpha( 0.6 )
				Image3Frame2( Image3, {} )
				local Image4Frame2 = function ( Image4, event )
					if not event.interrupted then
						Image4:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image4:setLeftRight( false, false, 107.43, 131.43 )
					Image4:setTopBottom( false, false, -6.45, 5.55 )
					Image4:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image4, event )
					else
						Image4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image4:completeAnimation()
				self.Image4:setLeftRight( false, false, 168.5, 192.5 )
				self.Image4:setTopBottom( false, false, -6.45, 5.55 )
				self.Image4:setAlpha( 1 )
				Image4Frame2( Image4, {} )
				local Image5Frame2 = function ( Image5, event )
					if not event.interrupted then
						Image5:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image5:setLeftRight( false, false, 147.43, 171.43 )
					Image5:setTopBottom( false, false, -6.45, 5.55 )
					Image5:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image5, event )
					else
						Image5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image5:completeAnimation()
				self.Image5:setLeftRight( false, false, 206.5, 230.5 )
				self.Image5:setTopBottom( false, false, -6.45, 5.55 )
				self.Image5:setAlpha( 1 )
				Image5Frame2( Image5, {} )
				local Image6Frame2 = function ( Image6, event )
					if not event.interrupted then
						Image6:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image6:setLeftRight( false, false, -166.75, -142.75 )
					Image6:setTopBottom( false, false, -6.45, 5.55 )
					Image6:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image6, event )
					else
						Image6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image6:completeAnimation()
				self.Image6:setLeftRight( false, false, -224.75, -200.75 )
				self.Image6:setTopBottom( false, false, -6.45, 5.55 )
				self.Image6:setAlpha( 1 )
				Image6Frame2( Image6, {} )
				local Image7Frame2 = function ( Image7, event )
					if not event.interrupted then
						Image7:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image7:setLeftRight( false, false, -129.57, -105.57 )
					Image7:setTopBottom( false, false, -6.45, 5.55 )
					Image7:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image7, event )
					else
						Image7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image7:completeAnimation()
				self.Image7:setLeftRight( false, false, -187.75, -163.75 )
				self.Image7:setTopBottom( false, false, -6.45, 5.55 )
				self.Image7:setAlpha( 1 )
				Image7Frame2( Image7, {} )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				HairlineTop:completeAnimation()
				self.HairlineTop:setLeftRight( false, false, -13, 11 )
				self.HairlineTop:setTopBottom( false, false, -32.5, -20.5 )
				self.HairlineTop:setAlpha( 0 )
				self.clipFinished( HairlineTop, {} )
				HairlineRight:completeAnimation()
				self.HairlineRight:setLeftRight( false, false, 15, 27 )
				self.HairlineRight:setTopBottom( false, false, 15.5, 27.5 )
				self.HairlineRight:setAlpha( 0 )
				self.clipFinished( HairlineRight, {} )
				HairlineLeft:completeAnimation()
				self.HairlineLeft:setLeftRight( false, false, -28, -16 )
				self.HairlineLeft:setTopBottom( false, false, 15.5, 27.5 )
				self.HairlineLeft:setAlpha( 0 )
				self.clipFinished( HairlineLeft, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -13, 11 )
				self.Image0:setTopBottom( false, false, -21.5, -14.5 )
				self.clipFinished( Image0, {} )
				Image1:completeAnimation()
				self.Image1:setLeftRight( false, false, -13, 11 )
				self.Image1:setTopBottom( false, false, 15.5, 22 )
				self.clipFinished( Image1, {} )
				Image2:completeAnimation()
				self.Image2:setLeftRight( false, false, 4.5, 88.5 )
				self.Image2:setTopBottom( false, false, -6.45, 5.55 )
				self.clipFinished( Image2, {} )
				Image3:completeAnimation()
				self.Image3:setLeftRight( false, false, -91.75, -7.75 )
				self.Image3:setTopBottom( false, false, -6.45, 5.55 )
				self.clipFinished( Image3, {} )
				Image4:completeAnimation()
				self.Image4:setLeftRight( false, false, 107.43, 131.43 )
				self.Image4:setTopBottom( false, false, -6.45, 5.55 )
				self.clipFinished( Image4, {} )
				Image5:completeAnimation()
				self.Image5:setLeftRight( false, false, 147.43, 171.43 )
				self.Image5:setTopBottom( false, false, -6.45, 5.55 )
				self.clipFinished( Image5, {} )
				Image6:completeAnimation()
				self.Image6:setLeftRight( false, false, -166.75, -142.75 )
				self.Image6:setTopBottom( false, false, -6.45, 5.55 )
				self.clipFinished( Image6, {} )
				Image7:completeAnimation()
				self.Image7:setLeftRight( false, false, -129.57, -105.57 )
				self.Image7:setTopBottom( false, false, -6.45, 5.55 )
				self.clipFinished( Image7, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 11 )
				local HairlineTopFrame2 = function ( HairlineTop, event )
					if not event.interrupted then
						HairlineTop:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					HairlineTop:setLeftRight( false, false, -13, 11 )
					HairlineTop:setTopBottom( false, false, -32.5, -20.5 )
					HairlineTop:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HairlineTop, event )
					else
						HairlineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HairlineTop:completeAnimation()
				self.HairlineTop:setLeftRight( false, false, -13, 11 )
				self.HairlineTop:setTopBottom( false, false, -32.5, -20.5 )
				self.HairlineTop:setAlpha( 0 )
				HairlineTopFrame2( HairlineTop, {} )
				local HairlineRightFrame2 = function ( HairlineRight, event )
					if not event.interrupted then
						HairlineRight:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					HairlineRight:setLeftRight( false, false, 15, 27 )
					HairlineRight:setTopBottom( false, false, 15.5, 27.5 )
					HairlineRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HairlineRight, event )
					else
						HairlineRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HairlineRight:completeAnimation()
				self.HairlineRight:setLeftRight( false, false, 15, 27 )
				self.HairlineRight:setTopBottom( false, false, 15.5, 27.5 )
				self.HairlineRight:setAlpha( 0 )
				HairlineRightFrame2( HairlineRight, {} )
				local HairlineLeftFrame2 = function ( HairlineLeft, event )
					if not event.interrupted then
						HairlineLeft:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					HairlineLeft:setLeftRight( false, false, -28, -16 )
					HairlineLeft:setTopBottom( false, false, 15.5, 27.5 )
					HairlineLeft:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( HairlineLeft, event )
					else
						HairlineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				HairlineLeft:completeAnimation()
				self.HairlineLeft:setLeftRight( false, false, -28, -16 )
				self.HairlineLeft:setTopBottom( false, false, 15.5, 27.5 )
				self.HairlineLeft:setAlpha( 0 )
				HairlineLeftFrame2( HairlineLeft, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image0:setLeftRight( false, false, -13, 11 )
					Image0:setTopBottom( false, false, -81.45, -74.45 )
					Image0:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( false, false, -13, 11 )
				self.Image0:setTopBottom( false, false, -21.5, -14.5 )
				self.Image0:setAlpha( 0.8 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					if not event.interrupted then
						Image1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image1:setLeftRight( false, false, -12, 12 )
					Image1:setTopBottom( false, false, 67.1, 74.1 )
					Image1:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Image1, event )
					else
						Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( false, false, -13, 11 )
				self.Image1:setTopBottom( false, false, 15.5, 22 )
				self.Image1:setAlpha( 0.8 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					if not event.interrupted then
						Image2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image2:setLeftRight( false, false, 67.5, 151.5 )
					Image2:setTopBottom( false, false, -6.45, 5.55 )
					Image2:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( Image2, event )
					else
						Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( false, false, 4.5, 88.5 )
				self.Image2:setTopBottom( false, false, -6.45, 5.55 )
				self.Image2:setAlpha( 0.6 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					if not event.interrupted then
						Image3:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image3:setLeftRight( false, false, -147.75, -63.75 )
					Image3:setTopBottom( false, false, -6.45, 5.55 )
					Image3:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( Image3, event )
					else
						Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setLeftRight( false, false, -91.75, -7.75 )
				self.Image3:setTopBottom( false, false, -6.45, 5.55 )
				self.Image3:setAlpha( 0.6 )
				Image3Frame2( Image3, {} )
				local Image4Frame2 = function ( Image4, event )
					if not event.interrupted then
						Image4:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image4:setLeftRight( false, false, 168.5, 192.5 )
					Image4:setTopBottom( false, false, -6.45, 5.55 )
					Image4:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Image4, event )
					else
						Image4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image4:completeAnimation()
				self.Image4:setLeftRight( false, false, 107.43, 131.43 )
				self.Image4:setTopBottom( false, false, -6.45, 5.55 )
				self.Image4:setAlpha( 0.8 )
				Image4Frame2( Image4, {} )
				local Image5Frame2 = function ( Image5, event )
					if not event.interrupted then
						Image5:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image5:setLeftRight( false, false, 206.5, 230.5 )
					Image5:setTopBottom( false, false, -6.45, 5.55 )
					Image5:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Image5, event )
					else
						Image5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image5:completeAnimation()
				self.Image5:setLeftRight( false, false, 147.43, 171.43 )
				self.Image5:setTopBottom( false, false, -6.45, 5.55 )
				self.Image5:setAlpha( 0.8 )
				Image5Frame2( Image5, {} )
				local Image6Frame2 = function ( Image6, event )
					if not event.interrupted then
						Image6:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image6:setLeftRight( false, false, -224.75, -200.75 )
					Image6:setTopBottom( false, false, -6.45, 5.55 )
					Image6:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Image6, event )
					else
						Image6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image6:completeAnimation()
				self.Image6:setLeftRight( false, false, -166.75, -142.75 )
				self.Image6:setTopBottom( false, false, -6.45, 5.55 )
				self.Image6:setAlpha( 0.8 )
				Image6Frame2( Image6, {} )
				local Image7Frame2 = function ( Image7, event )
					if not event.interrupted then
						Image7:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image7:setLeftRight( false, false, -187.75, -163.75 )
					Image7:setTopBottom( false, false, -6.45, 5.55 )
					Image7:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Image7, event )
					else
						Image7:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image7:completeAnimation()
				self.Image7:setLeftRight( false, false, -129.57, -105.57 )
				self.Image7:setTopBottom( false, false, -6.45, 5.55 )
				self.Image7:setAlpha( 0.8 )
				Image7Frame2( Image7, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsiegebotmissilecontainer:close()
		element.vhudsiegebotdamagebottom:close()
		element.vhudsiegebotdamagetop:close()
		element.vuhdsiegebotlockedWidget:close()
		element.vhudsiegebotEMPwidget:close()
		element.BottomBacking:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

