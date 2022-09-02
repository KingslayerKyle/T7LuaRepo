-- 9afcf151197f1e01a895b3b1453ec194
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 1146 )
	self:setTopBottom( true, false, 0, 167 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Team2Vignette0 = LUI.UIImage.new()
	Team2Vignette0:setLeftRight( true, false, -196.5, 1317.5 )
	Team2Vignette0:setTopBottom( true, false, -262, 212 )
	Team2Vignette0:setImage( RegisterImage( "uie_t7_mp_menu_startflow_vignette" ) )
	Team2Vignette0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( Team2Vignette0 )
	self.Team2Vignette0 = Team2Vignette0
	
	local FEButtonPanel1 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel1:setLeftRight( true, false, -103.29, 1230.5 )
	FEButtonPanel1:setTopBottom( true, false, 39.84, 144.5 )
	FEButtonPanel1:setRGB( 0, 0, 0 )
	FEButtonPanel1:setAlpha( 0.65 )
	self:addElement( FEButtonPanel1 )
	self.FEButtonPanel1 = FEButtonPanel1
	
	local PregameBanProtectFrame = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame:setLeftRight( true, false, 0, 108 )
	PregameBanProtectFrame:setTopBottom( true, false, 38, 146 )
	PregameBanProtectFrame:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame )
	self.PregameBanProtectFrame = PregameBanProtectFrame
	
	local PregameBanProtectFrame0 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0:setLeftRight( true, false, 113, 221 )
	PregameBanProtectFrame0:setTopBottom( true, false, 38, 146 )
	PregameBanProtectFrame0:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0 )
	self.PregameBanProtectFrame0 = PregameBanProtectFrame0
	
	local PregameBanProtectFrame1 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame1:setLeftRight( true, false, 226, 334 )
	PregameBanProtectFrame1:setTopBottom( true, false, 38, 146 )
	PregameBanProtectFrame1:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame1 )
	self.PregameBanProtectFrame1 = PregameBanProtectFrame1
	
	local PregameBanProtectFrame00 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame00:setLeftRight( true, false, 339, 447 )
	PregameBanProtectFrame00:setTopBottom( true, false, 38, 146 )
	PregameBanProtectFrame00:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame00 )
	self.PregameBanProtectFrame00 = PregameBanProtectFrame00
	
	local PregameBanProtectFrame2 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame2:setLeftRight( true, false, 452.5, 560.5 )
	PregameBanProtectFrame2:setTopBottom( true, false, 38, 146 )
	PregameBanProtectFrame2:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame2 )
	self.PregameBanProtectFrame2 = PregameBanProtectFrame2
	
	local PregameBanProtectFrame01 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame01:setLeftRight( true, false, 565.5, 673.5 )
	PregameBanProtectFrame01:setTopBottom( true, false, 38, 146 )
	PregameBanProtectFrame01:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame01 )
	self.PregameBanProtectFrame01 = PregameBanProtectFrame01
	
	local PregameBanProtectFrame10 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame10:setLeftRight( true, false, 678.5, 786.5 )
	PregameBanProtectFrame10:setTopBottom( true, false, 38, 146 )
	PregameBanProtectFrame10:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame10 )
	self.PregameBanProtectFrame10 = PregameBanProtectFrame10
	
	local PregameBanProtectFrame000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame000:setLeftRight( true, false, 791.5, 899.5 )
	PregameBanProtectFrame000:setTopBottom( true, false, 38, 146 )
	PregameBanProtectFrame000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame000 )
	self.PregameBanProtectFrame000 = PregameBanProtectFrame000
	
	local PregameBanProtectFrame100 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame100:setLeftRight( true, false, 904.5, 1012.5 )
	PregameBanProtectFrame100:setTopBottom( true, false, 38, 146 )
	PregameBanProtectFrame100:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame100 )
	self.PregameBanProtectFrame100 = PregameBanProtectFrame100
	
	local PregameBanProtectFrame0000 = CoD.Pregame_BanProtectFrame.new( menu, controller )
	PregameBanProtectFrame0000:setLeftRight( true, false, 1017.5, 1125.5 )
	PregameBanProtectFrame0000:setTopBottom( true, false, 38, 146 )
	PregameBanProtectFrame0000:setAlpha( 0.35 )
	self:addElement( PregameBanProtectFrame0000 )
	self.PregameBanProtectFrame0000 = PregameBanProtectFrame0000
	
	local VoteList = LUI.UIList.new( menu, controller, 5, 0, nil, false, false, 0, 0, false, false )
	VoteList:makeFocusable()
	VoteList:setLeftRight( true, false, 0, 1125 )
	VoteList:setTopBottom( true, false, 38, 146 )
	VoteList:setWidgetType( CoD.Pregame_VoteItem )
	VoteList:setHorizontalCount( 10 )
	VoteList:setSpacing( 5 )
	VoteList:setDataSource( "PregameItemVotes" )
	VoteList:mergeStateConditions( {
		{
			stateName = "ShowHeader",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( VoteList )
	self.VoteList = VoteList
	
	local Team1Line = LUI.UIImage.new()
	Team1Line:setLeftRight( true, false, -208, 1387 )
	Team1Line:setTopBottom( true, false, 34.5, 42.5 )
	Team1Line:setAlpha( 0.2 )
	Team1Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line )
	self.Team1Line = Team1Line
	
	local Team1Line0 = LUI.UIImage.new()
	Team1Line0:setLeftRight( true, false, -208, 1387 )
	Team1Line0:setTopBottom( true, false, 141.5, 149.5 )
	Team1Line0:setAlpha( 0.2 )
	Team1Line0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line0 )
	self.Team1Line0 = Team1Line0
	
	local FEButtonPanel10 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel10:setLeftRight( true, false, 0, 167 )
	FEButtonPanel10:setTopBottom( true, false, -24.83, 2.83 )
	FEButtonPanel10:setRGB( 0, 0, 0 )
	FEButtonPanel10:setAlpha( 0.35 )
	self:addElement( FEButtonPanel10 )
	self.FEButtonPanel10 = FEButtonPanel10
	
	local Text = LUI.UITightText.new()
	Text:setLeftRight( true, false, 4, 108 )
	Text:setTopBottom( true, false, -22.17, 2.83 )
	Text:setText( Engine.Localize( "MENU_BANS_PROTECTS_CAPS" ) )
	Text:setTTF( "fonts/default.ttf" )
	Text:setLetterSpacing( 1 )
	self:addElement( Text )
	self.Text = Text
	
	local horizontalCounter0 = CoD.horizontalCounter.new( menu, controller )
	horizontalCounter0:setLeftRight( false, false, -110.4, 89.6 )
	horizontalCounter0:setTopBottom( true, false, 156.5, 181.5 )

	LUI.OverrideFunction_CallOriginalFirst( horizontalCounter0, "setModel", function ( element, controller )
		SetAsListHorizontalCounter( self, element, "VoteList" )
	end )
	self:addElement( horizontalCounter0 )
	self.horizontalCounter0 = horizontalCounter0
	
	horizontalCounter0:linkToElementModel( VoteList, nil, false, function ( model )
		horizontalCounter0:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	VoteList.id = "VoteList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.VoteList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel1:close()
		element.PregameBanProtectFrame:close()
		element.PregameBanProtectFrame0:close()
		element.PregameBanProtectFrame1:close()
		element.PregameBanProtectFrame00:close()
		element.PregameBanProtectFrame2:close()
		element.PregameBanProtectFrame01:close()
		element.PregameBanProtectFrame10:close()
		element.PregameBanProtectFrame000:close()
		element.PregameBanProtectFrame100:close()
		element.PregameBanProtectFrame0000:close()
		element.VoteList:close()
		element.FEButtonPanel10:close()
		element.horizontalCounter0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

