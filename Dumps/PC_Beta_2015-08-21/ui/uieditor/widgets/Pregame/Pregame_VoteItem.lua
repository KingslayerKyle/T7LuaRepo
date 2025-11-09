require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectIndicator_Background" )
require( "ui.uieditor.widgets.CAC.GridItemButtonNew" )
require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectIndicator" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_PlayerIndicator" )

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
		return f5_local0
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
	PregameItemVotePlayerIndicator:linkToElementModel( self, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			PregameItemVotePlayerIndicator.itemName:setText( Engine.Localize( hintText ) )
		end
	end )
	self:addElement( PregameItemVotePlayerIndicator )
	self.PregameItemVotePlayerIndicator = PregameItemVotePlayerIndicator
	
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
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

