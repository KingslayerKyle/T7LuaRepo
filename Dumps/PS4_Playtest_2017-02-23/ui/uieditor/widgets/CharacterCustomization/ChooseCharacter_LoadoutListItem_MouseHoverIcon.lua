require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PCSpecific = function ( self, controller )
	self:registerEventHandler( "help_bubble_state_changed", function ( self, event )
		if string.find( event.state, "Overview" ) or string.find( event.state, "ChangedCharacter" ) then
			self:setState( "Hidden" )
			self.m_defaultStateInFirstTimeFlow = false
		else
			self:setState( "DefaultState" )
			self.m_defaultStateInFirstTimeFlow = true
		end
	end )
	self.m_defaultStateInFirstTimeFlow = false
end

local PostLoadFunc = function ( self, controller )
	if CursorInputEnabledForBuild() then
		PCSpecific( self, controller )
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
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 150 )
	self.anyChildUsesUpdateState = true
	
	local MouseHoverIcon = LUI.UIImage.new()
	MouseHoverIcon:setLeftRight( 0, 1, 0, 0 )
	MouseHoverIcon:setTopBottom( 0, 1, 0, 0 )
	MouseHoverIcon:setAlpha( 0 )
	MouseHoverIcon:setImage( RegisterImage( "uie_t7_menu_mp_hero_mouse_hover_placeholder" ) )
	self:addElement( MouseHoverIcon )
	self.MouseHoverIcon = MouseHoverIcon
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( 0.5, 0.5, -67, 67 )
	FocusBarB0:setTopBottom( 0.5, 0.5, 75, 69 )
	FocusBarB0:setAlpha( 0 )
	FocusBarB0:setZoom( 1 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0.5, 0.5, -67, 67 )
	FocusBarT:setTopBottom( 0.5, 0.5, -69, -75 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZRot( 180 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.resetProperties = function ()
		FocusBarT:completeAnimation()
		FocusBarB0:completeAnimation()
		FocusBarT:setAlpha( 0 )
		FocusBarB0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f10_local0 = IsPC()
				if f10_local0 then
					f10_local0 = IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER )
					if f10_local0 then
						f10_local0 = not PropertyIsTrue( self, "m_defaultStateInFirstTimeFlow" )
					end
				end
				return f10_local0
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FocusBarB0:close()
		self.FocusBarT:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

