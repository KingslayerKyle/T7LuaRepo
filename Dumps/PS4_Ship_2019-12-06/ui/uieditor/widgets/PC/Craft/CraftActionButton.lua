require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setHandleMouse( true )
	f1_arg0:registerEventHandler( "leftmouseup", function ( element, event )
		if f1_arg0.m_button then
			f1_arg0:playClip( "Flash" )
			if f1_arg0.m_isDpad then
				CoD.PCUtil.SimulateDPadButtonPress( f1_arg1, f1_arg0.m_button )
			else
				CoD.PCUtil.SimulateButtonPress( f1_arg1, f1_arg0.m_button )
			end
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( f1_arg0, "setModel", function ( element, controller )
		local f3_local0 = CoD.PCUtil.GetModelValues( controller, {
			"perControllerStatusModel",
			"getStatusTable"
		} )
		if f3_local0 and f3_local0.perControllerStatusModel then
			element:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg1 ), f3_local0.perControllerStatusModel ), function ( model )
				local modelValue = Engine.GetModelValue( model )
				if f3_local0.getStatusTable then
					local f4_local1 = f3_local0.getStatusTable()
					local f4_local2 = f4_local1[modelValue]
					if f4_local2 and f4_local2.label then
						element.actionName:setText( Engine.Localize( f4_local2.label ) )
					end
				end
			end )
		end
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.CraftActionButton = InheritFrom( LUI.UIElement )
CoD.CraftActionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CraftActionButton )
	self.id = "CraftActionButton"
	self.soundSet = "SelectColor"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local fullBackground = LUI.UIImage.new()
	fullBackground:setLeftRight( true, true, 0, 0 )
	fullBackground:setTopBottom( true, true, 0, 0 )
	fullBackground:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( fullBackground )
	self.fullBackground = fullBackground
	
	local flash = LUI.UIImage.new()
	flash:setLeftRight( true, true, 0, 0 )
	flash:setTopBottom( true, true, 0, 0 )
	flash:setRGB( 1, 0.47, 0 )
	flash:setAlpha( 0 )
	self:addElement( flash )
	self.flash = flash
	
	local actionName = LUI.UIText.new()
	actionName:setLeftRight( true, false, 7, 207 )
	actionName:setTopBottom( true, false, 0, 20 )
	actionName:setTTF( "fonts/default.ttf" )
	actionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	actionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( actionName )
	self.actionName = actionName
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -2.75, 2.75 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 2, 0 )
	FocusBarT:setTopBottom( true, false, -2, 2 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.actionName:linkToElementModel( self, "actionName", true, function ( model )
		local _actionName = Engine.GetModelValue( model )
		if _actionName then
			actionName:setText( Engine.Localize( _actionName ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0.5 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0.5 )
				self.clipFinished( FocusBarT, {} )
			end,
			Flash = function ()
				self:setupElementClipCounter( 1 )
				local flashFrame2 = function ( flash, event )
					local flashFrame3 = function ( flash, event )
						if not event.interrupted then
							flash:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						end
						flash:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( flash, event )
						else
							flash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						flashFrame3( flash, event )
						return 
					else
						flash:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						flash:setAlpha( 1 )
						flash:registerEventHandler( "transition_complete_keyframe", flashFrame3 )
					end
				end
				
				flash:completeAnimation()
				self.flash:setAlpha( 0 )
				flashFrame2( flash, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.actionName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

