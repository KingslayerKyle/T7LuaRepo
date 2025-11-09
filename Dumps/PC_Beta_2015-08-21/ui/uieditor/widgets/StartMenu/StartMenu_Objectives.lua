require( "ui.uieditor.widgets.StartMenu.Startmenu_Objectives_Title" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Objectives_Item" )

CoD.StartMenu_Objectives = InheritFrom( LUI.UIElement )
CoD.StartMenu_Objectives.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Objectives )
	self.id = "StartMenu_Objectives"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 625 )
	self:setTopBottom( true, false, 0, 300 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local StartmenuObjectivesTitle = CoD.Startmenu_Objectives_Title.new( menu, controller )
	StartmenuObjectivesTitle:setLeftRight( true, false, 0, 352 )
	StartmenuObjectivesTitle:setTopBottom( true, false, 0, 50 )
	self:addElement( StartmenuObjectivesTitle )
	self.StartmenuObjectivesTitle = StartmenuObjectivesTitle
	
	local objectives = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	objectives:makeFocusable()
	objectives:setLeftRight( true, false, 0, 1170 )
	objectives:setTopBottom( true, false, 50, 291 )
	objectives:setDataSource( "MissionObjectives" )
	objectives:setWidgetType( CoD.StartMenu_Objectives_Item )
	objectives:setVerticalCount( 9 )
	self:addElement( objectives )
	self.objectives = objectives
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				objectives:completeAnimation()
				self.objectives:setAlpha( 1 )
				self.clipFinished( objectives, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				objectives:completeAnimation()
				self.objectives:setAlpha( 0 )
				self.clipFinished( objectives, {} )
			end
		}
	}
	objectives.id = "objectives"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.objectives:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartmenuObjectivesTitle:close()
		element.objectives:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

