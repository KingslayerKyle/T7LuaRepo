require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectIndicator_Background" )
require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )
require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectIndicator" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_PlayerIndicator" )
require( "ui.uieditor.widgets.Pregame.Pregame_RestrictionIndicator" )
require( "ui.uieditor.widgets.Pregame.Pregame_FactionTeamColorBarHeader" )

CoD.Pregame_VoteItem = InheritFrom( LUI.UIElement )
CoD.Pregame_VoteItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_VoteItem )
	self.id = "Pregame_VoteItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 108 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local PregameBanProtectIndicatorBackground = CoD.Pregame_BanProtectIndicator_Background.new( menu, controller )
	PregameBanProtectIndicatorBackground:setLeftRight( true, true, 0, 0 )
	PregameBanProtectIndicatorBackground:setTopBottom( true, true, 0, 0 )
	PregameBanProtectIndicatorBackground:linkToElementModel( self, nil, false, function ( model )
		PregameBanProtectIndicatorBackground:setModel( model, controller )
	end )
	self:addElement( PregameBanProtectIndicatorBackground )
	self.PregameBanProtectIndicatorBackground = PregameBanProtectIndicatorBackground
	
	local GridItemButtonNew = CoD.GridItemButtonNew.new( menu, controller )
	GridItemButtonNew:setLeftRight( true, false, 0, 108 )
	GridItemButtonNew:setTopBottom( true, false, 0, 108 )
	GridItemButtonNew:linkToElementModel( self, nil, false, function ( model )
		GridItemButtonNew:setModel( model, controller )
	end )
	GridItemButtonNew:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		PlayClipOnElement( self, {
			elementName = "PregameItemVotePlayerIndicator",
			clipName = "ShowTooltip"
		}, controller )
		PlayClipOnElement( self, {
			elementName = "PregameItemVoteRestrictionIndicatorText",
			clipName = "ShowTooltip"
		}, controller )
		return f4_local0
	end )
	GridItemButtonNew:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		PlayClipOnElement( self, {
			elementName = "PregameItemVotePlayerIndicator",
			clipName = "DefaultClip"
		}, controller )
		PlayClipOnElement( self, {
			elementName = "PregameItemVoteRestrictionIndicatorText",
			clipName = "DefaultClip"
		}, controller )
		return f5_local0
	end )
	GridItemButtonNew:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				local f6_local0 = IsCACItemEquipped( menu, element, controller )
				if f6_local0 then
					if not IsInPermanentUnlockMenu( controller ) then
						f6_local0 = AlwaysFalse()
					else
						f6_local0 = false
					end
				end
				return f6_local0
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				local f7_local0 = IsCACItemNew( element, controller )
				if f7_local0 then
					if not IsInPermanentUnlockMenu( controller ) then
						f7_local0 = AlwaysFalse()
					else
						f7_local0 = false
					end
				end
				return f7_local0
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller ) and AlwaysFalse()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f9_local0
				if not IsCACItemPurchased( element, controller ) then
					f9_local0 = AlwaysFalse()
				else
					f9_local0 = false
				end
				return f9_local0
			end
		},
		{
			stateName = "MutuallyExclusive",
			condition = function ( menu, element, event )
				return IsCACItemMutuallyExclusiveWithSelection( element, controller ) and AlwaysFalse()
			end
		},
		{
			stateName = "NoConsumablesRemaining",
			condition = function ( menu, element, event )
				local f11_local0
				if not DoesCACItemHaveConsumablesRemaining( menu, element, controller ) then
					f11_local0 = AlwaysFalse()
				else
					f11_local0 = false
				end
				return f11_local0
			end
		},
		{
			stateName = "Invalid",
			condition = function ( menu, element, event )
				local f12_local0 = AlwaysFalse()
				if f12_local0 then
					if not ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE ) then
						f12_local0 = not ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY )
					else
						f12_local0 = false
					end
				end
				return f12_local0
			end
		},
		{
			stateName = "PermanentUnlockRefund",
			condition = function ( menu, element, event )
				local f13_local0 = IsInPermanentUnlockMenu( controller )
				if f13_local0 then
					if not IsPermanentlyUnlocked( element, controller ) then
						f13_local0 = HavePermanentUnlockTokens( controller )
						if f13_local0 then
							f13_local0 = IsCACItemPurchased( element, controller )
							if f13_local0 then
								f13_local0 = AlwaysFalse()
							end
						end
					else
						f13_local0 = false
					end
				end
				return f13_local0
			end
		}
	} )
	GridItemButtonNew:linkToElementModel( GridItemButtonNew, "itemIndex", true, function ( model )
		menu:updateElementState( GridItemButtonNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	GridItemButtonNew:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( GridItemButtonNew, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	self:addElement( GridItemButtonNew )
	self.GridItemButtonNew = GridItemButtonNew
	
	local Foreground = CoD.Pregame_BanProtectIndicator.new( menu, controller )
	Foreground:setLeftRight( true, true, 0, 0 )
	Foreground:setTopBottom( true, true, 0, 0 )
	Foreground:linkToElementModel( self, nil, false, function ( model )
		Foreground:setModel( model, controller )
	end )
	self:addElement( Foreground )
	self.Foreground = Foreground
	
	local PregameItemVotePlayerIndicator = CoD.Pregame_ItemVote_PlayerIndicator.new( menu, controller )
	PregameItemVotePlayerIndicator:setLeftRight( false, false, -52, 52 )
	PregameItemVotePlayerIndicator:setTopBottom( true, false, -26, -7 )
	PregameItemVotePlayerIndicator:linkToElementModel( self, nil, false, function ( model )
		PregameItemVotePlayerIndicator:setModel( model, controller )
	end )
	PregameItemVotePlayerIndicator:linkToElementModel( self, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			PregameItemVotePlayerIndicator.itemName:setText( Engine.Localize( hintText ) )
		end
	end )
	self:addElement( PregameItemVotePlayerIndicator )
	self.PregameItemVotePlayerIndicator = PregameItemVotePlayerIndicator
	
	local PregameRestrictionIndicator = CoD.Pregame_RestrictionIndicator.new( menu, controller )
	PregameRestrictionIndicator:setLeftRight( true, true, 0, 0 )
	PregameRestrictionIndicator:setTopBottom( true, true, 0, 0 )
	PregameRestrictionIndicator:linkToElementModel( self, nil, false, function ( model )
		PregameRestrictionIndicator:setModel( model, controller )
	end )
	self:addElement( PregameRestrictionIndicator )
	self.PregameRestrictionIndicator = PregameRestrictionIndicator
	
	local PregameFactionTeamColorBarHeader = CoD.Pregame_FactionTeamColorBarHeader.new( menu, controller )
	PregameFactionTeamColorBarHeader:setLeftRight( true, false, 0, 108 )
	PregameFactionTeamColorBarHeader:setTopBottom( true, false, -0.49, 2.49 )
	PregameFactionTeamColorBarHeader:linkToElementModel( self, nil, false, function ( model )
		PregameFactionTeamColorBarHeader:setModel( model, controller )
	end )
	self:addElement( PregameFactionTeamColorBarHeader )
	self.PregameFactionTeamColorBarHeader = PregameFactionTeamColorBarHeader
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PregameItemVotePlayerIndicator:completeAnimation()
				self.PregameItemVotePlayerIndicator:setAlpha( 0 )
				self.clipFinished( PregameItemVotePlayerIndicator, {} )
			end
		},
		ShowHeader = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PregameItemVotePlayerIndicator:completeAnimation()
				self.PregameItemVotePlayerIndicator:setAlpha( 1 )
				self.clipFinished( PregameItemVotePlayerIndicator, {} )
			end
		},
		ShowFooter = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PregameItemVotePlayerIndicator:completeAnimation()
				self.PregameItemVotePlayerIndicator:setAlpha( 0 )
				self.clipFinished( PregameItemVotePlayerIndicator, {} )
			end
		}
	}
	GridItemButtonNew.id = "GridItemButtonNew"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GridItemButtonNew:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PregameBanProtectIndicatorBackground:close()
		element.GridItemButtonNew:close()
		element.Foreground:close()
		element.PregameItemVotePlayerIndicator:close()
		element.PregameRestrictionIndicator:close()
		element.PregameFactionTeamColorBarHeader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

