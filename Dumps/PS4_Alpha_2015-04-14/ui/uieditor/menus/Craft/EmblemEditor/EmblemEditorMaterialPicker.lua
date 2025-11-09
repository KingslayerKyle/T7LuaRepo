require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemDrawWidgetNew" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.MaterialPicker.EmblemEditorMaterialSwatch" )
require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )

LUI.createMenu.EmblemEditorMaterialPicker = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmblemEditorMaterialPicker" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "SelectColor"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local HelpBacking00 = LUI.UIImage.new()
	HelpBacking00:setLeftRight( true, true, 0, 0 )
	HelpBacking00:setTopBottom( false, false, 292, 294 )
	HelpBacking00:setRGB( 0.01, 0.02, 0.02 )
	HelpBacking00:setAlpha( 0.7 )
	HelpBacking00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HelpBacking00 )
	self.HelpBacking00 = HelpBacking00
	
	local TitleBacking00 = LUI.UIImage.new()
	TitleBacking00:setLeftRight( false, false, -640, 640 )
	TitleBacking00:setTopBottom( false, false, -360, -274 )
	TitleBacking00:setRGB( 0, 0, 0 )
	TitleBacking00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( TitleBacking00 )
	self.TitleBacking00 = TitleBacking00
	
	local ScreenBkgd = LUI.UIImage.new()
	ScreenBkgd:setLeftRight( true, true, 0, 0 )
	ScreenBkgd:setTopBottom( true, true, 0, 0 )
	ScreenBkgd:setRGB( 0, 0, 0 )
	ScreenBkgd:setAlpha( 0 )
	ScreenBkgd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ScreenBkgd )
	self.ScreenBkgd = ScreenBkgd
	
	local emblemDrawWidget0 = CoD.EmblemDrawWidgetNew.new( self, controller )
	emblemDrawWidget0:setLeftRight( true, false, 424.5, 882.5 )
	emblemDrawWidget0:setTopBottom( true, false, 143, 423.5 )
	emblemDrawWidget0:setRGB( 1, 1, 1 )
	self:addElement( emblemDrawWidget0 )
	self.emblemDrawWidget0 = emblemDrawWidget0
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 64, 696 )
	title:setTopBottom( true, false, 28, 76 )
	title:setRGB( 0.87, 0.88, 0.78 )
	title:setAlpha( 0 )
	title:setText( Engine.Localize( "MENU_EDIT_LAYER_MATERIAL" ) )
	title:setTTF( "fonts/escom.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	title.buttonPromptAddFunctions = {}
	title.buttonPromptAddFunctions.primary = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "A", element )
			return true
		else
			
		end
	end
	
	title.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		if element:isInFocus() then
			menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
			return true
		else
			
		end
	end
	
	title:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "A") and element:isInFocus() then
			GoBack( self, controller )
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") and element:isInFocus() then
			GoBack( self, controller )
			return true
		elseif not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	title:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		element.buttonPromptAddFunctions.primary( self, element, event )
		element.buttonPromptAddFunctions.secondary( self, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return true
	end )
	title:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		self:removeButtonPrompt( "primary", element )
		self:removeButtonPrompt( "secondary", element )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( title )
	self.title = title
	
	local materialSwatch = CoD.EmblemEditorMaterialSwatch.new( self, controller )
	materialSwatch:setLeftRight( true, false, 282, 953 )
	materialSwatch:setTopBottom( true, false, 470.5, 631.5 )
	materialSwatch:setRGB( 1, 1, 1 )
	self:addElement( materialSwatch )
	self.materialSwatch = materialSwatch
	
	local FooterBacking = LUI.UIImage.new()
	FooterBacking:setLeftRight( false, false, -640, 640 )
	FooterBacking:setTopBottom( false, false, 297, 360 )
	FooterBacking:setRGB( 0, 0, 0 )
	FooterBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( FooterBacking )
	self.FooterBacking = FooterBacking
	
	local TitleEditLayer = CoD.cac_3dTitleIntermediary.new( self, controller )
	TitleEditLayer:setLeftRight( true, false, -72, 537 )
	TitleEditLayer:setTopBottom( true, false, -4, 142 )
	TitleEditLayer:setRGB( 1, 1, 1 )
	TitleEditLayer.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EDIT_LAYER_MATERIAL" ) )
	self:addElement( TitleEditLayer )
	self.TitleEditLayer = TitleEditLayer
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 0, 1280 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	emblemDrawWidget0.navigation = {
		down = materialSwatch
	}
	materialSwatch.navigation = {
		up = emblemDrawWidget0
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Paintshop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 0 )
				self.clipFinished( ScreenBkgd, {} )
			end
		},
		EmblemEditor = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ScreenBkgd:completeAnimation()
				self.ScreenBkgd:setAlpha( 1 )
				self.clipFinished( ScreenBkgd, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Paintshop",
			condition = function ( menu, element, event )
				return IsPaintshop( controller )
			end
		},
		{
			stateName = "EmblemEditor",
			condition = function ( menu, element, event )
				return IsEmblemEditor( controller )
			end
		}
	} )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_SELECT" ), "A", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
		end
		if not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "A") then
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	emblemDrawWidget0.id = "emblemDrawWidget0"
	materialSwatch.id = "materialSwatch"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.emblemDrawWidget0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.emblemDrawWidget0:close()
		self.materialSwatch:close()
		self.TitleEditLayer:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

