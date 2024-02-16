-- a0eb00021c8bddab0bb48bdb2fdaed57
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.DOA_outro_frame = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DOA_outro_frame" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DOA_outro_frame.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local feLeftContainer = CoD.fe_LeftContainer_NOTLobby.new( f1_local1, controller )
	feLeftContainer:setLeftRight( false, true, -280, 152 )
	feLeftContainer:setTopBottom( false, true, -80, -36 )
	self:addElement( feLeftContainer )
	self.feLeftContainer = feLeftContainer
	
	local WinnerButtonPress = LUI.UIText.new()
	WinnerButtonPress:setLeftRight( true, false, 861, 1216 )
	WinnerButtonPress:setTopBottom( true, false, 660, 684 )
	WinnerButtonPress:setText( Engine.Localize( "CP_DOA_BO3_WINNER_PRESS_BIND" ) )
	WinnerButtonPress:setTTF( "fonts/default.ttf" )
	WinnerButtonPress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	WinnerButtonPress:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WinnerButtonPress )
	self.WinnerButtonPress = WinnerButtonPress
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				feLeftContainer:completeAnimation()
				self.feLeftContainer:setAlpha( 1 )
				self.clipFinished( feLeftContainer, {} )
				WinnerButtonPress:completeAnimation()
				self.WinnerButtonPress:setAlpha( 0 )
				self.clipFinished( WinnerButtonPress, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				feLeftContainer:completeAnimation()
				self.feLeftContainer:setAlpha( 0 )
				self.clipFinished( feLeftContainer, {} )
				WinnerButtonPress:completeAnimation()
				self.WinnerButtonPress:setAlpha( 1 )
				self.clipFinished( WinnerButtonPress, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return IsPC()
			end
		}
	} )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		if ShouldSwapCircleAndCross() and not IsPC() then
			return true
		else
			
		end
	end, function ( f6_arg0, f6_arg1, f6_arg2 )
		if ShouldSwapCircleAndCross() and not IsPC() then
			CoD.Menu.SetButtonLabel( f6_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "CP_DOA_BO3_OUTRO_ABORT" )
			return true
		else
			return false
		end
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if not ShouldSwapCircleAndCross() and not IsPC() then
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if not ShouldSwapCircleAndCross() and not IsPC() then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "CP_DOA_BO3_OUTRO_ABORT" )
			return true
		else
			return false
		end
	end, false )
	feLeftContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feLeftContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "DOA_outro_frame.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

