-- 13d525697f43dd4ce257418ac20cdb4a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.CommunityEvent.Winter_Community_Thermometer" )
require( "ui.uieditor.widgets.Promo.Promo_ZMHD_CommunityWidget_TitleAndDesc" )

CoD.Winter_Community_Panel = InheritFrom( LUI.UIElement )
CoD.Winter_Community_Panel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Winter_Community_Panel )
	self.id = "Winter_Community_Panel"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 550 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local WinterCommunityThermometer = CoD.Winter_Community_Thermometer.new( menu, controller )
	WinterCommunityThermometer:setLeftRight( true, false, 736.94, 1084.94 )
	WinterCommunityThermometer:setTopBottom( true, false, 66.67, 504.67 )
	WinterCommunityThermometer:setScale( 0.9 )
	WinterCommunityThermometer:subscribeToGlobalModel( controller, "WinterCommunityRewardList", nil, function ( model )
		WinterCommunityThermometer:setModel( model, controller )
	end )
	self:addElement( WinterCommunityThermometer )
	self.WinterCommunityThermometer = WinterCommunityThermometer
	
	local RewardsText = LUI.UIText.new()
	RewardsText:setLeftRight( true, false, 720.28, 1135.28 )
	RewardsText:setTopBottom( true, false, 55.67, 77.67 )
	RewardsText:setRGB( 0.22, 0.94, 1 )
	RewardsText:setText( Engine.Localize( "CONTRACT_COMMUNITY_WINTER_TOTAL_REQUIREMENT" ) )
	RewardsText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	RewardsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RewardsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RewardsText )
	self.RewardsText = RewardsText
	
	local TitleAndDesc = CoD.Promo_ZMHD_CommunityWidget_TitleAndDesc.new( menu, controller )
	TitleAndDesc:setLeftRight( true, false, 100, 640 )
	TitleAndDesc:setTopBottom( true, false, 34, 86 )
	TitleAndDesc.title:setText( LocalizeToUpperString( "CONTRACT_COMMUNITY_CONTRACT_WINTER_TITLE" ) )
	TitleAndDesc.txtDescription:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_WINTER_DESC" ) )
	self:addElement( TitleAndDesc )
	self.TitleAndDesc = TitleAndDesc
	
	WinterCommunityThermometer.id = "WinterCommunityThermometer"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.WinterCommunityThermometer:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WinterCommunityThermometer:close()
		element.TitleAndDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

