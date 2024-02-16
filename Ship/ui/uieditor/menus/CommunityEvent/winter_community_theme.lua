-- 995424bf2fd70be382413ce501d54736
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BlackMarket.CommunityEvent.Winter_Community_Header" )
require( "ui.uieditor.widgets.BlackMarket.CommunityEvent.Winter_Community_Panel" )

LUI.createMenu.winter_community_theme = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "winter_community_theme" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "Blackmarket_extra"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "winter_community_theme.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 0, 1280 )
	Background:setTopBottom( true, false, 0, 720 )
	Background:setImage( RegisterImage( "uie_t7_menu_community_winter_bkgd" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Snow = LUI.UIImage.new()
	Snow:setLeftRight( true, false, 0, 1280 )
	Snow:setTopBottom( true, false, 0, 720 )
	Snow:setImage( RegisterImage( "uie_t7_menu_community_winter_snow" ) )
	self:addElement( Snow )
	self.Snow = Snow
	
	local Snow00 = LUI.UIImage.new()
	Snow00:setLeftRight( true, false, 0, 1280 )
	Snow00:setTopBottom( true, false, -720, 0 )
	Snow00:setImage( RegisterImage( "uie_t7_menu_community_winter_snow" ) )
	self:addElement( Snow00 )
	self.Snow00 = Snow00
	
	local Snow000 = LUI.UIImage.new()
	Snow000:setLeftRight( true, false, 0, 1280 )
	Snow000:setTopBottom( true, false, -1440, -720 )
	Snow000:setImage( RegisterImage( "uie_t7_menu_community_winter_snow" ) )
	self:addElement( Snow000 )
	self.Snow000 = Snow000
	
	local SnowBackBottom = LUI.UIImage.new()
	SnowBackBottom:setLeftRight( true, false, 0, 1280 )
	SnowBackBottom:setTopBottom( true, false, 0, 720 )
	SnowBackBottom:setAlpha( 0.5 )
	SnowBackBottom:setYRot( 180 )
	SnowBackBottom:setZoom( -80 )
	SnowBackBottom:setImage( RegisterImage( "uie_t7_menu_community_winter_snow" ) )
	self:addElement( SnowBackBottom )
	self.SnowBackBottom = SnowBackBottom
	
	local SnowBackTop = LUI.UIImage.new()
	SnowBackTop:setLeftRight( true, false, 0, 1280 )
	SnowBackTop:setTopBottom( true, false, -720, 0 )
	SnowBackTop:setAlpha( 0.5 )
	SnowBackTop:setYRot( 180 )
	SnowBackTop:setZoom( -80 )
	SnowBackTop:setImage( RegisterImage( "uie_t7_menu_community_winter_snow" ) )
	self:addElement( SnowBackTop )
	self.SnowBackTop = SnowBackTop
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( true, false, 0, 1280 )
	Panel:setTopBottom( true, false, 0, 720 )
	Panel:setImage( RegisterImage( "uie_t7_menu_community_winter_panel" ) )
	self:addElement( Panel )
	self.Panel = Panel
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( f1_local1, controller )
	SelfIdentityBadge:setLeftRight( false, true, -453, -110 )
	SelfIdentityBadge:setTopBottom( true, false, 15, 75 )
	SelfIdentityBadge:setAlpha( 0 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( f1_local1, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:registerEventHandler( "menu_opened", function ( element, event )
		local f4_local0 = nil
		SizeToSafeArea( element, controller )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local GlowMeter = LUI.UIImage.new()
	GlowMeter:setLeftRight( true, false, 538.06, 1060.68 )
	GlowMeter:setTopBottom( true, false, 430, 876 )
	GlowMeter:setAlpha( 0.5 )
	GlowMeter:setImage( RegisterImage( "uie_t7_blackmarket_promo_meter_glowmeter" ) )
	self:addElement( GlowMeter )
	self.GlowMeter = GlowMeter
	
	local WinterCommunityHeader = CoD.Winter_Community_Header.new( f1_local1, controller )
	WinterCommunityHeader:setLeftRight( true, false, 37.42, 572.42 )
	WinterCommunityHeader:setTopBottom( true, false, 7, 128 )
	WinterCommunityHeader.RecentItems:setText( Engine.Localize( "CONTRACT_COMMUNITY_MENU_TITLE" ) )
	self:addElement( WinterCommunityHeader )
	self.WinterCommunityHeader = WinterCommunityHeader
	
	local WinterCommunityPanel = CoD.Winter_Community_Panel.new( f1_local1, controller )
	WinterCommunityPanel:setLeftRight( true, false, -6, 1274 )
	WinterCommunityPanel:setTopBottom( true, false, 89, 639 )
	WinterCommunityPanel.TitleAndDesc.title:setRGB( 0.33, 0.86, 1 )
	WinterCommunityPanel.TitleAndDesc.title:setText( LocalizeToUpperString( "CONTRACT_COMMUNITY_CONTRACT_WINTER_TITLE" ) )
	WinterCommunityPanel.TitleAndDesc.txtDescription:setRGB( 0.58, 0.89, 1 )
	WinterCommunityPanel.TitleAndDesc.txtDescription:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_WINTER_DESC" ) )
	self:addElement( WinterCommunityPanel )
	self.WinterCommunityPanel = WinterCommunityPanel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local SnowFrame2 = function ( Snow, event )
					if not event.interrupted then
						Snow:beginAnimation( "keyframe", 30000, false, false, CoD.TweenType.Linear )
					end
					Snow:setLeftRight( true, false, 1, 1281 )
					Snow:setTopBottom( true, false, 1440, 2160 )
					if event.interrupted then
						self.clipFinished( Snow, event )
					else
						Snow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Snow:completeAnimation()
				self.Snow:setLeftRight( true, false, 0, 1280 )
				self.Snow:setTopBottom( true, false, 0, 720 )
				SnowFrame2( Snow, {} )
				local Snow00Frame2 = function ( Snow00, event )
					if not event.interrupted then
						Snow00:beginAnimation( "keyframe", 30000, false, false, CoD.TweenType.Linear )
					end
					Snow00:setLeftRight( true, false, 0, 1280 )
					Snow00:setTopBottom( true, false, 720, 1440 )
					if event.interrupted then
						self.clipFinished( Snow00, event )
					else
						Snow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Snow00:completeAnimation()
				self.Snow00:setLeftRight( true, false, 0, 1280 )
				self.Snow00:setTopBottom( true, false, -720, 0 )
				Snow00Frame2( Snow00, {} )
				local Snow000Frame2 = function ( Snow000, event )
					if not event.interrupted then
						Snow000:beginAnimation( "keyframe", 30000, false, false, CoD.TweenType.Linear )
					end
					Snow000:setLeftRight( true, false, 0, 1280 )
					Snow000:setTopBottom( true, false, 0, 720 )
					if event.interrupted then
						self.clipFinished( Snow000, event )
					else
						Snow000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Snow000:completeAnimation()
				self.Snow000:setLeftRight( true, false, 0, 1280 )
				self.Snow000:setTopBottom( true, false, -1440, -720 )
				Snow000Frame2( Snow000, {} )
				local SnowBackBottomFrame2 = function ( SnowBackBottom, event )
					if not event.interrupted then
						SnowBackBottom:beginAnimation( "keyframe", 30000, false, false, CoD.TweenType.Linear )
					end
					SnowBackBottom:setLeftRight( true, false, 0, 1280 )
					SnowBackBottom:setTopBottom( true, false, 724, 1444 )
					if event.interrupted then
						self.clipFinished( SnowBackBottom, event )
					else
						SnowBackBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SnowBackBottom:completeAnimation()
				self.SnowBackBottom:setLeftRight( true, false, 0, 1280 )
				self.SnowBackBottom:setTopBottom( true, false, 0, 720 )
				SnowBackBottomFrame2( SnowBackBottom, {} )
				local SnowBackTopFrame2 = function ( SnowBackTop, event )
					if not event.interrupted then
						SnowBackTop:beginAnimation( "keyframe", 30000, false, false, CoD.TweenType.Linear )
					end
					SnowBackTop:setLeftRight( true, false, 0, 1280 )
					SnowBackTop:setTopBottom( true, false, 4, 724 )
					if event.interrupted then
						self.clipFinished( SnowBackTop, event )
					else
						SnowBackTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SnowBackTop:completeAnimation()
				self.SnowBackTop:setLeftRight( true, false, 0, 1280 )
				self.SnowBackTop:setTopBottom( true, false, -720, 0 )
				SnowBackTopFrame2( SnowBackTop, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		GoBack( self, f11_arg2 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	WinterCommunityPanel.id = "WinterCommunityPanel"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.WinterCommunityPanel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelfIdentityBadge:close()
		element.feFooterContainerNOTLobby:close()
		element.WinterCommunityHeader:close()
		element.WinterCommunityPanel:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "winter_community_theme.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

