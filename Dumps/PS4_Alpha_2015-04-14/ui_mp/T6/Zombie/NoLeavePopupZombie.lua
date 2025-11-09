CoD.NoLeave = {}
LUI.createMenu.NoLeave = function ( controller, leaveHandlerTextTable )
	local noLeaveMenu = CoD.Menu.NewSmallPopup( "NoLeave" )
	noLeaveMenu:addBackButton()
	local top = 0
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, CoD.Menu.SmallPopupWidth )
	title:setTopBottom( true, false, top, top + CoD.textSize.Big )
	title:setFont( CoD.fonts.Big )
	title:setAlignment( LUI.Alignment.Left )
	title:setText( Engine.Localize( "MENU_NOTICE" ) )
	noLeaveMenu:addElement( title )
	top = top + CoD.textSize.Big
	local msg = LUI.UIText.new()
	msg:setLeftRight( true, true, 0, 0 )
	msg:setTopBottom( true, false, top, top + CoD.textSize.Default )
	msg:setFont( CoD.fonts.Default )
	msg:setAlignment( LUI.Alignment.Left )
	noLeaveMenu:addElement( msg )
	msg:setText( Engine.Localize( "ZMUI_NO_LEAVE_LOBBY" ) )
	Engine.PlaySound( "caC_main_exit_cac" )
	return noLeaveMenu
end

