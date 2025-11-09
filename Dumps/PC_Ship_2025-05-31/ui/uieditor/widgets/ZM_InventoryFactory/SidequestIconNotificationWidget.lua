require( "ui.uieditor.widgets.HUD.ZM_FX.ZmFx_Spark2" )
require( "ui.uieditor.widgets.HUD.ZM_Inventory.SidequestIcon" )

CoD.SidequestIconNotificationWidget = InheritFrom( LUI.UIElement )
CoD.SidequestIconNotificationWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SidequestIconNotificationWidget )
	self.id = "SidequestIconNotificationWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	self.anyChildUsesUpdateState = true
	
	local bg0 = LUI.UIImage.new()
	bg0:setLeftRight( true, false, -27, 187 )
	bg0:setTopBottom( true, true, -66, 70 )
	bg0:setImage( RegisterImage( "uie_t7_zm_hd_inventory_background_small" ) )
	self:addElement( bg0 )
	self.bg0 = bg0
	
	local ZmFxSpark20 = CoD.ZmFx_Spark2.new( menu, controller )
	ZmFxSpark20:setLeftRight( false, false, -32, 32 )
	ZmFxSpark20:setTopBottom( false, false, -69.5, 44.5 )
	ZmFxSpark20:setRGB( 0, 1, 0.21 )
	ZmFxSpark20:setAlpha( 0 )
	ZmFxSpark20:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ZmFxSpark20.Image0:setShaderVector( 1, 0, 0.4, 0, 0 )
	ZmFxSpark20.Image00:setShaderVector( 1, 0, -0.2, 0, 0 )
	self:addElement( ZmFxSpark20 )
	self.ZmFxSpark20 = ZmFxSpark20
	
	local SidequestIcon = CoD.SidequestIcon.new( menu, controller )
	SidequestIcon:setLeftRight( false, false, -44, 45 )
	SidequestIcon:setTopBottom( false, false, -44.5, 44.5 )
	SidequestIcon:setScale( 0.9 )
	SidequestIcon:linkToElementModel( self, nil, false, function ( model )
		SidequestIcon:setModel( model, controller )
	end )
	LUI.OverrideFunction_CallOriginalFirst( SidequestIcon, "setModel", function ( element, controller )
		SetState( self, "BgVisible" )
	end )
	self:addElement( SidequestIcon )
	self.SidequestIcon = SidequestIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg0:completeAnimation()
				self.bg0:setAlpha( 0 )
				self.clipFinished( bg0, {} )
				SidequestIcon:completeAnimation()
				self.SidequestIcon:setAlpha( 0 )
				self.clipFinished( SidequestIcon, {} )
			end,
			BgVisible = function ()
				self:setupElementClipCounter( 3 )
				local bg0Frame2 = function ( bg0, event )
					local bg0Frame3 = function ( bg0, event )
						local bg0Frame4 = function ( bg0, event )
							if not event.interrupted then
								bg0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							end
							bg0:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( bg0, event )
							else
								bg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							bg0Frame4( bg0, event )
							return 
						else
							bg0:beginAnimation( "keyframe", 2700, false, false, CoD.TweenType.Linear )
							bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame4 )
						end
					end
					
					if event.interrupted then
						bg0Frame3( bg0, event )
						return 
					else
						bg0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						bg0:setAlpha( 1 )
						bg0:registerEventHandler( "transition_complete_keyframe", bg0Frame3 )
					end
				end
				
				bg0:completeAnimation()
				self.bg0:setAlpha( 0 )
				bg0Frame2( bg0, {} )
				local ZmFxSpark20Frame2 = function ( ZmFxSpark20, event )
					local ZmFxSpark20Frame3 = function ( ZmFxSpark20, event )
						local ZmFxSpark20Frame4 = function ( ZmFxSpark20, event )
							if not event.interrupted then
								ZmFxSpark20:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							end
							ZmFxSpark20:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ZmFxSpark20, event )
							else
								ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ZmFxSpark20Frame4( ZmFxSpark20, event )
							return 
						else
							ZmFxSpark20:beginAnimation( "keyframe", 2700, false, false, CoD.TweenType.Linear )
							ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame4 )
						end
					end
					
					if event.interrupted then
						ZmFxSpark20Frame3( ZmFxSpark20, event )
						return 
					else
						ZmFxSpark20:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						ZmFxSpark20:setAlpha( 1 )
						ZmFxSpark20:registerEventHandler( "transition_complete_keyframe", ZmFxSpark20Frame3 )
					end
				end
				
				ZmFxSpark20:completeAnimation()
				self.ZmFxSpark20:setAlpha( 0 )
				ZmFxSpark20Frame2( ZmFxSpark20, {} )
				local SidequestIconFrame2 = function ( SidequestIcon, event )
					local SidequestIconFrame3 = function ( SidequestIcon, event )
						local SidequestIconFrame4 = function ( SidequestIcon, event )
							if not event.interrupted then
								SidequestIcon:beginAnimation( "keyframe", 399, false, false, CoD.TweenType.Linear )
							end
							SidequestIcon:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( SidequestIcon, event )
							else
								SidequestIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							SidequestIconFrame4( SidequestIcon, event )
							return 
						else
							SidequestIcon:beginAnimation( "keyframe", 2500, false, false, CoD.TweenType.Linear )
							SidequestIcon:registerEventHandler( "transition_complete_keyframe", SidequestIconFrame4 )
						end
					end
					
					if event.interrupted then
						SidequestIconFrame3( SidequestIcon, event )
						return 
					else
						SidequestIcon:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						SidequestIcon:setAlpha( 1 )
						SidequestIcon:registerEventHandler( "transition_complete_keyframe", SidequestIconFrame3 )
					end
				end
				
				SidequestIcon:completeAnimation()
				self.SidequestIcon:setAlpha( 0 )
				SidequestIconFrame2( SidequestIcon, {} )
			end
		},
		Scoreboard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg0:completeAnimation()
				self.bg0:setAlpha( 0 )
				self.clipFinished( bg0, {} )
				SidequestIcon:completeAnimation()
				self.SidequestIcon:setAlpha( 1 )
				self.clipFinished( SidequestIcon, {} )
			end
		}
	}
	self:linkToElementModel( self, "show_notification", true, function ( model )
		if IsSelfModelValueEqualTo( self, controller, "show_notification", 1 ) then
			PlayClip( self, "BgVisible", controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZmFxSpark20:close()
		element.SidequestIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

