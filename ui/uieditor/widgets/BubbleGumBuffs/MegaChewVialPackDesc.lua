-- 6fd89bf0a2a5d30853e43e0a1694c835
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumBuffTitle" )
require( "ui.uieditor.widgets.HUD.ZM_Notif.ZmNotif1_CursorHint" )

CoD.MegaChewVialPackDesc = InheritFrom( LUI.UIElement )
CoD.MegaChewVialPackDesc.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MegaChewVialPackDesc )
	self.id = "MegaChewVialPackDesc"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 448 )
	self:setTopBottom( true, false, 0, 54 )
	
	local BubbleGumBuffTitle0 = CoD.BubbleGumBuffTitle.new( menu, controller )
	BubbleGumBuffTitle0:setLeftRight( false, false, -48.5, 48.5 )
	BubbleGumBuffTitle0:setTopBottom( true, false, 4, 29 )
	BubbleGumBuffTitle0.EquippedBuffsLabel:setText( LocalizeToUpperString( "ZMUI_VIAL_PACK_CAPS" ) )
	self:addElement( BubbleGumBuffTitle0 )
	self.BubbleGumBuffTitle0 = BubbleGumBuffTitle0
	
	local ZmNotif1CursorHint0 = CoD.ZmNotif1_CursorHint.new( menu, controller )
	ZmNotif1CursorHint0:setLeftRight( true, false, -32, 480 )
	ZmNotif1CursorHint0:setTopBottom( true, false, 32, 52 )
	ZmNotif1CursorHint0.FEButtonPanel0:setAlpha( 0.7 )
	ZmNotif1CursorHint0:linkToElementModel( self, "vials", true, function ( model )
		local vials = Engine.GetModelValue( model )
		if vials then
			ZmNotif1CursorHint0.CursorHintText:setText( LocalizeIntoString( "ZMUI_VIALS_OF_LIQUID_DIVINIUM", vials ) )
		end
	end )
	self:addElement( ZmNotif1CursorHint0 )
	self.ZmNotif1CursorHint0 = ZmNotif1CursorHint0
	
	local UltraRareMegaDesc = CoD.ZmNotif1_CursorHint.new( menu, controller )
	UltraRareMegaDesc:setLeftRight( true, false, -32, 480 )
	UltraRareMegaDesc:setTopBottom( true, false, 32, 52 )
	UltraRareMegaDesc:setAlpha( 0 )
	UltraRareMegaDesc.FEButtonPanel0:setAlpha( 0.7 )
	UltraRareMegaDesc:linkToElementModel( self, "supportText", true, function ( model )
		local supportText = Engine.GetModelValue( model )
		if supportText then
			UltraRareMegaDesc.CursorHintText:setText( Engine.Localize( supportText ) )
		end
	end )
	self:addElement( UltraRareMegaDesc )
	self.UltraRareMegaDesc = UltraRareMegaDesc
	
	local ZmNotif1CursorHint00 = CoD.ZmNotif1_CursorHint.new( menu, controller )
	ZmNotif1CursorHint00:setLeftRight( true, false, -32, 480 )
	ZmNotif1CursorHint00:setTopBottom( true, false, 55, 76 )
	ZmNotif1CursorHint00:setRGB( 0, 0.6, 0.9 )
	ZmNotif1CursorHint00.FEButtonPanel0:setAlpha( 0.7 )
	ZmNotif1CursorHint00:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_liquid_divinium_promo", function ( model )
		local autoeventTimerLiquidDiviniumPromo = Engine.GetModelValue( model )
		if autoeventTimerLiquidDiviniumPromo then
			ZmNotif1CursorHint00.CursorHintText:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerLiquidDiviniumPromo ) )
		end
	end )
	self:addElement( ZmNotif1CursorHint00 )
	self.ZmNotif1CursorHint00 = ZmNotif1CursorHint00
	
	local MegaBundleTimer = CoD.ZmNotif1_CursorHint.new( menu, controller )
	MegaBundleTimer:setLeftRight( true, false, -32, 480 )
	MegaBundleTimer:setTopBottom( true, false, 55, 76 )
	MegaBundleTimer:setRGB( 0, 0.6, 0.9 )
	MegaBundleTimer:setAlpha( 0 )
	MegaBundleTimer.FEButtonPanel0:setAlpha( 0.7 )
	MegaBundleTimer:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_ld_mega_bundle", function ( model )
		local autoeventTimerLdMegaBundle = Engine.GetModelValue( model )
		if autoeventTimerLdMegaBundle then
			MegaBundleTimer.CursorHintText:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerLdMegaBundle ) )
		end
	end )
	self:addElement( MegaBundleTimer )
	self.MegaBundleTimer = MegaBundleTimer
	
	local UltraRareMegaTimer = CoD.ZmNotif1_CursorHint.new( menu, controller )
	UltraRareMegaTimer:setLeftRight( true, false, -32, 480 )
	UltraRareMegaTimer:setTopBottom( true, false, 55, 76 )
	UltraRareMegaTimer:setRGB( 0, 0.6, 0.9 )
	UltraRareMegaTimer:setAlpha( 0 )
	UltraRareMegaTimer.FEButtonPanel0:setAlpha( 0.7 )
	UltraRareMegaTimer:subscribeToGlobalModel( controller, "AutoeventsBribeTimer", "autoevent_timer_urm_active", function ( model )
		local autoeventTimerUrmActive = Engine.GetModelValue( model )
		if autoeventTimerUrmActive then
			UltraRareMegaTimer.CursorHintText:setText( LocalizeIntoString( "MPUI_BM_BRIBE_END_TIME", autoeventTimerUrmActive ) )
		end
	end )
	self:addElement( UltraRareMegaTimer )
	self.UltraRareMegaTimer = UltraRareMegaTimer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BubbleGumBuffTitle0:completeAnimation()
				self.BubbleGumBuffTitle0:setAlpha( 0 )
				self.clipFinished( BubbleGumBuffTitle0, {} )

				ZmNotif1CursorHint0:completeAnimation()
				self.ZmNotif1CursorHint0:setAlpha( 0 )
				self.clipFinished( ZmNotif1CursorHint0, {} )

				UltraRareMegaDesc:completeAnimation()
				self.UltraRareMegaDesc:setAlpha( 0 )
				self.clipFinished( UltraRareMegaDesc, {} )

				ZmNotif1CursorHint00:completeAnimation()
				self.ZmNotif1CursorHint00:setAlpha( 0 )
				self.clipFinished( ZmNotif1CursorHint00, {} )

				MegaBundleTimer:completeAnimation()
				self.MegaBundleTimer:setAlpha( 0 )
				self.clipFinished( MegaBundleTimer, {} )

				UltraRareMegaTimer:completeAnimation()
				self.UltraRareMegaTimer:setAlpha( 0 )
				self.clipFinished( UltraRareMegaTimer, {} )
			end
		},
		VisibleUltraRareMegaTimer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BubbleGumBuffTitle0:completeAnimation()

				BubbleGumBuffTitle0.EquippedBuffsLabel:completeAnimation()
				self.BubbleGumBuffTitle0:setAlpha( 1 )
				self.BubbleGumBuffTitle0.EquippedBuffsLabel:setText( LocalizeToUpperString( "ZMUI_URM_PURCHASE_TITLE" ) )
				self.clipFinished( BubbleGumBuffTitle0, {} )

				ZmNotif1CursorHint0:completeAnimation()
				self.ZmNotif1CursorHint0:setAlpha( 0 )
				self.clipFinished( ZmNotif1CursorHint0, {} )

				UltraRareMegaDesc:completeAnimation()
				self.UltraRareMegaDesc:setAlpha( 1 )
				self.clipFinished( UltraRareMegaDesc, {} )

				ZmNotif1CursorHint00:completeAnimation()
				self.ZmNotif1CursorHint00:setAlpha( 0 )
				self.clipFinished( ZmNotif1CursorHint00, {} )

				MegaBundleTimer:completeAnimation()
				self.MegaBundleTimer:setAlpha( 0 )
				self.clipFinished( MegaBundleTimer, {} )

				UltraRareMegaTimer:completeAnimation()
				self.UltraRareMegaTimer:setAlpha( 1 )
				self.clipFinished( UltraRareMegaTimer, {} )
			end
		},
		VisibleUltraRareMega = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BubbleGumBuffTitle0:completeAnimation()

				BubbleGumBuffTitle0.EquippedBuffsLabel:completeAnimation()
				self.BubbleGumBuffTitle0:setAlpha( 1 )
				self.BubbleGumBuffTitle0.EquippedBuffsLabel:setText( LocalizeToUpperString( "ZMUI_URM_PURCHASE_TITLE" ) )
				self.clipFinished( BubbleGumBuffTitle0, {} )

				ZmNotif1CursorHint0:completeAnimation()
				self.ZmNotif1CursorHint0:setAlpha( 0 )
				self.clipFinished( ZmNotif1CursorHint0, {} )

				UltraRareMegaDesc:completeAnimation()
				self.UltraRareMegaDesc:setAlpha( 1 )
				self.clipFinished( UltraRareMegaDesc, {} )

				ZmNotif1CursorHint00:completeAnimation()
				self.ZmNotif1CursorHint00:setAlpha( 0 )
				self.clipFinished( ZmNotif1CursorHint00, {} )

				MegaBundleTimer:completeAnimation()
				self.MegaBundleTimer:setAlpha( 0 )
				self.clipFinished( MegaBundleTimer, {} )

				UltraRareMegaTimer:completeAnimation()
				self.UltraRareMegaTimer:setAlpha( 0 )
				self.clipFinished( UltraRareMegaTimer, {} )
			end
		},
		VisibleSaleActive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BubbleGumBuffTitle0:completeAnimation()

				BubbleGumBuffTitle0.EquippedBuffsLabel:completeAnimation()
				self.BubbleGumBuffTitle0:setAlpha( 1 )
				self.BubbleGumBuffTitle0.EquippedBuffsLabel:setText( LocalizeToUpperString( "ZMUI_VIAL_PACK_CAPS" ) )
				self.clipFinished( BubbleGumBuffTitle0, {} )

				ZmNotif1CursorHint0:completeAnimation()
				self.ZmNotif1CursorHint0:setAlpha( 1 )
				self.clipFinished( ZmNotif1CursorHint0, {} )

				UltraRareMegaDesc:completeAnimation()
				self.UltraRareMegaDesc:setAlpha( 0 )
				self.clipFinished( UltraRareMegaDesc, {} )

				ZmNotif1CursorHint00:completeAnimation()
				self.ZmNotif1CursorHint00:setAlpha( 1 )
				self.clipFinished( ZmNotif1CursorHint00, {} )

				MegaBundleTimer:completeAnimation()
				self.MegaBundleTimer:setAlpha( 0 )
				self.clipFinished( MegaBundleTimer, {} )

				UltraRareMegaTimer:completeAnimation()
				self.UltraRareMegaTimer:setAlpha( 0 )
				self.clipFinished( UltraRareMegaTimer, {} )
			end
		},
		VisibleMegaBundle = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BubbleGumBuffTitle0:completeAnimation()

				BubbleGumBuffTitle0.EquippedBuffsLabel:completeAnimation()
				self.BubbleGumBuffTitle0:setAlpha( 1 )
				self.BubbleGumBuffTitle0.EquippedBuffsLabel:setText( LocalizeToUpperString( "ZMUI_VIAL_PACK_CAPS" ) )
				self.clipFinished( BubbleGumBuffTitle0, {} )

				ZmNotif1CursorHint0:completeAnimation()
				self.ZmNotif1CursorHint0:setAlpha( 1 )
				self.clipFinished( ZmNotif1CursorHint0, {} )

				UltraRareMegaDesc:completeAnimation()
				self.UltraRareMegaDesc:setAlpha( 0 )
				self.clipFinished( UltraRareMegaDesc, {} )

				ZmNotif1CursorHint00:completeAnimation()
				self.ZmNotif1CursorHint00:setAlpha( 0 )
				self.clipFinished( ZmNotif1CursorHint00, {} )

				MegaBundleTimer:completeAnimation()
				self.MegaBundleTimer:setAlpha( 1 )
				self.clipFinished( MegaBundleTimer, {} )

				UltraRareMegaTimer:completeAnimation()
				self.UltraRareMegaTimer:setAlpha( 0 )
				self.clipFinished( UltraRareMegaTimer, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BubbleGumBuffTitle0:completeAnimation()

				BubbleGumBuffTitle0.EquippedBuffsLabel:completeAnimation()
				self.BubbleGumBuffTitle0:setAlpha( 1 )
				self.BubbleGumBuffTitle0.EquippedBuffsLabel:setText( LocalizeToUpperString( "ZMUI_VIAL_PACK_CAPS" ) )
				self.clipFinished( BubbleGumBuffTitle0, {} )

				ZmNotif1CursorHint0:completeAnimation()
				self.ZmNotif1CursorHint0:setAlpha( 1 )
				self.clipFinished( ZmNotif1CursorHint0, {} )

				UltraRareMegaDesc:completeAnimation()
				self.UltraRareMegaDesc:setAlpha( 0 )
				self.clipFinished( UltraRareMegaDesc, {} )

				ZmNotif1CursorHint00:completeAnimation()
				self.ZmNotif1CursorHint00:setAlpha( 0 )
				self.clipFinished( ZmNotif1CursorHint00, {} )

				MegaBundleTimer:completeAnimation()
				self.MegaBundleTimer:setAlpha( 0 )
				self.clipFinished( MegaBundleTimer, {} )

				UltraRareMegaTimer:completeAnimation()
				self.UltraRareMegaTimer:setAlpha( 0 )
				self.clipFinished( UltraRareMegaTimer, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "VisibleUltraRareMegaTimer",
			condition = function ( menu, element, event )
				return IsIntDvarNonZero( "loot_ld_urm_gobblegum_enabled" )
			end
		},
		{
			stateName = "VisibleUltraRareMega",
			condition = function ( menu, element, event )
				return IsIntDvarNonZero( "loot_ld_urm_gobblegum_enabled" )
			end
		},
		{
			stateName = "VisibleSaleActive",
			condition = function ( menu, element, event )
				return IsLiquidDiviniumSaleActive( controller )
			end
		},
		{
			stateName = "VisibleMegaBundle",
			condition = function ( menu, element, event )
				return IsLiquidDiviniumMegaBundleActive( controller )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BubbleGumBuffTitle0:close()
		element.ZmNotif1CursorHint0:close()
		element.UltraRareMegaDesc:close()
		element.ZmNotif1CursorHint00:close()
		element.MegaBundleTimer:close()
		element.UltraRareMegaTimer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

