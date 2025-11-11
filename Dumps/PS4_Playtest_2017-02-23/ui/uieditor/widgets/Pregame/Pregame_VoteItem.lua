require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )
require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectIndicator" )
require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectIndicator_Background" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_PlayerIndicator" )
require( "ui.uieditor.widgets.Pregame.Pregame_RestrictionIndicator" )

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
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local PregameBanProtectIndicatorBackground = CoD.Pregame_BanProtectIndicator_Background.new( menu, controller )
	PregameBanProtectIndicatorBackground:setLeftRight( 0, 1, 0, 0 )
	PregameBanProtectIndicatorBackground:setTopBottom( 0, 1, 0, 0 )
	PregameBanProtectIndicatorBackground:linkToElementModel( self, nil, false, function ( model )
		PregameBanProtectIndicatorBackground:setModel( model, controller )
	end )
	self:addElement( PregameBanProtectIndicatorBackground )
	self.PregameBanProtectIndicatorBackground = PregameBanProtectIndicatorBackground
	
	local GridItemButtonNew = CoD.GridItemButtonNew.new( menu, controller )
	GridItemButtonNew:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				local f3_local0 = IsCACItemEquipped( menu, element, controller )
				if f3_local0 then
					if not IsInPermanentUnlockMenu( controller ) then
						f3_local0 = AlwaysFalse()
					else
						f3_local0 = false
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				local f4_local0 = IsCACItemNew( element, controller )
				if f4_local0 then
					if not IsInPermanentUnlockMenu( controller ) then
						f4_local0 = AlwaysFalse()
					else
						f4_local0 = false
					end
				end
				return f4_local0
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
				local f6_local0
				if not IsCACItemPurchased( element, controller ) then
					f6_local0 = AlwaysFalse()
				else
					f6_local0 = false
				end
				return f6_local0
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
				local f8_local0
				if not DoesCACItemHaveConsumablesRemaining( menu, element, controller ) then
					f8_local0 = AlwaysFalse()
				else
					f8_local0 = false
				end
				return f8_local0
			end
		},
		{
			stateName = "Invalid",
			condition = function ( menu, element, event )
				local f9_local0 = AlwaysFalse()
				if f9_local0 then
					if not ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE ) then
						f9_local0 = not ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY )
					else
						f9_local0 = false
					end
				end
				return f9_local0
			end
		},
		{
			stateName = "PermanentUnlockRefund",
			condition = function ( menu, element, event )
				local f10_local0 = IsInPermanentUnlockMenu( controller )
				if f10_local0 then
					if not IsPermanentlyUnlocked( element, controller ) then
						f10_local0 = HavePermanentUnlockTokens( controller )
						if f10_local0 then
							f10_local0 = IsCACItemPurchased( element, controller )
							if f10_local0 then
								f10_local0 = AlwaysFalse()
							end
						end
					else
						f10_local0 = false
					end
				end
				return f10_local0
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
	GridItemButtonNew:setLeftRight( 0, 0, 0, 162 )
	GridItemButtonNew:setTopBottom( 0, 0, 0, 162 )
	GridItemButtonNew:linkToElementModel( self, nil, false, function ( model )
		GridItemButtonNew:setModel( model, controller )
	end )
	GridItemButtonNew:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		PlayClipOnElement( self, {
			elementName = "PregameItemVotePlayerIndicator",
			clipName = "ShowTooltip"
		}, controller )
		PlayClipOnElement( self, {
			elementName = "PregameItemVoteRestrictionIndicatorText",
			clipName = "ShowTooltip"
		}, controller )
		return retVal
	end )
	GridItemButtonNew:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		PlayClipOnElement( self, {
			elementName = "PregameItemVotePlayerIndicator",
			clipName = "DefaultClip"
		}, controller )
		PlayClipOnElement( self, {
			elementName = "PregameItemVoteRestrictionIndicatorText",
			clipName = "DefaultClip"
		}, controller )
		return retVal
	end )
	self:addElement( GridItemButtonNew )
	self.GridItemButtonNew = GridItemButtonNew
	
	local Foreground = CoD.Pregame_BanProtectIndicator.new( menu, controller )
	Foreground:setLeftRight( 0, 1, 0, 0 )
	Foreground:setTopBottom( 0, 1, 0, 0 )
	Foreground:linkToElementModel( self, nil, false, function ( model )
		Foreground:setModel( model, controller )
	end )
	self:addElement( Foreground )
	self.Foreground = Foreground
	
	local PregameItemVotePlayerIndicator = CoD.Pregame_ItemVote_PlayerIndicator.new( menu, controller )
	PregameItemVotePlayerIndicator:setLeftRight( 0.5, 0.5, -78, 78 )
	PregameItemVotePlayerIndicator:setTopBottom( 0, 0, -39, -11 )
	PregameItemVotePlayerIndicator:linkToElementModel( self, nil, false, function ( model )
		PregameItemVotePlayerIndicator:setModel( model, controller )
	end )
	PregameItemVotePlayerIndicator:linkToElementModel( self, "hintText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PregameItemVotePlayerIndicator.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PregameItemVotePlayerIndicator )
	self.PregameItemVotePlayerIndicator = PregameItemVotePlayerIndicator
	
	local PregameRestrictionIndicator = CoD.Pregame_RestrictionIndicator.new( menu, controller )
	PregameRestrictionIndicator:setLeftRight( 0, 1, 0, 0 )
	PregameRestrictionIndicator:setTopBottom( 0, 1, 0, 0 )
	PregameRestrictionIndicator:linkToElementModel( self, nil, false, function ( model )
		PregameRestrictionIndicator:setModel( model, controller )
	end )
	self:addElement( PregameRestrictionIndicator )
	self.PregameRestrictionIndicator = PregameRestrictionIndicator
	
	self.resetProperties = function ()
		PregameItemVotePlayerIndicator:completeAnimation()
		PregameItemVotePlayerIndicator:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				PregameItemVotePlayerIndicator:completeAnimation()
				self.PregameItemVotePlayerIndicator:setAlpha( 0 )
				self.clipFinished( PregameItemVotePlayerIndicator, {} )
			end
		},
		ShowHeader = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ShowFooter = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PregameBanProtectIndicatorBackground:close()
		self.GridItemButtonNew:close()
		self.Foreground:close()
		self.PregameItemVotePlayerIndicator:close()
		self.PregameRestrictionIndicator:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

