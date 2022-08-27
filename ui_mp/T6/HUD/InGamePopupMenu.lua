-- ac97cfab2231a63166ca5859cc248460
-- This hash is used for caching, delete to decompile the file again

require( "ui_mp.T6.HUD.InGameMenus" )

CoD.InGamePopupMenu = {}
CoD.InGamePopupMenu = InheritFrom( CoD.InGameMenu )
CoD.InGamePopupMenu.PopupWidth = 480
CoD.InGamePopupMenu.PopupHeight = 312
CoD.InGamePopupMenu.BackgroundTexture = CoD.MPZM( "menu_mp_popup", "menu_zm_popup" )
CoD.InGamePopupMenu.SavingPopupWidth = 200
CoD.InGamePopupMenu.SavingPopupHeight = CoD.textSize.Default + 10
CoD.InGamePopupMenu.SavingSpinnerSize = CoD.InGamePopupMenu.SavingPopupHeight - 5
CoD.InGamePopupMenu.SideAlign = 24
CoD.InGamePopupMenu.ButtonListBottom = 24
CoD.InGamePopupMenu.TitleTop = 24
CoD.InGamePopupMenu.TextTop = CoD.InGamePopupMenu.TitleTop + CoD.textSize.Default + 7
CoD.InGamePopupMenu.SavingBackground = "loadbar_background"
CoD.InGamePopupMenu.SavingSpinner = "lui_loader"
CoD.InGamePopupMenu.New = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4, f1_arg5, f1_arg6 )
	local f1_local0 = CoD.InGamePopupMenu.super.New( f1_arg0, f1_arg1, nil, f1_arg6 )
	f1_local0.setupPopup = CoD.InGamePopupMenu.SetupPopup
	f1_local0.setupSavingPopup = CoD.InGamePopupMenu.SetupSavingPopup
	if f1_arg2 == "saving" then
		f1_local0:setupSavingPopup( f1_arg3 )
	else
		CoD.InGameMenu.addButtonPrompts( f1_local0 )
		f1_local0:setupPopup( f1_arg3, f1_arg4, f1_arg5 )
	end
	return f1_local0
end

CoD.InGamePopupMenu.SetupPopup = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local self = LUI.UIElement.new()
	self:setLeftRight( false, false, -CoD.InGamePopupMenu.PopupWidth / 2, CoD.InGamePopupMenu.PopupWidth / 2 )
	self:setTopBottom( false, false, -CoD.InGamePopupMenu.PopupHeight / 2, CoD.InGamePopupMenu.PopupHeight / 2 )
	local f2_local1 = LUI.UIImage.new()
	f2_local1:setLeftRight( true, true, 0, 0 )
	f2_local1:setTopBottom( true, true, 0, 0 )
	f2_local1:setImage( RegisterMaterial( CoD.InGamePopupMenu.BackgroundTexture ) )
	self:addElement( f2_local1 )
	
	local titleText = LUI.UIText.new()
	titleText:setLeftRight( true, true, CoD.InGamePopupMenu.SideAlign, -CoD.InGamePopupMenu.SideAlign )
	titleText:setTopBottom( true, false, CoD.InGamePopupMenu.TitleTop, CoD.InGamePopupMenu.TitleTop + CoD.textSize.Default )
	titleText:setFont( CoD.fonts.Default )
	titleText:setAlignment( LUI.Alignment.Left )
	titleText:setText( f2_arg1 )
	self:addElement( titleText )
	f2_arg0.titleText = titleText
	
	local descText = LUI.UIText.new()
	descText:setLeftRight( true, true, CoD.InGamePopupMenu.SideAlign, -CoD.InGamePopupMenu.SideAlign )
	descText:setTopBottom( true, false, CoD.InGamePopupMenu.TextTop, CoD.InGamePopupMenu.TextTop + CoD.textSize.Default )
	descText:setFont( CoD.fonts.Default )
	descText:setAlignment( LUI.Alignment.Left )
	descText:setText( f2_arg2 )
	self:addElement( descText )
	f2_arg0.descText = descText
	
	local buttonList = CoD.ButtonList.new()
	local f2_local5 = -1 * (CoD.CoD9Button.Height * (#f2_arg3 + 1) + CoD.ButtonList.ButtonSpacing * (#f2_arg3 + 1))
	buttonList:setLeftRight( true, true, CoD.InGamePopupMenu.SideAlign, -CoD.InGamePopupMenu.SideAlign )
	buttonList:setTopBottom( false, true, f2_local5, 0 )
	for f2_local9, f2_local10 in ipairs( f2_arg3 ) do
		local f2_local11 = buttonList:addButton( f2_local10.text )
		f2_local11:setActionEventName( f2_local10.event )
	end
	buttonList:processEvent( {
		name = "gain_focus"
	} )
	self:addElement( buttonList )
	f2_arg0.buttonList = buttonList
	
	f2_arg0.background = self
	f2_arg0:addElement( self )
end

CoD.InGamePopupMenu.SetupSavingPopup = function ( f3_arg0, f3_arg1 )
	local f3_local0 = CoD.fonts.Default
	local f3_local1 = CoD.textSize.Default
	local f3_local2, f3_local3, f3_local4, f3_local5 = GetTextDimensions( f3_arg1, f3_local0, f3_local1 )
	local f3_local6 = f3_local4 - f3_local2
	local f3_local7 = 20
	local self = LUI.UIElement.new()
	local f3_local9 = f3_local6 + CoD.InGamePopupMenu.SavingSpinnerSize * 2 + f3_local7
	self:setLeftRight( false, false, -f3_local9 / 2, f3_local9 / 2 )
	self:setTopBottom( false, true, -CoD.InGamePopupMenu.SavingPopupHeight, 0 )
	local f3_local10 = LUI.UIImage.new()
	f3_local10:setLeftRight( true, true, 0, 0 )
	f3_local10:setTopBottom( true, true, 0, 0 )
	f3_local10:setImage( RegisterMaterial( CoD.InGamePopupMenu.SavingBackground ) )
	self:addElement( f3_local10 )
	local f3_local11 = LUI.UIText.new()
	f3_local11:setLeftRight( true, true, f3_local7, CoD.InGamePopupMenu.SavingSpinnerSize - f3_local7 )
	f3_local11:setTopBottom( false, false, -f3_local1 / 2, f3_local1 / 2 )
	f3_local11:setFont( f3_local0 )
	f3_local11:setAlignment( LUI.Alignment.Left )
	f3_local11:setText( f3_arg1 )
	self:addElement( f3_local11 )
	local f3_local12 = LUI.UIImage.new()
	f3_local12:setLeftRight( false, true, -CoD.InGamePopupMenu.SavingSpinnerSize - f3_local7, -f3_local7 )
	f3_local12:setTopBottom( false, false, -CoD.InGamePopupMenu.SavingSpinnerSize / 2, CoD.InGamePopupMenu.SavingSpinnerSize / 2 )
	f3_local12:setImage( RegisterMaterial( CoD.InGamePopupMenu.SavingSpinner ) )
	f3_local12:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( f3_local12 )
	f3_arg0.background = self
	f3_arg0:addElement( self )
end

CoD.InGamePopupMenu.newCustom = function ( f4_arg0, f4_arg1 )
	return CoD.InGamePopupMenu.super.New( f4_arg0, f4_arg1 )
end

