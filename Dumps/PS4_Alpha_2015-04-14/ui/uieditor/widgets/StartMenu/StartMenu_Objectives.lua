require( "ui.uieditor.widgets.StartMenu.StartMenu_Objectives_Item" )

CoD.StartMenu_Objectives = InheritFrom( LUI.UIElement )
CoD.StartMenu_Objectives.new = function ( menu, controller )
	local self = LUI.UIElement.new()
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
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, 321 )
	title:setTopBottom( true, false, 0, 25 )
	title:setRGB( 1, 1, 1 )
	title:setText( Engine.Localize( "MENU_MISSIONOBJECTIVES_CAPS" ) )
	title:setTTF( "fonts/Entovo.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local objectives = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	objectives:makeFocusable()
	objectives:setLeftRight( true, false, 0, 1170 )
	objectives:setTopBottom( true, false, 29.5, 270.5 )
	objectives:setRGB( 1, 1, 1 )
	objectives:setDataSource( "MissionObjectives" )
	objectives:setWidgetType( CoD.StartMenu_Objectives_Item )
	objectives:setVerticalCount( 9 )
	self:addElement( objectives )
	self.objectives = objectives
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				title:completeAnimation()
				self.title:setAlpha( 1 )
				self.clipFinished( title, {} )
				objectives:completeAnimation()
				self.objectives:setAlpha( 1 )
				self.clipFinished( objectives, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )
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
	self.close = function ( self )
		self.objectives:close()
		CoD.StartMenu_Objectives.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

