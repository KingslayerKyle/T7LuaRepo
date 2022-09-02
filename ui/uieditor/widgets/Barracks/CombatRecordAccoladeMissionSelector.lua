-- bd854552393a204cddc8dd34072bbed3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )
require( "ui.uieditor.widgets.Barracks.CombatRecordAccoladeMissionSelectPip" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordAccolades" )
	local f1_local1 = Engine.GetModel( f1_local0, "mapName" )
	local f1_local2 = Engine.GetModel( f1_local0, "unique_id" )
	Engine.SetModelValue( f1_local1, "CPUI_CP_MI_ETH_PROLOGUE" )
	Engine.SetModelValue( f1_local2, 200 )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.missionName:subscribeToModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f2_arg1 ), "CombatRecordAccolades" ), "unique_id" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			local f3_local1 = CoD.GetMapDataFromMapID( modelValue )
			f2_arg0.missionName:setText( Engine.Localize( f3_local1.mapNameCaps ) )
			Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "nextMap" ), f3_local1.rootMapName )
		end
	end )
end

CoD.CombatRecordAccoladeMissionSelector = InheritFrom( LUI.UIElement )
CoD.CombatRecordAccoladeMissionSelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordAccoladeMissionSelector )
	self.id = "CombatRecordAccoladeMissionSelector"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 45 )
	self.anyChildUsesUpdateState = true
	
	local LBBumperButtonWithKeyMouse = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	LBBumperButtonWithKeyMouse:setLeftRight( true, false, 0, 45 )
	LBBumperButtonWithKeyMouse:setTopBottom( true, false, 4, 34 )
	LBBumperButtonWithKeyMouse:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			LBBumperButtonWithKeyMouse.ControllerImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	LBBumperButtonWithKeyMouse:registerEventHandler( "button_action", function ( element, event )
		local f6_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_LB )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:addElement( LBBumperButtonWithKeyMouse )
	self.LBBumperButtonWithKeyMouse = LBBumperButtonWithKeyMouse
	
	local RBBumperButtonWithKeyMouse = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	RBBumperButtonWithKeyMouse:setLeftRight( false, true, -45, 0 )
	RBBumperButtonWithKeyMouse:setTopBottom( true, false, 4, 34 )
	RBBumperButtonWithKeyMouse.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	RBBumperButtonWithKeyMouse:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local rightShoulderButtonImage = Engine.GetModelValue( model )
		if rightShoulderButtonImage then
			RBBumperButtonWithKeyMouse.ControllerImage:setImage( RegisterImage( rightShoulderButtonImage ) )
		end
	end )
	RBBumperButtonWithKeyMouse:registerEventHandler( "button_action", function ( element, event )
		local f8_local0 = nil
		SendButtonPressToMenuEx( menu, controller, Enum.LUIButton.LUI_KEY_RB )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:addElement( RBBumperButtonWithKeyMouse )
	self.RBBumperButtonWithKeyMouse = RBBumperButtonWithKeyMouse
	
	local missionName = LUI.UIText.new()
	missionName:setLeftRight( true, false, 45, 235 )
	missionName:setTopBottom( true, false, 5, 30 )
	missionName:setText( Engine.Localize( "CPUI_CP_MI_ETH_PROLOGUE" ) )
	missionName:setTTF( "fonts/default.ttf" )
	missionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	missionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( missionName )
	self.missionName = missionName
	
	local pipList = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	pipList:setLeftRight( false, false, -69, 69 )
	pipList:setTopBottom( true, false, 36, 44 )
	pipList:setDataSource( "CPMapsList" )
	pipList:setWidgetType( CoD.CombatRecordAccoladeMissionSelectPip )
	pipList:setHorizontalCount( 14 )
	self:addElement( pipList )
	self.pipList = pipList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				LBBumperButtonWithKeyMouse:completeAnimation()
				self.LBBumperButtonWithKeyMouse:setAlpha( 1 )
				self.clipFinished( LBBumperButtonWithKeyMouse, {} )

				RBBumperButtonWithKeyMouse:completeAnimation()
				self.RBBumperButtonWithKeyMouse:setAlpha( 1 )
				self.clipFinished( RBBumperButtonWithKeyMouse, {} )

				missionName:completeAnimation()
				self.missionName:setAlpha( 1 )
				self.clipFinished( missionName, {} )

				pipList:completeAnimation()
				self.pipList:setAlpha( 1 )
				self.clipFinished( pipList, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LBBumperButtonWithKeyMouse:close()
		element.RBBumperButtonWithKeyMouse:close()
		element.pipList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

