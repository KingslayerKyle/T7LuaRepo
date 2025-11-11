require( "ui.uieditor.widgets.Groups.GroupsFrameNoBG" )
require( "ui.uieditor.widgets.Groups.GroupsSlider" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.GroupSlider = InheritFrom( LUI.UIElement )
CoD.GroupSlider.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupSlider )
	self.id = "GroupSlider"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 577 )
	self:setTopBottom( 0, 0, 0, 51 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local GroupsFrameNoBG0 = CoD.GroupsFrameNoBG.new( menu, controller )
	GroupsFrameNoBG0:setLeftRight( 0, 0, 0, 578 )
	GroupsFrameNoBG0:setTopBottom( 0, 0, 0, 51 )
	self:addElement( GroupsFrameNoBG0 )
	self.GroupsFrameNoBG0 = GroupsFrameNoBG0
	
	local Slider = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	Slider:makeFocusable()
	Slider:setLeftRight( 0, 0, 163, 415 )
	Slider:setTopBottom( 0, 0, 3, 48 )
	Slider:setWidgetType( CoD.GroupsSlider )
	Slider:setDataSource( "GroupPrivacyModes" )
	self:addElement( Slider )
	self.Slider = Slider
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -5, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.resetProperties = function ()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		}
	}
	Slider.id = "Slider"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Slider:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GroupsFrameNoBG0:close()
		self.Slider:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

