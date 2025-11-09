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
	self:setLeftRight( true, false, 0, 460 )
	self:setTopBottom( true, false, 0, 300 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local objectives = LUI.UIList.new( menu, controller, 3, 0, nil, false, false, 0, 0, false, false )
	objectives:makeFocusable()
	objectives:setLeftRight( true, false, 45, 459 )
	objectives:setTopBottom( true, false, 46, 376 )
	objectives:setWidgetType( CoD.StartMenu_Objectives_Item )
	objectives:setVerticalCount( 9 )
	objectives:setSpacing( 3 )
	objectives:setDataSource( "MissionObjectives" )
	self:addElement( objectives )
	self.objectives = objectives
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( true, false, 0, 442 )
	SecTitleBG:setTopBottom( true, false, 0, 47.07 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_titlebig_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local ResistanceTitle = LUI.UIText.new()
	ResistanceTitle:setLeftRight( true, false, 46, 430 )
	ResistanceTitle:setTopBottom( true, false, 12, 34 )
	ResistanceTitle:setAlpha( 0.9 )
	ResistanceTitle:setText( Engine.Localize( "MENU_MISSIONOBJECTIVES_CAPS" ) )
	ResistanceTitle:setTTF( "fonts/escom.ttf" )
	ResistanceTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	ResistanceTitle:setShaderVector( 0, 0.06, 0, 0, 0 )
	ResistanceTitle:setShaderVector( 1, 0.02, 0, 0, 0 )
	ResistanceTitle:setShaderVector( 2, 1, 0, 0, 0 )
	ResistanceTitle:setLetterSpacing( 2 )
	ResistanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResistanceTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ResistanceTitle )
	self.ResistanceTitle = ResistanceTitle
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 2, 30 )
	Image3:setTopBottom( true, false, -1, 3 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 2, 30 )
	Image30:setTopBottom( true, false, 44, 48 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
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
		element.objectives:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

