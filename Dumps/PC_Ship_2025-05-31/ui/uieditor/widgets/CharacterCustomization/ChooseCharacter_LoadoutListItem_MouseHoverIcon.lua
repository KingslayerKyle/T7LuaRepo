require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "help_bubble_state_changed", function ( element, event )
		if string.find( event.state, "Overview" ) or string.find( event.state, "ChangedCharacter" ) then
			element:setState( "Hidden" )
			element.m_defaultStateInFirstTimeFlow = false
		else
			element:setState( "DefaultState" )
			element.m_defaultStateInFirstTimeFlow = true
		end
	end )
	f1_arg0.m_defaultStateInFirstTimeFlow = false
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	if CoD.isPC then
		f0_local0( f3_arg0, f3_arg1 )
	end
end

CoD.ChooseCharacter_LoadoutListItem_MouseHoverIcon = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_LoadoutListItem_MouseHoverIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_LoadoutListItem_MouseHoverIcon )
	self.id = "ChooseCharacter_LoadoutListItem_MouseHoverIcon"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local MouseHoverIcon = LUI.UIImage.new()
	MouseHoverIcon:setLeftRight( true, true, 0, 0 )
	MouseHoverIcon:setTopBottom( true, true, 0, 0 )
	MouseHoverIcon:setAlpha( 0 )
	MouseHoverIcon:setImage( RegisterImage( "uie_t7_menu_mp_hero_mouse_hover_placeholder" ) )
	self:addElement( MouseHoverIcon )
	self.MouseHoverIcon = MouseHoverIcon
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( false, false, -44.5, 44.5 )
	FocusBarB0:setTopBottom( false, false, 50, 46 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( false, false, -44.5, 44.5 )
	FocusBarT:setTopBottom( false, false, -46, -50 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZRot( 180 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				MouseHoverIcon:completeAnimation()
				self.MouseHoverIcon:setAlpha( 0 )
				self.clipFinished( MouseHoverIcon, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 3 )
				MouseHoverIcon:completeAnimation()
				self.MouseHoverIcon:setAlpha( 0 )
				self.clipFinished( MouseHoverIcon, {} )
				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				MouseHoverIcon:completeAnimation()
				self.MouseHoverIcon:setAlpha( 0 )
				self.clipFinished( MouseHoverIcon, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )
				MouseHoverIcon:completeAnimation()
				self.MouseHoverIcon:setAlpha( 0 )
				self.clipFinished( MouseHoverIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f9_local0 = IsPC()
				if f9_local0 then
					f9_local0 = IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER )
					if f9_local0 then
						f9_local0 = not PropertyIsTrue( self, "m_defaultStateInFirstTimeFlow" )
					end
				end
				return f9_local0
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FocusBarB0:close()
		element.FocusBarT:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

