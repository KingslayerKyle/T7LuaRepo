require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Pregame.Pregame_BanProtectFrame" )
require( "ui.uieditor.widgets.Pregame.Pregame_VoteItem" )
require( "ui.uieditor.widgets.Scrollbars.horizontalCounter" )

local PostLoadFunc = function ( self, controller, menu )
	
end

CoD.Pregame_BanProtectSelections = InheritFrom( LUI.UIElement )
CoD.Pregame_BanProtectSelections.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_BanProtectSelections )
	self.id = "Pregame_BanProtectSelections"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1719 )
	self:setTopBottom( 0, 0, 0, 250 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Team2Vignette0 = LUI.UIImage.new()
	Team2Vignette0:setLeftRight( 0, 0, -295, 1976 )
	Team2Vignette0:setTopBottom( 0, 0, -393, 318 )
	Team2Vignette0:setImage( RegisterImage( "uie_t7_mp_menu_startflow_vignette" ) )
	Team2Vignette0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Team2Vignette0 )
	self.Team2Vignette0 = Team2Vignette0
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel1:setLeftRight( 0, 0, -155, 1846 )
	FEButtonPanel1:setTopBottom( 0, 0, 60, 217 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	FEButtonPanel1:setAlpha( 0.65 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local PregameBanProtectFrame = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame:setLeftRight( 0, 0, 0, 162 )
	PregameBanProtectFrame:setTopBottom( 0, 0, 57, 219 )
	PregameBanProtectFrame:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame )
	self.PregameBanProtectFrame = PregameBanProtectFrame
	
	local PregameBanProtectFrame0 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0:setLeftRight( 0, 0, 169, 331 )
	PregameBanProtectFrame0:setTopBottom( 0, 0, 57, 219 )
	PregameBanProtectFrame0:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0 )
	self.PregameBanProtectFrame0 = PregameBanProtectFrame0
	
	local PregameBanProtectFrame1 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame1:setLeftRight( 0, 0, 339, 501 )
	PregameBanProtectFrame1:setTopBottom( 0, 0, 57, 219 )
	PregameBanProtectFrame1:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame1 )
	self.PregameBanProtectFrame1 = PregameBanProtectFrame1
	
	local PregameBanProtectFrame00 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame00:setLeftRight( 0, 0, 509, 671 )
	PregameBanProtectFrame00:setTopBottom( 0, 0, 57, 219 )
	PregameBanProtectFrame00:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame00 )
	self.PregameBanProtectFrame00 = PregameBanProtectFrame00
	
	local PregameBanProtectFrame2 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame2:setLeftRight( 0, 0, 679, 841 )
	PregameBanProtectFrame2:setTopBottom( 0, 0, 57, 219 )
	PregameBanProtectFrame2:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame2 )
	self.PregameBanProtectFrame2 = PregameBanProtectFrame2
	
	local PregameBanProtectFrame01 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame01:setLeftRight( 0, 0, 848, 1010 )
	PregameBanProtectFrame01:setTopBottom( 0, 0, 57, 219 )
	PregameBanProtectFrame01:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame01 )
	self.PregameBanProtectFrame01 = PregameBanProtectFrame01
	
	local PregameBanProtectFrame10 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame10:setLeftRight( 0, 0, 1018, 1180 )
	PregameBanProtectFrame10:setTopBottom( 0, 0, 57, 219 )
	PregameBanProtectFrame10:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame10 )
	self.PregameBanProtectFrame10 = PregameBanProtectFrame10
	
	local PregameBanProtectFrame000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000:setLeftRight( 0, 0, 1187, 1349 )
	PregameBanProtectFrame000:setTopBottom( 0, 0, 57, 219 )
	PregameBanProtectFrame000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000 )
	self.PregameBanProtectFrame000 = PregameBanProtectFrame000
	
	local PregameBanProtectFrame100 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame100:setLeftRight( 0, 0, 1357, 1519 )
	PregameBanProtectFrame100:setTopBottom( 0, 0, 57, 219 )
	PregameBanProtectFrame100:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame100 )
	self.PregameBanProtectFrame100 = PregameBanProtectFrame100
	
	local PregameBanProtectFrame0000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000:setLeftRight( 0, 0, 1526, 1688 )
	PregameBanProtectFrame0000:setTopBottom( 0, 0, 57, 219 )
	PregameBanProtectFrame0000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000 )
	self.PregameBanProtectFrame0000 = PregameBanProtectFrame0000
	
	local VoteList = LUI.UIList.new( menu, controller, 8, 0, nil, false, false, 0, 0, false, false )
	VoteList:makeFocusable()
	VoteList:mergeStateConditions( {
		{
			stateName = "ShowHeader",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	VoteList:setLeftRight( 0, 0, -2, 1690 )
	VoteList:setTopBottom( 0, 0, 57, 219 )
	VoteList:setWidgetType( CoD.Pregame_VoteItem )
	VoteList:setHorizontalCount( 10 )
	VoteList:setSpacing( 8 )
	VoteList:setDataSource( "PregameItemVotes" )
	self:addElement( VoteList )
	self.VoteList = VoteList
	
	local Team1Line = LUI.UIImage.new()
	Team1Line:setLeftRight( 0, 0, -312, 2080 )
	Team1Line:setTopBottom( 0, 0, 52, 64 )
	Team1Line:setAlpha( 0.2 )
	Team1Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line )
	self.Team1Line = Team1Line
	
	local Team1Line0 = LUI.UIImage.new()
	Team1Line0:setLeftRight( 0, 0, -312, 2080 )
	Team1Line0:setTopBottom( 0, 0, 212, 224 )
	Team1Line0:setAlpha( 0.2 )
	Team1Line0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line0 )
	self.Team1Line0 = Team1Line0
	
	local FEButtonPanel10 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel10:setLeftRight( 0, 0, 0, 250 )
	FEButtonPanel10:setTopBottom( 0, 0, -37, 4 )
	FEButtonPanel10:setRGB( 0, 0, 0 )
	FEButtonPanel10:setAlpha( 0.35 )
	self:addElement( FEButtonPanel10 )
	self.FEButtonPanel10 = FEButtonPanel10
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( 0, 0, 6, 162 )
	Text:setTopBottom( 0, 0, -34, 4 )
	Text:setText( Engine.Localize( "MENU_BANS_PROTECTS_CAPS" ) )
	Text:setTTF( "fonts/default.ttf" )
	Text:setLetterSpacing( 1 )
	self:addElement( Text )
	self.Text = Text
	
	local horizontalCounter0 = CoD.horizontalCounter.new( menu, controller )
	horizontalCounter0:setLeftRight( 0.5, 0.5, -166, 134 )
	horizontalCounter0:setTopBottom( 0, 0, 235, 273 )
	LUI.OverrideFunction_CallOriginalFirst( horizontalCounter0, "setModel", function ( element, model )
		SetAsListHorizontalCounter( self, element, "VoteList" )
	end )
	self:addElement( horizontalCounter0 )
	self.horizontalCounter0 = horizontalCounter0
	
	horizontalCounter0:linkToElementModel( VoteList, nil, false, function ( model )
		horizontalCounter0:setModel( model, controller )
	end )
	VoteList.id = "VoteList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.VoteList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel1:close()
		self.PregameBanProtectFrame:close()
		self.PregameBanProtectFrame0:close()
		self.PregameBanProtectFrame1:close()
		self.PregameBanProtectFrame00:close()
		self.PregameBanProtectFrame2:close()
		self.PregameBanProtectFrame01:close()
		self.PregameBanProtectFrame10:close()
		self.PregameBanProtectFrame000:close()
		self.PregameBanProtectFrame100:close()
		self.PregameBanProtectFrame0000:close()
		self.VoteList:close()
		self.FEButtonPanel10:close()
		self.horizontalCounter0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

